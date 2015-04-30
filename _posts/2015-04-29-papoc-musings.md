---
title: Musings from PaPoC
layout: default
description: |
  I had the privilege of presenting some of my work to many similarly-minded researchers at the PaPoC workshop last week. I got some great ideas from hearing about other relevant ongoing work and from insightful conversations with people there.
---

# Papoc Musings

<img src="{{site.base}}/img/papoy.jpg" class="pull-right" alt="Papoy!" />

The Workshop on Principles and Practice of Consistency (PaPoC) was co-located with EuroSys and took place the day before the conference proper began. This is the second year of the workshop, though my first time — slightly re-branded from last year that explicitly focused on *eventual consistency* — this year the call more broadly encouraged discussions about consistency models for distributed systems. This seemed like a good fit for some of my Claret work on using data types in distributed data stores, though I think [Luis][] was mostly behind the idea because he thought it sounded like ["Papoy!"](https://news.cs.washington.edu/2014/12/05/cse-holiday-party-2014/).

As it turns out, PaPoC was a fantastic choice for getting early feedback and ideas — I found many people with similar experience and interests at the workshop, particularly on CRDTs (Conflict-free/Commutative/Convergent Replicated Data Types) and lots of exciting ways of using them that I hadn't thought about before.

## Riak

<img src="{{site.base}}/img/riak-logo.png" class="pull-right" alt="Riak logo" />

[Riak][] is an eventually-consistent key-value store developed and maintained by [Basho Technologies][basho]. It's already shown up on my radar as a key-value store that supports complex data types — [CRDTs][Riak:CRDTs]. Built-in CRDTs include Counters ("Registers"), Flags (Maps with 1-bit values), Sets, and Maps (whose values can recursively be CRDTs). Riak developed these data types to help users wrangle with eventual consistency and build complex applications with fewer bugs. From the PaPoC attendees, it sounds like these CRDTs are being adopted by at least some of the users of Riak (it'd be cool to find some actual numbers).

What's even more useful about Riak is that it has been developed very modularly, with all of its components developed in the open on Github. These components include:

- [riak_core][]: handles various distributed tasks, such as cluster membership, partitioning, and liveness.
-  [riak_kv](https://github.com/basho/riak_kv): simple key-value store built on riak_core.
-  [riak_ensemble][]: implementation of Multi-Paxos (consensus groups) to enable consistent operations to be performed, which could in theory be used to implement full distributed transactions.

## SyncFree Project

Many of the attendees and organizers of PaPoC are involved in a big EU project related to scalable distributed systems called SyncFree. For my purposes, what is interesting is that it's a consortium of many universities and industry partners focused around improving the state-of-the-art in distributed programming models, data storage systems, and mobile platforms, and they seem to have taken a particular stance which leans heavily toward *eventual consistency* as necessary for providing high availability and scalability, for geo-replication as well as intermittently-connected mobile devices.

What's even better than a bunch of researchers thinking about distributed programming models? A group of researchers *cooperating to create shared software infrastructure to do it.* I don't think there's necessarily an explicit need to build systems that integrate with each other, but due to all of the cross-pollination between groups, many have coalesced around similar systems. I saw many presentations about systems built using various open source components from Riak. Some of these are grouped together in a project on Github called [Antidote][], a CRDT-based key-value store.

### Benchmark apps

Rovio is one of the industry partners of SyncFree, and my understanding is that they have contributed a benchmark application that involves synchronizing game state between multiple mobile devices and the cloud. I will have to look into this more, but I think it's really awesome to have a simple end-to-end application that can be used to evaluate research but also provide a nice demo to help explain (*and sell!*) the work.

## CRDTs for Offline and Mobile

Have you ever been sitting in the same room with a bunch of colleagues, all of you concurrently editing the same Google Doc? Well those of us in the [Sampa][] lab at UW do. The first weekly meeting of each quarter we do "2-minute madness" (lightning talks) where everyone ostensibly presents what they're working on right now in — you guessed it — two minutes or less, presented from a shared Google Slides presentation for convenience. In reality, the majority ends up being bobble-head photoshop work, inside jokes, and prank slides added at the last minute.

![Sampa joke slide]({{site.base}}/img/spampa-lightning.png)

Now imagine the worst: all of us are in the same room, collaborating on this super crucial task, and the network goes down. Suddenly, even though we all have the slides, and all of our machines are still Wifi-capable, we suddenly are stuck in our own worlds, editing separate copies of the slides, so the version being presented is, sadly devoid of prank slides — err, I mean exciting new research.

Wouldn't it make much more sense that all of us still connected to each other can still continue to collaborate? This particular example may not overly concern you, but I actually have been in situations where I wanted to work on a document with other people and our internet kept going down, so Google Docs was a pain. Furthermore, there are countless other situations where offline coordination between devices is desired, such as ad-hoc networks used to aid relief efforts after a disaster takes out wireless infrastructure.

Luckily some of the people at PaPoC are interested in helping all of these scenarios, and as with most things at this workshop, the solution is — CRDTs! Seriously though, it's pretty great. The poster child app so far for CRDTs has been collaborative text editing.

### Offline collaboration

Santiago Castiñeira presented his work, [Collaborative offline web applications using conflict-free replicated data types](http://dl.acm.org/citation.cfm?id=2745952), where he laid out these kinds of scenarios, showed that CRDTs are a natural fit, and explored various communication protocols for keeping them in sync with each other. Santiago built his system for Chrome specifically in order to be able to implement the peer-to-peer features. It would be really cool if one of the web standards like WebRTC supported connecting directly between already-known devices while offline.

### Internet of Intermittently Connected Things

I had other conversations with people at the workshop about the applying CRDTs for the "Internet of Things" (we're all suitably embarrassed to use the buzzword, but still excited). When devices go offline for any number of reasons, they tend to end up diverging much more from each other than typical even for geo-replicated data storage. First of all, this is cool in the context of the low-power energy-harvesting devices, which I hear a good deal about from my [current](http://homes.cs.washington.edu/~amrita/), [recently former](http://ben.ransford.org/) and [less recently former](http://brandonlucia.com/) colleagues.

 Intermittent connectivity poses serious problems when trying to make good merge decisions, causing many applications to resort to asking users what they want to do. I think it would be cool to explore more ways of pushing the semantics of the task down into the merge operations in these scenarios. For instance, if collaborating on source code, choose to merge syntactically. As an aside, I'd also like this in the ultimate intermittently connected collaboration situation: [git with advisors](http://homes.cs.washington.edu/~bpw/cs/dvcs-for-advisors/). Both of these also relate to other work I just learned about by [Natacha Crooks][] and [Allen Clement][] called TARDiS, which helps deal with merging changes on replicated eventually consistent data by providing diffs of the state to the merge functions, allowing more complex semantic reasoning to take place.

## LVars and alternative perspectives

This wasn't a paper at PaPoC, but [Chris Meiklejohn][] mentioned the work in his talk on [Lasp][], and luckily its creator, Lindsey Kuper ([@lindsey][]) was attending PaPoC and EuroSys so I got plenty of time to learn more directly from her.

In the area of deterministic multiprocessing, there is a concept of single-assignment variables, or *I-Vars*, that are very nice for ensuring safety when sharing data between threads. *[LVars][]* extend this notion with a more general model for sharing data by ensuring that only *commutative* operations that grow the data *monotonically* are allowed. Because threads are only allowed to *add* information to these shared systems, it is possible to ensure that regardless of the order in which they execute, they will always come up with the same externally visible results.

LVars have a lot in common with CRDTs — both enforce that only commuting operations are allowed, and the rely on always *adding* information (for example, removing elements typically means marking them as removed rather than deleting them so that we keep record of the fact that the element existed). However, the design and features of LVars are different, reflecting the different set of concerns of a deterministic programming perspective:  *LVars focus on ensuring correctness where CRDTs focus on availability*. The write operations for CRDTs are meant to be asynchronous — the user, operating with an assumption of eventual consistency, is ostensibly alright without blocking until the operation finishes, and similarly, reads are intended to occur on whatever replica is closest or most available; how up-to-date it is typically isn't a concern. So you typically get semantics that are quite non-deterministic, but at least provide some notion of atomicity and correctness — a read either comes before or after some set of updates — and which updates must be seen can be bounded, for instance, by causal consistency.

On the other hand, LVars focus on ensuring determinism, and, though certainly applicable elsewhere, are designed for a multiprocessing model, which assumes all the processes are always easily reachable. This makes it so that, rather than returning an answer for reads as quickly as possible, LVars ensure a consistent view of the world by focusing on reads that block until certain preconditions are satisfied, such as waiting for a value to be added to a set.

I think this is particularly interesting because I recently noticed a similar difference in perspective when talking about my plans for disciplined inconsistency with [Allen Clement][] at EuroSys. I'll save the full discussion of that to a later post, but the short version is that in his use cases, they need an answer within a certain time limit (or as fast as possible), and will just have to deal with whatever error arises from that. On the other hand, I was thinking of giving programmers hard bounds on the correctness of their values (i.e. "the value will be within 5% of the correct value"), but in order to *ensure* this the answer might be delayed, either by waiting until the error fell to within tolerable levels or forcing it to.

[basho]: http://basho.com
[Riak]: http://basho.com/riak
[Riak:CRDTs]: http://docs.basho.com/riak/latest/theory/concepts/crdts/
[riak_core]: https://github.com/basho/riak_core
[riak_ensemble]: https://github.com/basho/riak_ensemble
[Antidote]: https://github.com/SyncFree/antidote
[LASP]: https://github.com/cmeiklejohn/lasp
[Chris Meiklejohn]: http://christophermeiklejohn.com/
[@lindsey]: https://twitter.com/lindsey
[LVars]: http://www.cs.indiana.edu/~lkuper/papers/lvars-fhpc13.pdf
[Allen Clement]: http://www.mpi-sws.org/~aclement/
[Natacha Crooks]: http://www.mpi-sws.org/~ncrooks/
[Luis]: https://news.cs.washington.edu/2014/12/05/cse-holiday-party-2014/
[sampa]: http://sampa.cs.washington.edu/

---

This has been a bit of a brain dump and an exercise in drawing connections. Thank you to the organizers of PaPoC, especially [Carlos Baquero](https://twitter.com/xmal) for creating a workshop where I could learn so much. I hope I haven't too poorly represented anyone's work here, and I apologize if I have, and would love to hear clarifications or thoughts on Twitter or via [email](mailto:bholt@cs.uw.edu).

<blockquote class="twitter-tweet" lang="en" data-cards="hidden"><p lang="en" dir="ltr">Learned a ton from chatting with the folks at PaPoC, here&#39;s my writeup (otherwise known as &quot;1001 ways to use CRDTs&quot;) <a href="http://t.co/2hQaHG8VHK">http://t.co/2hQaHG8VHK</a></p>&mdash; Brandon Holt (@holtbg) <a href="https://twitter.com/holtbg/status/593643055787352064">April 30, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
