---
layout: post
title: ⚗ Alembic
subtitle: Distilling C++ into high-performance Grappa
description: |
  One of the hardest parts about writing distributed applications is locality — this compiler analysis automatically transforms threads to migrate to the data they access, minimizing communication and improving overall performance.
---

One of the hardest parts about writing distributed applications is locality: where to put the data, how to access it, and where to perform computation to minimize how much data must be moved. My new [paper](http://sampa.cs.washington.edu/papers/oopsla14-alembic.pdf), to appear at [OOPSLA'14](http://2014.splashcon.org/track/oopsla2014) in October, describes a compiler analysis called Alembic which helps distributed application programmers deal with locality by making threads migrate to the data they use automatically.

### Traditional distributed shared memory model

Partitioned global address space (PGAS) languages allow distributed-memory machines, such as clusters, to be programmed as if they were a single shared memory machine. When run, these programs are actually run in parallel on the many nodes of a cluster, and their data is *partioned* among the nodes' local memories, but the programmer need not worry about this because the PGAS compiler automatically takes care of moving this data around as needed.
This means that programmers need not worry about where their data is when they are designing their application. Once an application is performing correctly, the programmer can go back and tune the performance by optimizing data layout to improve locality.

<!-- For the class of applications targeted by [Grappa](http://grappa.io), such as analytics on the Twitter follower graph, there is often little locality to be exploited, and no good way to partition the data. For these sorts of applications, Grappa  -->

The typical way that compilers for PGAS languages do data movement is to generate messages to fetch the data for each remote memory access. A runtime system performs this communication, and the requesting thread waits around until it receives the data it needs. Many clever optimizations have been done to overlap communication and computation, combine messages from multiple threads, and cache frequently-accessed data.

### Automatic locality extraction via migration

However, consider a situation where a thread reads some value, computes something, and immediate writes the result back (a read-modify-write), such as incrementing a counter or appending to a list. In that case, the traditional PGAS put/get approach requires the thread to request the data, wait for the response, modify the value, and then send back the new value to be written (and presumably wait for a message acknowledging when that operation is complete). Instead, what if the thread could run that whole chunk of computation remotely: read the value, compute the new value, and write it back, all with a single message. Generalizing this case, one can imagine continuing to run the thread at that remote node, until another one of these cases comes up, at which point the thread *migrates* again.

Alembic is a compiler analysis to do this kind of transformation automatically. It analyzes PGAS programs, determines where it is likely to be profitable to migrate, and splits the thread into a sequence of messages and *continuations* that migrate the thread to its data. Alembic is implemented for the [LLVM](http://llvm.org) compiler framework, and targets the [Grappa](http://grappa.io) runtime system, which is designed for *irregular applications* where migration is particularly important for performance.

The full details of the analysis, how it works, and the evaluation of how it performs on some benchmarks, can be found in the [OOPSLA paper](http://sampa.cs.washington.edu/papers/oopsla14-alembic.pdf).
