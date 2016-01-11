---
layout: default
title: Projects
description: List of current and recent research and side projects.
---

<a name="LORAIN"></a>
## LORAIN
Automatically generating reverse event handlers to support optimistic PDES.

LORAIN is a tool capable of automatically generating reverse event handlers.
These are necessary in the case of an erroneous execution of an out-of-order event in an optimistic parallel discrete-event simulation (PDES).
Our simulator, ROSS, can effectively detect these anomalies, though implementing a correct reverse function has proven quite challenging for developers over the years.
By leveraging LLVM, we can instrument the forward code and, in many cases, generate the proper reverse code.
LORAIN does this by way of the intermediate representation (IR), comprised of a virtual instruction set of RISC-like operations.
In the paper, LORAIN is capable of reaching 97% of the performance of hand-written code.

- {% publication lapre-pads-2014 %}
