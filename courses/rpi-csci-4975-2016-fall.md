---
layout: default
title: CSCI 4975/6975 A Compiler Case Study LLVM
description: Syllabus for CSCI 4975/6975 A Compiler Case Study LLVM
---

## CSCI 4975/6975: A Compiler Case Study: LLVM

### Fall 2016

Dr. Justin M. LaPre  
Department of Computer Science  
Rensselaer Polytechnic Institute  
110 8th Street Troy, New York 12180  
Course web site: [http://piazza.com/rpi/fall2016/csci49756975](http://piazza.com/rpi/fall2016/csci49756975)  
Office Hours: after class or by appointment.  
Class Time and Location: TBD

### Course Description
This topics course will be compiler-oriented with a focus on the LLVM compiler in particular. LLVM is a state-of-the-art compiler that enjoys both academic interest as well as widespread industry adoption. It is a large codebase written using modern C++ techniques and design patterns; students are expected to not only read but learn from existing code. Seminal compiler/LLVM-specific papers will be assigned and critiqued on a weekly basis. Topics will include compiler backend issues such as control flow graphs, intermediate representation (IR), and compiler optimizations. Assignments will include writing various LLVM passes as well as a significant final project.

**Prerequisite** Undergraduate level CSCI 2300 Minimum Grade of D and Undergraduate level CSCI 2500 Minimum Grade of D.

### Optional Textbooks

*Getting Started with LLVM Core Libraries*, by Lopes and Auler.
[Amazon link.](https://amzn.com/B00N2RWMSQ)

### Schedule of Topics

* Weekly student presentations from [llvm.org/pubs](http://llvm.org/pubs/)
* What is LLVM?
* Three-address code
* Static Single Assignment (SSA)
* Control flow graphs (CFGs)
* Dominators
* C++ meta-programming (light!)
* Code transformations & optimizations
* Debug Info (DI)
* (Maybe) libClang / libTooling / clang frontend
* Presentations of final projects

* Introduction to Unix and C: Assignment 1.
* History, Performance and Why Parallelism?: P&H/Chapter 1 and class hand-out, Assignment 2.
* Assembly Language Programming MIPS and x86: P&H/Chapter 2 and hand-outs, Assignments 3 and 4.
* Digital Logic: P&H/Appendix B, Assignment 5.
* Computer Arithmetic: P&H/Chapter 3, Assignment 6.
* Building a Processor: P&H/Chapter 4, hand-out,  start of group project.
* Pipelining & Multiprocessors: P&H/Chapters 4 and 7 plus lecture notes, Assignment 7.
* Memory Hierarchy: P&H, Chapter 5, finish-up group project.

### Schedule of Homework and NO CLASS days

* September 5, 2016 - Labor Day -- no classes.
* October 10, 2016 - Columbus Day -- no classes.
* October 11, 2016 - Classes Resume -- Follow MONDAY class schedule.
* November 24, 2016 - Thanksgiving break -- no classes.

* Assignment 1 due on Tuesday, February 2nd.  Quiz 1 on Friday, February 5th.  
* February 15, 2016 - February 16, 2016	President's Day holiday -- No classes.
* Assignment 2 due on Wednesday, February 17th.  Quiz 2 on Friday, February 19th.
* Assignment 3 due on Tuesday, March 1st.  Quiz 3 on Friday, March 4th.
* SPRING BREAK March 14, 2016 -- March 18, 2016
* Assignment 4 due on Tuesday, March 22nd.  Quiz 4 on Friday, March 25th.
* Assignment 5 due on Tuesday, April 5th.  Quiz 5 on Friday, April 8th.
* Assignment 6 due on Tuesday, April 19th.  Quiz 6 on Friday, April 22nd.
* Group Project due date, Friday April 29th.
* Assignment 7 due on Tuesday, May 3rd.  Quiz 7 on Friday, May 6th.

### Grading and Other Class Policies

*  4%: Problem of the day
*  10%: Lab sections
*  35%: 7 homeworks, 5 pts each -- due every other Tuesday.
*  42%: 7 quizzes, 6 pts each, given in class every other Friday.
*   9%: 1 project.

**Attendance Policy**: As this is a seminar, attendance at lectures is *strongly encouraged*.
You are responsible for all announcements made in lecture (e.g., any change in due dates) as well as any material posted on the course web page.

**Late Assignments Policy**: Three late days are permitted for assignments.
They will be consumed in whole day increments. In other words, if you are one hour late, that will
count as one day. 25 hours late will count as two days, etc. Once these are exhausted, late assignments
will not be graded.

**Grade Disputes**: Grade disputes must be made within 10 days.
After 10 days has elapsed, the grade on record will stand.

**Grade Modifiers Policy**: Grade modifiers will be used in this
class. Nominally, for example, you expect to earn a B- if your score
is greater than 79.5 and less than 83.0, B if your score is greater
than 83 and less than 86, B+ if your score is greater than 86 and less
than 89.5. The same modifier points occur for the A, C and D ranges
except that there is no A+ nor is a D- allowed under the RPI Grade
Modifier Policy.

**Assignment Grading Criteria**: Programming assignments are graded
as follows: 15% for proper comments (e.g., each function should
indicate what it does) and 85% for a correct working
implementation. We typically divide the correctness points over key
functions working. For example, reading - worth 10 points,
writing -- worth 10 points as file correctly, and then doing the
calculation correctly -- worth 65 points. Note that programs that
either don't compile or generate a `core dump` typically get no more
than 20 points of the 85. Thus, your max score for a "properly
commented" program that fails in some fundamental way is only 35
points even if you spent 100 hours of time on it.  Non-programming
assignments/homeworks are graded on a per-problems basis. Typically 5
problems will be given and each is worth 20 points.

### Academic Integrity

While I strongly encourage you to form study groups and work
together in learning this material, the course project, homeworks and
programming assignments are to be done individually unless otherwise
noted by the assignment/project specification. What this means is that
you should do whatever is necessary to ensure your work remains your
work. If during in the grading
process, it is determined that students shared or duplicated work,
those students will automatically receive a zero for the offense.
For a second offense, the student or
students involved will fail this course and a report will be sent to
the Dean of Students office which could result in additional
disciplinary action.

### Learning Outcomes
By the end of this course, you will:

* Have gained a deeper understanding of the LLVM compiler
* Understand the various passes a compiler makes through your code
* Understand and use advanced C++ techniques and design patterns
* Be able to read control flow graphs
* Be able to read and write valid LLVM virtual instruction streams
* Have completed an LLVM project of interest to you
