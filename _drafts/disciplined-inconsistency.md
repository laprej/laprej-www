---
title: Disciplined Inconsistency
layout: default
description: |
  In order scale services with tight performance requirements, distributed systems programmers are forced to accept stale or inconsistent data. I propose to help programmers deal with this inconsitency in disciplined ways with type systems and runtime support that will allow them to indicate what kinds of errors are acceptable for their application.
---

There are two ways of looking at inconsistency bounds: 

1. Acceptable bounds: a transaction or result isn't accepted unless it falls within the acceptable bounds defined by the application.
2. Exposed inconsistency: given a time limit or performance guarantee of some sort, system tries to return the best answer possible, and it communicates the resulting accuracy via the type.
