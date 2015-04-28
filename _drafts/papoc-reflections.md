---
title: Reflections from PaPoC
layout: default
description: |
  I had the privilege of presenting some of my work to many similarly-minded researchers at the PaPoC workshop last week. I got some great ideas from hearing about other relevant ongoing work and from insightful conversations with people there.
---

The Workshop on Principles and Practice of Consistency was co-located with EuroSys and took place the day before the conference proper began. This is the second year of the workshop, though my first time — slightly re-branded from last year that explicitly focused on *eventual consistency* — this year the call more broadly encouraged discussions about consistency models for distributed systems. This seemed like a good fit for some of my Claret work on using data types in distributed data stores, and it turns out it was a great choice — I found many people with experience and interest particularly around CRDTs (Conflict-free/Commutative/Convergent Replicated Data Types).

# Riak

Riak has already shown up on my radar as a key-value store that supports complex data types — [CRDTs][Riak:CRDTs]. Built-in CRDTs include Counters ("Registers"), Flags (Maps with 1-bit values), Sets, and Maps (whose values can recursively be CRDTs). Riak developed these data types to help users wrangle with eventual consistency and build complex applications with fewer bugs. From the PaPoC attendees, it sounds like these CRDTs are being adopted by at least some of the users of Riak (it'd be cool to find some actual numbers).

What's even more useful about Riak is that it has been developed very modularly, with all of its components developed in the open on Github. These components include:

- [riak-core][]: [message passing or something?]
-  the key-value store layer
-  [...?]
-  [riak-ensemble][]: implementation of Multi-Paxos for quorum ([possibly also transactions, or is that another one?])

# SyncFree Project

Many of the attendees and organizers of PaPoC are involved in a big EU project related to scalable distributed systems called SyncFree. For my purposes, what is interesting is that it's a consortium of many universities and industry partners focused around improving the state-of-the-art in distributed programming models, data storage systems, and mobile platforms, and they seem to have taken a particular stance which leans heavily toward *eventual consistency* as necessary for providing high availability and scalability, for geo-replication as well as intermittently-connected mobile devices.

What's even better than a bunch of researchers thinking about distributed programming models? A group of researchers *cooperating to create shared software infrastructure to do it.* I don't think there's necessarily an explicit need to build systems that integrate with each other, but due to all of the cross-pollination between groups, many have coalesced around similar systems. I saw many presentations about systems built using various open source components from [Riak][], an eventually-consistent key-value store developed and maintained by [who?]. Some of these [which?] are grouped together in a project on Github called [Antidote][].

## Benchmark apps

Rovio is one of the industry partners of SyncFree, and they have contributed a benchmark application that involves synchronizing game state between multiple mobile devices and the cloud. I will have to look into this more, but I think it's really awesome to have a simple end-to-end application that can be used to evaluate research but also provide a nice demo to help explain (*and sell!*) the work.

## [LASP][]

There were a couple presentations about helping build and compose CRDTs, but this project stuck with me the most. Presented by [Chris Meiklejohn][], this language can be used to express how a CRDT should behave [...?]

# LVars

In the area of deterministic multiprocessing, there is a concept of single-assignment variables, or *I-Vars*, that are very nice for ensuring safety when sharing data between threads. *[LVars][]* extend this notion with a more general model for sharing data by ensuring that only *commutative* operations that grow the data *monotonically* are allowed. Because threads are only allowed to *add* information to these shared systems, it is possible to ensure that regardless of the order in which they execute, they will always come up with the same externally visible results.

I learned about this work from a couple mentions during PaPoC sessions and luckily its creator, Lindsey Kuper ([@lindsey][], recent PhD from Indiana University, now at Intel) was attending PaPoC and EuroSys so I got plenty of time to learn more directly from her.

LVars have a lot in common with CRDTs — both enforce that only commuting operations are allowed, and the rely on always *adding* information (for example, removing elements typically means marking them as removed rather than deleting them so that we keep record of the fact that the element existed). However, the design and features of LVars are different, reflecting the different set of concerns of a deterministic programming perspective:  *LVars focus on ensuring correctness where CRDTs focus on availability*. The write operations for CRDTs are meant to be asynchronous — the user, operating with an assumption of eventual consistency, is ostensibly alright without blocking until the operation finishes, and similarly, reads are intended to occur on whatever replica is closest or most available; how up-to-date it is typically isn't a concern. So you typically get semantics that are quite non-deterministic, but at least provide some notion of atomicity and correctness — a read either comes before or after some set of updates — and which updates must be seen can be bounded, for instance, by causal consistency.

On the other hand, LVars focus on ensuring determinism, and, though certainly applicable elsewhere, are designed for a multiprocessing model, which assumes all the processes are always easily reachable. This makes it so that, rather than returning an answer for reads as quickly as possible, LVars ensure a consistent view of the world by focusing on reads that block until certain preconditions are satisfied, such as waiting for a value to be added to a set.

I think this is particularly interesting because I recently noticed a similar difference in perspective when talking about my plans for disciplined inconsistency with Allen [?] and Natacha Crooks at EuroSys. I'll save the full discussion of that to a later post, but the short version is that Allen needs an answer within a certain time limit (or as fast as possible), and will just have to deal with whatever error arises from that. On the other hand, I was thinking of giving programmers hard bounds on the correctness of their values (i.e. "the value will be within 5% of the correct value"), but in order to *ensure* this the answer might be delayed, either by waiting until the error fell to within tolerable levels or forcing it to.



[Riak]: ???
[Riak:CRDTs]: ???
[riak-core]: ???
[riak-ensemble]: ???
[Antidote]: https://github.com/SyncFree/antidote
[LASP]: https://github.com/cmeiklejohn/lasp
[Chris Meiklejohn]: ???
[@lindsey]: https://twitter.com
[LVars]: ???
