---
title: Bridging the consistency gap with approximate types
layout: post
description: |
    Dealing with approximation doesn't have to hurt: using type systems 
    People in our research group and others have shown the power, flexibility, and safety of disciplined approximate computing. Using type systems, it is possible to 
---

## Approximate computing

> standard approximate computing spiel here

There is a rise in application-specific approximations across many disciplines. Computer vision and other graphics applications that operate on noisy inputs and produce best-effort output in any way they can. Many machine learning techniques, particularly deep learning neural networks, take particular efforts to *introduce* uncertainty and randomness into their models in order to make them more robust. When scaling deep learning pipelines, practitioners have observed that they can get away with truncating floating point values, eliminating synchronization [@hogwild], even dropping out random neurons [@dropout] or straggling nodes [@chilimbi:osdi;@dean:deeplearning]. In order to scale, [neural network training systems for clusters][dean] must coordinate infrequently, asynchronously and lazily sharing updates, leveraging inherent approximability.

This leads to a whole other area where approximation is rampant: distributed systems. The understanding among systems designers is that in order to *scale out*, we must give up the strong consistency guarantees and fixed relational data models and instead move to the NoSQL systems that dominate the "web-scale" scene. Whether or not you believe that the traditional DBMS model is the problem, there is truth to at least one part of this movement: *at scale, something's gotta give.* In particular, most NoSQL systems are built around the notion of *eventual consistency,* which just means that updates propagate throughout the system at their own pace, and users are allowed to observe things with various degrees of staleness. Programmers using these kinds of systems have to reason carefully about all the possible states they might end up in and design their applications to handle them. In many cases, the assumption is that most inconsistencies won't lead to problems and many reorderings are tolerable, even if observed by end users. Strict consistency can be enforced where absolutely necessary, which is why you (probably) won't be charged twice when you buy something on Amazon.

The problem is that in a system where everything is relaxed consistency by default, it's hard to reason about where *acceptable* inconsistencies transition to *unacceptable*. One user may reason that a Twitter user's follower list can be missing a few when a new tweet is posted, but as that list is handed off from service to service, more approximations may be introduced, and someone down the line might use it erroneously. Even more insidious errors can result when information obtained in an eventually consistent way leaks into decisions that must be precisely correct.

If an application can tolerate a certain amount of imprecision or reordering, why not capture that explicitly in the programming model? What if bounds on approximation could be expressed succinctly and enforced automatically? The answer: disciplined approximate programming.

## *Disciplined* approximate programming

Dealing with approximation doesn't have to hurt. Some of my colleagues at the University of Washington have been working hard for the last few years developing abstractions and tools to allow people to relax precision or give up absolute correctness in parts of a program that can tolerate it, while retaining strong guarantees that these parts won't interfere with the rest of the program. These projects include [EnerJ](http://homes.cs.washington.edu/~asampson/home/blog/enerj.html), which adds `@approx` annotations to Java, [ACCEPT](https://sampa.cs.washington.edu/accept), an approximate compiler for C++, and [passert](http://homes.cs.washington.edu/~asampson/blog/passert.html) and [Uncertain<T>](http://research.microsoft.com/apps/pubs/default.aspx?id=208236) which help programmers interact with probabilistic variables.


[dean]: http://papers.nips.cc/paper/4687-large-scale-distributed-deep-networks.pdf "Jeff Dean, et al., Large Scale Distributed Deep Networks, Advances in Neural Information Processing Systems (2012)."
[hogwild]: http://papers.nips.cc/paper/4390-hogwild-a-lock-free-approach-to-parallelizing-stochastic-gradient-descent.pdf "Hogwild: A Lock-Free Approach to Parallelizing Stochastic Gradient Descent"