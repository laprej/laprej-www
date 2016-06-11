---
title: Research Statement
layout: default
description: An online copy of my research statement.
---

The following paragraphs reflect some of my *current* guiding principles for research.
They should never be considered, "set in stone" but rather in a constant state of question, refinement, and hopefully improvement.

## Future Simulation systems

Parallel discrete-event simulation (PDES) is a valuable tool for many scientists and engineers.
From simulating the national air space to prototyping a large-scale radio protocols before deployment, PDES has the potential to save large sums of money and minimize the time required to arrive at a functional design.
XPDES.
Make them easier to use.
Future PDES systems must be modular.
They must also be easily extendible.
Support introspection.
A lot of old assumptions are due for re-visitation.

## Compilers

Compilers are the gate-keepers for new software systems.
If you cannot articulate yourself in a clear manner to the compiler, then your compiler cannot generate high performing or well-parallelized code.
Additionally, developers are becoming more dependent on the compiler through the increasing use of bug-finding tools via static and dynamic analysis and race conditions in parallel code can also be detected.

OpenMP
Compilers can be used to great effect.
Useful for transformation passes through the code to exploit hidden parallel portions.
Advent of C++11/14 drastically reduces the copy overheads (new pointer types require "move" operators, etc.)

## Software engineering

This first item arguably has the least amount of actual research potential insofar as good practices rarely result in publishable work.
Before any research is undertaken, the code must be in a understandable and malleable state.
That does not diminish the importance of good software engineering practices including:
1) test-driven development,
2) continuous integration, and
3) proper documentation including both developer and user perspectives.

Computer scientists work in and develop algorithms.
These algorithms are ultimately realized in code, written by humans, and therefore susceptible to typical development cycles such as designing, coding, and debugging.
By adopting good software engineering principles and utilizing them throughout the life of the project, it will make refactoring easier.

Base all underlying guiding principles of good software engineering
Some projects are short and others are long.
You never know how long a project will last.

This includes introducing new research features into your code base.

We must strive to eliminate these errors through tried and tested methodologies.

<!--
## Cloud-based resources

Supercomputers can be terribly expensive.
Aside from the cost of the hardware and requiring sufficient space, the power and cooling costs alone can easily exceed one million dollars annually.
On the other hand, Amazon and friends offer on-demand cloud-based services for a fraction of the cost of an in-house supercomputer.

## Containers

Containers offer new opportunities to develop and deploy in a fast manner.
-->
