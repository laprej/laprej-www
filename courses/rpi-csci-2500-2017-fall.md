---
layout: default
title: CSCI 2500 Computer Organization
description: Syllabus for CSCI 2500 Computer Organization.
---

## CSCI 2500, Computer Organization

### Fall 2017

Dr. Herbert Holzbauer (holzbh AT cs.rpi.edu) & Dr. Justin M. LaPre (laprej AT cs.rpi.edu)  
Department of Computer Science  
Rensselaer Polytechnic Institute  
110 8th Street Troy, New York 12180   
Course web site: [https://piazza.com/rpi/fall2017/csci2500](https://piazza.com/rpi/fall2017/csci2500)  
Office Hours:

* Holzbauer: Amos Eaton 205, Tuesday and Friday, 2 p.m. to 4 p.m. (and by appointment).
* LaPre: Amos Eaton 206, Tuesday and Friday, 2 p.m. to 4 p.m. (and by appointment).

Class Time and Location: Sage 3303, Tuesdays and Fridays, 12 p.m. to 1:50 p.m.

**Like the Constitution, this syllabus should be considered a "living document" in that it is subject to change.
You will be notified of any changes made.**

### Course Description
Introduction to computer organization, assembler language, and operating
systems with a heavy emphasis on systems and low-level programming. Topics
include, but are not exclusively limited to:

* Organization/design of processors, memory and I/O.
* Numeric representation including binary integer and floating point
  number systems.
* Digital logic including Boolean algebra, gates, digital logic
  circuits, and memory.
* Assembly language including instruction formats, addressing modes,
  instruction types, flow of control, the assembly process, macros,
  linking, loading.
* Advanced architectures including RISC architectures and parallel
  architectures.
* Operating systems virtual memory, processes and interprocess
  communication.

**Prerequisite** CSCI 1200 (Data Structures).

### Required Textbooks

*Computer Organization & Design: The Hardware/Software Interface, 5th
Edition* (2013), by Patterson and Hennessy.
[Amazon link.](http://amzn.com/0124077269)

### Optional Textbooks

*C Programming: Language: A Step by Step Beginner's Guide to Learn C
Programming in 7 Days* (2016), by Darrell L. Graham.
[Amazon link.](https://amzn.com/B01H0LBF9Q) **FREE KINDLE EDITION AS OF
2017-08-16**

### Graduate Teaching Assistants
We have three Graduate TAs assigned to our class.

* Muhammad Ishaq (ishaq AT ishaq.pk): AE 127, Monday, 4 p.m. to 6 p.m.
* Shengxuan 'Leo' Liu (lius16 AT rpi.edu): AE 127, Monday, 12 p.m. to 2 p.m.
* Georgios Mavroudeas (mavrog2 AT rpi.edu): AE 127, Wednesday, 12 p.m. to 2 p.m.

### Lab Sections

* Wednesday, 10 a.m., Sage 3303, Leo, Adarsh, Breanna, Jesse
* Wednesday, 12 p.m., Amos Eaton 214, M.I., Jacob, Kasra, Thomas
* Wednesday, 2 p.m., Amos Eaton 214, Georgios, Aidan, Jack, Kevin, Xi

**While email addresses are supplied for all course staff, please
  prefer to use Piazza instead of email unless the matter is
  specifically about you.  For example, a family emergency, illness,
  etc.**

### Schedule of Topics

* Introduction to Unix and C: Assignment 1.
* History, Performance and Why Parallelism?: P&H/Chapter 1, Assignment 2.
* Assembly Language Programming MIPS: P&H/Chapter 2 and hand-outs, Assignments 3.
* Digital Logic: P&H/Appendix B.
* Computer Arithmetic: P&H/Chapter 3, Assignment 4.
* Building a Processor, Pipelining: P&H/Chapter 4, start of group project.
* Memory Hierarchy: P&H, Chapter 5, Assignment 5.
* Parallel Computing: P&H Chapter 6, Assignment 6.

### Schedule of Homework and Quizzes and NO CLASS days

* Assignment 1 due on Wednesday, September 13th.  Quiz 1 on Tuesday,
  September 12th.
* Assignment 2 due on Wednesday, September 27th.  Quiz 2 on Tuesday,
  September 26th.
* October 10th, Monday schedule, no class.
* Assignment 3 due on Wednesday, October 11th.  Quiz 3 on Friday, October
  13th.
* Assignment 4 due on Wednesday, November 1st.  Quiz 4 on Friday,
  October 27th.
* Quiz 5 on Friday, November 10th.  Group project posted.
* Assignment 5 due on Wednesday, November 29th.  Quiz 6 on Tuesday,
  November 28th.
* Group Project due date, Friday December 8th.
* Assignment 6 due on Wednesday, December 13th.  Quiz 7 on Tuesday,
  December 12th.

### Grading and Other Class Policies

*  18%: Lab sections
*  30%: 6 homeworks, 5 pts each -- due every other Wednesday.
*  42%: 7 quizzes, 6 pts each, given in class every other week on Tuesdays or Fridays.
*  10%: 1 project.

**We will also be using Submitty (AKA the homework server).  Details
  will follow on Piazza.**

**Attendance Policy**: Attendance at lectures is not required, but
be aware that we may include material not necessarily covered in the
text or on the web page.  You are responsible for all announcements
made in lecture (e.g., any change in due dates).

**Lab Sections**: Lab attendance is mandatory and you will be graded.
Keeping up with the labs will be the best way for your to make sure
that you do not fall behind.

**Group Project**: The group project allows for groups of up to 3-4
students to collaborate on a larger assignment than the individual
assignments typically require.  15% of each student's grade will be
determined by their peers.  If two students code the entire project
while a third does nothing, that student should not expect the same
score as the rest of the team.

**Late Assignments Policy**: All students begin the semester with
three initial late days that can be used for late submissions.  These
are consumed in whole day increments.  In other words, if you are one
hour late, that will count as one day.  25 hours late will count as
two days, etc.  Additional late days may be earned via iClicker points
gained in lecture.  You may not use more than three late days per
assignment.  Once your late days are exhausted or you have exceeded
three late days, late assignments will not be graded.

**Missed Quiz Policy**: Missed quizzes can only be made up under the
  following circumstances:

* you have a formal excuse from the Dean of Students Office (such as a job
  interview or attending a conference) or
* you have a health-related formal excuse from either the Student Health
  Center (SHC) or your personal physician. Please see this [note from
  the SHC]
  (http://studenthealth.rpi.edu/sites/default/files/Medical%20Excuse%20Letter%20to%20Faculty%201-20-2017.pdf)
  regarding typical reasons for (not) getting an excuse.

**Grade Disputes**: Grade disputes must be made in person within 10 days.
After 10 days has elapsed, the grade on record will stand.

**Assignment Grading Criteria**: Programming assignments are graded as
follows: 15% for proper comments (e.g., each function should indicate
what it does) and 85% for a correct working implementation. We
typically divide the correctness points over key functions
working. For example, reading -- worth 10 points, writing -- worth 10
points as file correctly, and then doing the calculation correctly --
worth 65 points. Note that programs that either don't compile or
generate a `core dump` typically get no more than 20 points of the
85. Thus, your max score for a "properly commented" program that fails
in some fundamental way is only 35 points even if you spent 100 hours
of time on it.  Non-programming assignments/homeworks are graded on a
per-problems basis. Typically 5 problems will be given and each is
worth 20 points.  These should be typed up using a word processor of
your choice e.g., MS Word, LaTeX, etc.  These must be submitted on
Submitty as well.

### Students With Special Needs

Federal law requires all colleges and universities to provide
specified types of assistance to students with disabilities.  If you
require such assistance, please obtain an authorizing memo from
Disability Services for Students by contacting the Student Health
Center.  Information about a student's special needs will be treated
as confidential.  Please submit a copy of your authorizing memo to
your professor well in advance of any affected exam or
assignment. Failure to do so may result in a lack of special
accommodations.

### Academic Integrity

While I strongly encourage you to form study groups and work together
in learning this material, the course project, homeworks and
programming assignments are to be done individually unless otherwise
noted by the assignment/project specification. What this means is that
you should do whatever is necessary to ensure your work remains your
work. If during in the grading process, it is determined that students
shared or duplicated work, those students will automatically score a
zero for the offense and a report will be sent to the Dean of Students
Office which could result in additional disciplinary action.  For a
second offense, the student or students involved will fail this
course.  Additionally, undergraduates offenders cannot mentor in the
future.  In the event a graduate student is caught cheating, that
student will fail.

### Learning Outcomes
By the end of this course, you will be able to:

* Apply the concepts of the C programming language to the construction
of moderately complex software implementation problems.
* Apply the concepts of assembly language to correct and efficient
translation of a given C programming language into the course required
assembly language(s).
* Apply the concepts of integer and floating point formats to convert
from the base-10 integer or scientific format into the correct machine
readable binary format.
* Apply the concepts of Boolean Algebra to simplify given Boolean equations.
* Apply the concepts of K-Maps to the problem of Boolean expression
  simplification.
* Apply the concepts of Performance to the analysis of computer
  performance problems.
* Apply the concepts of a multi-cycle datapath and control by showing
in written form the processing steps that different classes of
instructions require as they move through the datapath and control
hardware structures.
* Apply the concepts of a pipelined datapath and control by showing in
written form the processing steps that different classes of
instructions require as they move through the datapath and control
hardware structures.
* Apply the concepts of caching and memory hierarchy to solve a
problem which requires you to design the "best" cache system given
particular design constraints.
* Apply the concepts of parallel programming to the
construction/implementation of a correct and efficiently executing
multi-threaded program.
