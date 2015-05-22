---
layout: post
title: Contracts for Eventual Consistency
description: |
  Quelea, described in a paper at PLDI this year, lets programmers express application invariants in a contract language in Haskell and then automatically selects the consistency model which can enforce those properties for each transaction, out of a lattice of consistency levels for the target data store.
---

I just read a great paper from the upcoming PLDI'15 — ["Declarative Programming over Eventually Consistent Data Stores"](http://gowthamk.github.io/docs/quelea.pdf) and it's given me some great ideas that I wanted to jot down before I forget them, and in the hope that my summary might be useful to someone.

## User-specified data types

One way to look at this work is that it allows users to express new, custom *replicated data types* for their applications. The actions that make up the application are either *methods* on these custom data types, or *transactions* that use data from multiple objects (either different types or different instances).

Because these data types have been specialized for a particular application, we can tailor the contracts, which will result in the minimum consistency required for this use case. However, one of the great things about data types is getting to re-use common data types. If you can re-use someone else's data type, then you don't need to worry about the tedious process of writing a correct contract; all you need to do is write the (potentially much simpler) properties for the transactions you use to compose data structures to implement your application.

So there's a tradeoff between being more and more specific to one application or more general and reusable. I wonder if we can come up with some interesting data types that are sufficiently general to be used in many applications but specific enough to get reasonable performance. What do these data types look like? Perhaps there's a way to make them parameterizable so the 

In the Redis and Riak ecosystems, there is some re-use of complex data types. In Redis, there's a Scoreboard implementation that one could imagine many applications using, but which is specific enough (and potentially parameterizable enough) to be performant.


# Notes
- their language is decidable, that's why Z3 goes fast
- not quite "application-level invariants" — would be cool to do something that bridges that gap, but it would not be decidable then, so would have to come up with some tricks/heuristics
- repeatable read: different definitions depending on who you talk to
  - this one is defined in terms that work for *coordination-free* txns
  - in this definition, it means that a txn sees a snapshot of other transactions' effects (as opposed to *monotonic atomic view* which says that you have to continue to see operations you've seen, but new effects can be added as well)
