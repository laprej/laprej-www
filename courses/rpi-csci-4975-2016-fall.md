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
Class Time and Location: MR 6 PM, Sage 2704

**Like the Constitution, this syllabus should be considered a "living document" in that it is subject to change.
You will be notified of any changes made.**

### Course Description
This topics course will be compiler-oriented with a focus on the LLVM compiler in particular. LLVM is a state-of-the-art compiler that enjoys both academic interest as well as widespread industry adoption. It is a large codebase written using modern C++ techniques and design patterns; students are expected to not only read but learn from existing code. Seminal compiler/LLVM-specific papers will be assigned and critiqued on a weekly basis. Topics will include compiler backend issues such as control flow graphs, intermediate representation (IR), and compiler optimizations. Assignments will include writing various LLVM passes as well as a significant final project.

**Prerequisite** Undergraduate level CSCI 2300 Minimum Grade of D and Undergraduate level CSCI 2500 Minimum Grade of D.

### Optional Textbooks

*Getting Started with LLVM Core Libraries*, by Lopes and Auler.
[Amazon link.](https://amzn.com/B00N2RWMSQ)

*Compilers: Principles, Techniques, and Tools*, by Aho, Lam, Ullman, and Sethi.
[Amazon link.](https://amzn.com/B009TGD06W)

*Engineering a Compiler*, by Cooper and Torczon.
[Amazon link.](https://amzn.com/B00J5AS70G)

### Schedule of Topics

* What is LLVM?
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

* September 5, 2016 - Labor Day -- no classes.
* September 15, 2016 - Homework 1 is due.
* October 6, 2016 - Homework 2 is due.
* October 10, 2016 - Columbus Day -- no classes.
* October 11, 2016 - Classes Resume -- Follow MONDAY class schedule.
* October 27, 2016 - Homework 3 is due.
* November 17, 2016 - Homework 4 is due.
* November 24, 2016 - Thanksgiving break -- no classes.
* November 28, 2016 onward - final project presentations.

### Grading and Other Class Policies

* 60%: Four homeworks
* 25%: Final project
* 10%: Paper presentation
* 5%: Participation

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
* Have completed an LLVM project that interests you personally
