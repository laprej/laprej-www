---
title: Disciplined Inconsistency
layout: post
description: |
  Disciplined inconsistency aims to help programmers reason about inconsistency in distributed applications, but depending on what your application needs, there are two ways of looking at error tolerance.
---

In order scale services with tight performance requirements, distributed systems programmers are forced to accept stale or inconsistent data. Typically this means using an eventually consistent data store like Amazon's [Dynamo][], [MongoDB][], or [Riak][]. Reads under these relaxed consistency models may not be strictly serializable, but programmers get a since that in most circumstances the values returned are relatively recent. For the most part, applications that run on eventual consistency, like Twitter, tolerate these inconsistencies because of their physically distributed nature and the fact that they're perceived as best-effort in any case.

However, even in "softer" applications like social networks, some guarantees shouldn't be violated. If an inconsistency causes, for instance, a security violation, then it will be a big problem. But there are fundamental limits to scaling strong consistency which we need to deal with somehow. So how do we get out of this?

If there was a way to express exactly what errors were acceptable in the application, then we could ensure that those were not violated, and we just might have enough slack to be able to give the scalability and performance we so desire.

I propose to help programmers deal with inconsistency in *disciplined* ways, using type systems and runtime support to let them express what kinds of errors are acceptable for their application, while allowing the system enough flexibility to allow it to scale.

There's a whole lot to talk about with regards to how this programming model might work, or how to implement it within high-performance data stores. But first we need to clear up what we might mean by *error tolerance* because it turns out we might be thinking of different things.

## Example: Twitter (again)

If you've heard me speak at all in the last, hmm, half a year at least, then you've probably heard me use this example, but just in case, I'll review it quickly here. *Retwis* is a Twitter clone built on Redis using its support for data structures. This is great because it means instead of using just keys and values, we can work with data structures like lists and sets. In this example, all that's important is that, in order to keep track of all the users who have retweeted a post with a `Set`.

![diagram of retweet set](?)

To retweet the post, users add themselves to the set.

![diagram of retweet](?)

When loading a timeline, we check the size of the set in order to display the number of times each post has been retweeted (we won't load the full list unless the user clicks on it).

![diagram of load timeline](?)

The problem with this is that though — as we covered [before](???) — adds commute, we can't concurrently get a consistent *size* of the set because it's constantly changing. In the spirit of eventually consistent replicated data stores, we can simply allow these racy reads anyway, and the answer we'll get back is probably pretty much alright. It can't be anything too crazy, for instance, the size isn't likely to be off by millions for one of my tweets.

## Error Tolerance

However, wouldn't it be nice to have some idea what the error is? Rather than simply accepting that it could be arbitrarily wrong but probably won't be, what if we could ensure that the error was acceptable for how I was using it. For instance, in Twitter, we have a pretty well-defined notion of what is acceptable: what is displayed to the user.

![retweet count]()

For tweets like Ellen's above that has been retweeted millions of times, we truncate it to a couple significant figures, so the count can be off by hundreds of thousands and still come out the same. Meanwhile my tweet, which has been retweeted 2 times (a lot for me), better have exactly the right answer otherwise I'll know (because one of them is probably my mother, who called to tell me she retweeted it).

This is the crux of what I've started calling *disciplined inconsistency:* the programming model should express what errors are tolerable for a given application. But this is where there are two ways to slice it.

### Bounded error

The way I've been thinking about bounding inconsistency is by having programmers express *error tolerances*. For instance above, you could say the `size()` operation must be within 5% of the correct answer: `size<0.05>()` . Then my assumption is that the system will ensure that this is the case, by either aborting the transaction containing my `size<0.05>` operation, or by preventing other `add` operations that would cause it to diverge too much. I would call this *bounded error*.

### Error bounds

However, I was talking to Allen [?] at EuroSys last week, and he gave me a different perspective. To him, the primary concern is getting an answer, any answer, either as fast as possible, or within a certain amount of time. A desire for high availability and low latency is what drives many to eventual consistency.

My solution flies in the face of that because enforcing some bound could delay some answers too long. What someone like Allen might instead prefer to do is to set a *latency bound*, where the data store tries to hold on as long as possible to give the most correct answer, but in the end returns something it knows is incorrect. In the case of these latency-bound operations, can we still deal with inconsistency in a *disciplined* way?

### Yes!

*We can return the error bound as part of the result of the operation!* The set of possible values is determined by the type of inconsistency or approximation use, so the way we represent the error bound or value distribution will vary. In the case of a racy size, we can return the interval of possible sizes based on all the adds that were in flight when the size was read, which we could use to display the most accurate count possible to the user:

![diagram of size interval and sig figs]()

If, on the other hand, the size came from a HyperLogLog, which keeps track of the approximate number of unique elements probabilistically, then the result might be expressed as a normal distribution around the floating point value typically produced by HLLs. [fact check?]

This idea came from chatting with my labmate [James][], first author on  [Uncertain<T>][]. In that work, rather than returning a single result from something with known uncertainty (such as a GPS sensor) operations can return results as a probability distribution over possible values. Exposing the distribution to the program allows it to make decisions based on likelihoods, such as a warning when a value is outside a given range with high confidence.

---

The programming model for disciplined inconsistency is becoming clearer. Depending on the use case, one may choose between two different error tolerance models:

1. *Bounded error:* ensure result satisfies certain criteria, blocking or aborting otherwise.
2. *Uncertain result:* result encodes the set or distribution over potential values, letting the programmer decide what action to take

I have many questions remaining, including:

- How can bounded error be enforced under replication?
- What is the overhead of measuring result uncertainty and is it low enough to tolerate?
- In what ways can we approximate to increase performance or scalability?
- Is this useful to programmers? Will they know where they can tolerate error?
- *Most importantly:* what will the clever, multi-layered name be for this system?

I will be beginning to answer some of these questions by implementing and evaluating them. Others will require more brainstorming and literature review. But I would love to hear from you if you have thoughts about any of them, so please reach out to me on Twitter!



[James]: http://homes.cs.washington.edu/~bornholt
[Uncertain<T>]: ???

