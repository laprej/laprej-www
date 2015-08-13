---
title: "Claret: Data Types for Distributed Datastores"
layout: post
description: |
  Enforcing strong consistency in distributed data stores is expensive, but using weaker consistency models is difficult for programmers. Luckily programmers and distributed systems share some common interests: abstraction and data structures. Claret, an ongoing project of mine, leverages this to make programming distributed apps fun and profitable.
---

By introducing data types into distributed data stores, programmers get to choose how to build their app but re-use common structures, while the data store can use this extra information to improve its own performance.

<script src="https://gist.github.com/bholt/38fc80d5d5b377cb3302.js"></script>
