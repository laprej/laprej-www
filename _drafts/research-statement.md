---
title: Research Statement
layout: default
description: An online copy of my research statement.
---

Parallel discrete-event simulation (PDES) is a valuable tool for many scientists and engineers.
From simulating the national air space to prototyping a large-scale radio protocols before deployment, PDES has the potential to save large sums of money and minimize the time required to arrive at a functional design.
My work builds a foundation which explores multiple avenues of improving performance through:
avoiding problematic simulation scenarios,
data structure refinement,
compiler-assisted techniques,
and novel state-saving implementations.
These approaches outline a recipe for achieving scalable performance across a wide array of discrete-event simulation experiments.

### Model-Driven Improvements

First is the  model based approach.
This  area may  contain  the  greatest possible  range  of optimizations.
Small changes to model behavior or algorithms may yield orders of magnitude in performance improvements.
This is particularly true when dealing with the "broadcast" problem, i.e., where sending  one event may generate ``receive'' events on many other nodes.
Such exponential event growth  can be difficult for  simulation engines to handle  in a performance-sensitive  manner.
By  converting the  wireless broadcast model into  a model similar  to a token-ring, we are  able to bypass this performance-crushing phenomenon.

### Improving Massively Parallel Simulator Scalability

The second concern is how do we enable a PDES engine on an extreme-scale number of cores (e.g., one million and beyond).
Various data structures are required to work in concert for the proper execution of the simulation;
poor  choices may impact the speed  of the simulation.
Small-scale performance  must sometimes be  sacrificed to achieve  the desired scalability.
For  example,  our   target  simulation  engine,  ROSS, previously  used  hash tables  to  track  remote events.
While  this performed well  for many  years, this strategy  was destined  to break when  scaling  up  to  millions of  cores.
Specifically,  each  core maintained a unique hash table for all cores in the system which collectively consumed many times the available memory.
Replacing millions  of  hash  tables  with   a  single per-node tree  yields  a  substantial improvement in memory usage and  enables a ROSS  simulation to scale to nearly two million cores.

### Compiler-Assisted Model Development

Next  we explore  compiler-assisted  tools  for developing  optimistic simulation  models.
Optimistic approaches are able to uncover a model's inherent parallelism via speculative execution.
Upon detection of an erroneous simulator state, the  event handler is effectively undone or  rolled back.
State-saving is  a  memory-heavy  approach to  this problem.
Reverse   computation  is  an  effective   and  lightweight solution,  though  it  requires  considerable effort  from  the  model developer.
Offloading   this  responsibility  to  the   compiler  is non-trivial, but our results are promising:
the LORAIN tool is capable of identifying state changes,
instrumenting forward event handlers,
automatically generating reverse event handlers,
and restoring original state values.
Initial results show at  most  a 3%  slowdown  over  hand-written code.
Considering  the relative  difficulty of  constructing a  valid reverse  event handler, this has the potential to dramatically reduce optimistic model development time.

### Delta Encoding

Finally,  we investigate  delta encoding  of state  differences.
This method  was inspired  by source  control systems  (e.g.,  git) in which the *modifications* to the state are stored as opposed to the  entirety  of the  state  information.
Saving state changes  is  often significantly  smaller than saving the state  as  a whole  which leads to  eased pressure on the memory subsystem.
Compressing these modifications further reduces memory pressures and allows for greater potential parallelism to be exploited within the optimistic simulation runtime.

### Future Simulation Systems

While the potential uses of simulations are vast, truly taking advantage of PDES can be challenging:
some approaches leave too much performance untapped due to their conservative nature while others require complicated and unconventional methods to correct out-of-order event executions.
The difficulty in developing such systems can be daunting yet provides some excellent opportunities.
Simulation engines would benefit greatly from being capable of greater degrees of introspection.
Additionally, redesigning to increase modularity will make changes more localized and easier to perform.
Building tools to reduce the complexity of creating simulation models will naturally lead to increases in productivity as well as greater possibilities for publication.
Many of the "common-sense" assumptions are due for re-visitation and a simplified code-base will greatly aid in reaffirming these hypotheses.

### Compilers

Compiler technology has grown by leaps and bounds in the past decade.
Code compiles faster and yields terrifyingly accurate correction predictions.
Developers are becoming more dependent on the compiler through the increasing use of bug-finding tools via static and dynamic analysis; race conditions in parallel code can often be detected.
Analysis and transformation passes on the code may be capable of discovering and exploiting parallel portions.
For example, OpenMP offers users the ability to direct the compiler's parallelization efforts.
While technologies such as OpenMP can lessen the burden of parallelizing code, there is no silver bullet.
Migrating aging code-bases towards newer technologies can help alleviate some inefficiency.
For example, the advent of C++11/14 drastically reduces the copy overheads (new data types require "move" operators, etc).
Previously indefensible ideas, such as high performance smart pointers, are now back on the table.
Again, many assumptions require re-evaluation.

### Software Engineering

This last item arguably has the least amount of actual research potential insofar as good practices rarely result in publishable work.
Before any research is undertaken, the code must be in a understandable and malleable state.
That does not diminish the importance of good software engineering practices including:
1) test-driven development,
2) continuous integration, and
3) proper documentation including both developer and user perspectives.
Computer scientists work with and develop algorithms.
These algorithms are ultimately realized in code, written by humans, and therefore susceptible to typical development cycles such as designing, coding, and debugging; these cycles can add months or years to a project.
By adopting good software engineering principles and utilizing them throughout the life of the project, refactoring project code will be easier and will lead to more well-defined and frequent publications.

<!--
## Cloud-based resources

Supercomputers can be terribly expensive.
Aside from the cost of the hardware and requiring sufficient space, the power and cooling costs alone can easily exceed one million dollars annually.
On the other hand, Amazon and friends offer on-demand cloud-based services for a fraction of the cost of an in-house supercomputer.

## Containers

Containers offer new opportunities to develop and deploy in a fast manner.
-->
