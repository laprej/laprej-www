---
title: Research Statement
layout: default
description: An online copy of my research statement.
---

The following paragraphs reflect some of my *current* guiding principles for research.
They should never be considered, "set in stone" but rather in a constant state of question, refinement, and hopefully improvement.

## Future Simulation Systems

Parallel discrete-event simulation (PDES) is a valuable tool for many scientists and engineers.
From simulating the national air space to prototyping a large-scale radio protocols before deployment, PDES has the potential to save large sums of money and minimize the time required to arrive at a functional design.
While the potential uses are vast, truly taking advantage of PDES can be challenging:
some approaches leave too much performance untapped due to their conservative nature while others require complicated and unconventional methods to correct out-of-order event executions.

The difficulty in developing such systems can be daunting yet provides some excellent opportunities.
Simulation engines would benefit greatly from being capable of greater degrees of introspection.
Additionally, redesigning to increase modularity will make changes more localized and easier to perform.
Building tools to reduce the complexity of creating simulation models will naturally lead to increases in productivity as well as greater possibilities for publication.
Many of the "common-sense" assumptions are due for re-visitation and a simplified code-base will greatly aid in reaffirming these hypotheses.

## Compilers

Compiler technology has grown by leaps and bounds in the past decade.
Code compiles faster and yields terrifyingly accurate correction predictions.
Developers are becoming more dependent on the compiler through the increasing use of bug-finding tools via static and dynamic analysis; race conditions in parallel code can often be detected.

Analysis and transformation passes on the code may be capable of discovering and exploiting parallel portions.
Additionally, OpenMP offers users the ability to direct the compiler's parallelization efforts.
While technologies such as OpenMP can lessen the burden of parallelizing code, there is no silver bullet.
Migrating aging code-bases towards newer technologies can help alleviate some inefficiency.
For example, the advent of C++11/14 drastically reduces the copy overheads (new data types require "move" operators, etc).
Previously indefensible ideas, such as high performance smart pointers, are now back on the table.
Again, many assumptions require re-evaluation.

## Software Engineering

This last item arguably has the least amount of actual research potential insofar as good practices rarely result in publishable work.
Before any research is undertaken, the code must be in a understandable and malleable state.
That does not diminish the importance of good software engineering practices including:
1) test-driven development,
2) continuous integration, and
3) proper documentation including both developer and user perspectives.

Computer scientists work with and develop algorithms.
These algorithms are ultimately realized in code, written by humans, and therefore susceptible to typical development cycles such as designing, coding, and debugging; these cycles can add up to months or years.
By adopting good software engineering principles and utilizing them throughout the life of the project, it will make refactoring project code easier and lead to more well-defined and frequent publications.

<!--
## Cloud-based resources

Supercomputers can be terribly expensive.
Aside from the cost of the hardware and requiring sufficient space, the power and cooling costs alone can easily exceed one million dollars annually.
On the other hand, Amazon and friends offer on-demand cloud-based services for a fraction of the cost of an in-house supercomputer.

## Containers

Containers offer new opportunities to develop and deploy in a fast manner.
-->
