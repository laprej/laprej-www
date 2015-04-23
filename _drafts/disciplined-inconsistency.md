---
title: Disciplined Inconsistency
layout: default
description: |
  Distributed systems have hard performance requirements which drive programmers to accept drastic  
---

There are two ways of looking at inconsistency bounds: 

1. Acceptable bounds: a transaction or result isn't accepted unless it falls within the acceptable bounds defined by the application.
2. Exposed inconsistency: given a time limit or performance guarantee of some sort, system tries to return the best answer possible, and it communicates the resulting accuracy via the type.
