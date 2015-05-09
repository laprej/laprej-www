---
layout: post
title: Contracts for Eventual Consistency
description: |
  Quelea, described in a paper at PLDI this year, lets programmers express application invariants in a contract language in Haskell and then automatically selects the consistency model which can enforce those properties for each transaction, out of a lattice of consistency levels for the target data store.
---

I just read a great paper from the upcoming PLDI'15 — ["Declarative Programming over Eventually Consistent Data Stores"](http://gowthamk.github.io/docs/quelea.pdf) and it's given me some great ideas that I wanted to jot down before I forget them, and in the hope that my summary might be useful to someone.


