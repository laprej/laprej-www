---
layout: default
title: CSCI 4975/6975 A Compiler Case Study LLVM
description: Syllabus for CSCI 4975/6975 A Compiler Case Study LLVM
---

## CSCI 4975/6975: A Compiler Case Study: LLVM

### Fall 2017

Dr. Justin M. LaPre  
Department of Computer Science  
Rensselaer Polytechnic Institute  
110 8th Street Troy, New York 12180  
Course web site: [http://piazza.com/rpi/fall2017/csci49756975](http://piazza.com/rpi/fall2017/csci49756975)  
Office Hours: after class or by appointment.  
Class Time and Location: Monday and Thursday 12 p.m. to 1:50 p.m., Sage 2704

**Like the Constitution, this syllabus should be considered a "living
document" in that it is subject to change.  You will be notified of
any changes made.**

### Course Description

This topics course will be compiler-oriented  with a focus on the LLVM
compiler  in particular.   LLVM  is a  state-of-the-art compiler  that
enjoys  both   academic  interest  as  well   as  widespread  industry
adoption. It is  a large codebase written using  modern C++ techniques
and design patterns; students are expected  to not only read but learn
from  existing code.   Seminal  compiler/LLVM-specific  papers may  be
assigned and  critiqued.  As  many of  you have  not taken  a compiler
course yet, we will cover  some preliminary theory.  Additional topics
will  include compiler  backend issues  such as  control flow  graphs,
intermediate       representation       (IR),       and       compiler
optimizations. Assignments will include writing various LLVM passes as
well as a significant final project.

**Prerequisite** Undergraduate level CSCI 2300 Minimum Grade of D and
  Undergraduate level CSCI 2500 Minimum Grade of D.

### Textbook

*Engineering a Compiler*, by Cooper and Torczon.
[Amazon link.](https://amzn.com/B00J5AS70G)

### Optional Textbooks

*Getting Started with LLVM Core Libraries*, by Lopes and Auler.
[Amazon link.](https://amzn.com/B00N2RWMSQ)

*Compilers: Principles, Techniques, and Tools*, by Aho, Lam, Ullman, and Sethi.
[Amazon link.](https://amzn.com/B009TGD06W)

### Schedule of Topics

* What is LLVM?
* Scanning
* Parsing
* Intermediate representation (IR)
* Three-address code
* Static Single Assignment (SSA)
* Control flow graphs (CFGs)
* Dominators
* C++ meta-programming (light!)
* Code transformations & optimizations
* Debug Info (DI)
* (Maybe) libClang / libTooling / clang frontend
* Weekly assigned paper discussion
* Weekly student presentations from [llvm.org/pubs](http://llvm.org/pubs/)
* Presentations of final projects

### Schedule of Homework and NO CLASS days

* September 4, 2017 - Labor Day -- no classes.
* September 14, 2017 - Homework 1 is due.
* October 5, 2017 - Homework 2 is due.
* October 9, 2017 - Columbus Day -- no classes.
* October 10, 2017 - Classes Resume -- Follow MONDAY class schedule.
* October 26, 2017 - Homework 3 is due.
* November 16, 2017 - Homework 4 is due.
* November 23, 2017 - Thanksgiving break -- no classes.
* November 27, 2017 onward - final project presentations.

### Grading and Other Class Policies

* 60%: Four homeworks
* 25%: Final project
* 10%: Paper presentation
* 5%: Participation

**Attendance Policy**: As this is a seminar, attendance at lectures is
*strongly encouraged*.  You are responsible for all announcements made
in lecture (e.g., any change in due dates) as well as any material
posted on the course web page.

**Late Assignments Policy**: Three late days are permitted for
assignments.  They will be consumed in whole day increments. In other
words, if you are one hour late, that will count as one day. 25 hours
late will count as two days, etc. Once these are exhausted, late
assignments will not be graded.

**Grade Disputes**: Grade disputes must be made within 10 days.
After 10 days has elapsed, the grade on record will stand.

### Academic Integrity

While I strongly encourage you to form study groups and work together
in learning this material, the course project, homeworks and
programming assignments are to be done individually unless otherwise
noted by the assignment/project specification. What this means is that
you should do whatever is necessary to ensure your work remains your
work. If during in the grading process, it is determined that students
shared or duplicated work, those students will automatically receive a
zero for the offense.  For a second offense, the student or students
involved will fail this course and a report will be sent to the Dean
of Students office which could result in additional disciplinary
action.

### Learning Outcomes
By the end of this course, you will:

* Have gained a deeper understanding of the LLVM compiler
* Understand the various passes a compiler makes through your code
* Understand and use advanced C++ techniques and design patterns
* Be able to read control flow graphs
* Be able to read and write valid LLVM virtual instruction streams
* Have completed an LLVM project that interests you personally
