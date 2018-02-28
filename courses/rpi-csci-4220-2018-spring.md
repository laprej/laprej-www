---
layout: default
title: CSCI 4220 Network Programming
description: Syllabus for CSCI 4220 Network Programming.
---

## CSCI 4220, Network Programming

### Spring 2018

Dr. Justin M. LaPre  
Department of Computer Science  
Rensselaer Polytechnic Institute  
110 8th Street Troy, New York 12180   
Course web site: [https://piazza.com/rpi/spring2018/csci4220](https://piazza.com/rpi/spring2018/csci4220)  
Office Hours: Amos Eaton 206, Monday and Thursday, 6 p.m. to 7 p.m. (and by appointment).  
Class Time and Location: DCC 318, Monday and Thursday, 4 p.m. to 5:50 p.m.

**Like the Constitution, this syllabus should be considered a "living
document" in that it is subject to change.  You will be notified of
any changes made.**

### Course Description

Programming with an overview of the principles of computer networks,
including an overview of the OSI reference model and various popular
network protocol suites. Concentration on Unix interprocess
communication (IPC), network programming using TCP and UDP, as well as
client-side and mobile programming. Programming projects in C++ are
required.

The first half of each class will be classic lecture-style while the
second half of class will be closer in nature to a lab.  Accompanying
documents will be available via either Piazza or Submitty.  Students
should bring their laptops as they will be required for the lab
portion.

**Prerequisite** CSCI 4210 (Operating Systems).

### Required Textbooks

*Unix Network Programming, Volume 1: The Sockets Networking API, 3rd
Edition* (2003), by W. Richard Stevens et al.
[Amazon link.](http://a.co/aE8mNZ4)

### Graduate Teaching Assistants
* Pan Deng (dengp AT rpi.edu): Amos Eaton 110, Friday 12-2 p.m.
* Yingyi Wu (wuy21 AT rpi.edu)

### Undergraduate Mentors
* Hannah Deen
* Anthony DeLorenzo
* Max Shavrick
* Xinyue Yan

### Schedule of Topics

| Date      | Topic
| :----     | -----:
| 1/18      | History / OSI model; Unix commands
| 1/22      | Prof. LaPre unavailable, possible guest lecture TBA
| 1/25      | Prof. LaPre unavailable, possible guest lecture TBA
| 1/29      | High level UDP and TCP/IP; UDP sockets
| 2/1       | Byte ordering, misc. inet functions
| 2/5       | tftp; Sorcerer’s Apprentice; `SIGALRM`
| 2/8       | TCP sockets (SOCK_STREAM); Client / server model
| 2/12      | select (I/O Multiplexing); Bonjour (Zeroconf) / Service Discovery
| 2/15      | TCP 3 Way Handshake, TCP States, TCP Close
| 2/20      | TCP congestion control, ACK, windows, etc
| 2/22      | Design Patterns
| 2/26      | Network Protocols
| 3/1       | Threads
| 3/5       | IRC
| 3/8       | Broadcasting
| 3/12-3/16 | SPRING BREAK
| 3/19      | rsync
| 3/22      | Bit Torrent / DHT / P2P
| 3/26      | Socket Options; Bufferbloat, ECN
| 3/29      | CORBA
| 4/2       | IPv4/IPv6 addressing, DNS, gethost\*(), nslookup
| 4/5       | No class
| 4/9       | HTTP
| 4/12      | SSL
| 4/16      | MPI
| 4/19      | OpenMP
| 4/23      | Alternatives to TCP: QUIC, SCTP
| 4/26      | IPFS
| 4/30      | Overflow Day

### Schedule of Assignments and altered class days

* Assignment 1 due February 13th.
* February 20th, Monday schedule, we have class.
* Assignment 2 due February 27th.
* Assignment 3 due March 20th.
* March 30 - April 6: GM Week.
* Assignment 4 due April 3rd.
* Assignment 5 due April 17th.
* Assignment 6 due May 1st.

### Grading and Other Class Policies

*  72%: 6 programming projects (12 points each)
*  28%: In-class labs

**We will also be using Submitty (AKA the homework server).  Details
  will follow on Piazza.**

**Attendance Policy**: Attendance at lectures is not required, but
be aware that I may include material not necessarily covered in the
text or on the web page.  You are responsible for all announcements
made in lecture (e.g., any change in due dates).

**Late Assignments Policy**: Three late days are permitted for
assignments.  They will be consumed in whole day increments. In other
words, if you are one hour late, that will count as one day. 25 hours
late will count as two days, etc. Once these are exhausted, late
assignments will not be graded.  However, additional late days can
be earned for every six points (not labs) earned through labs.

**Late Labs Policy**: Late labs will not be accepted but three bonus
labs will be awarded to all students. For example, if you miss 4 of 10
labs, you will only be penalized for missing 1.  Your lab score cannot
rise above 100%.

**Grade Disputes**: Grade disputes must be made within 10 days.
After 10 days has elapsed, the grade on record will stand.

**Grade Modifiers Policy**: Grade modifiers will be used in this
class. See the course catalog for more details.  There is no A+ nor is
a D- allowed under the RPI Grade Modifier Policy.

**Assignment Grading Criteria**: Your submission must include the
  following items:

* A `Makefile` that will build your program
* One or more `.cpp` files
* One or more `.h` files
* Any other assorted files necessary for proper compilation
* A `README` file (.txt extension optional) describing your program,
  any issues you encountered, the approximate time you spent on it,
  and the breakdown of work if it's a group assignment

Programming assignments are graded as follows: 25% for proper comments
(e.g., each function should indicate what it does) and 75% for a
correct working implementation. We typically divide the correctness
points over key functions working. For example, reading -- worth 20
points, writing -- worth 20 points, and then doing the calculation
correctly -- worth 35 points. Note that programs that either don't
compile or generate a `core dump` typically get no more than 20 points
of the 75. Thus, your max score for a "properly commented" program
that fails in some fundamental way is only 45 points even if you spent
100 hours of time on it.

**Compatibility**: All assignments MUST compile with clang++ and run
on Ubuntu 14.04.  This is the compiler and operating system on
Submitty so you will have no problems meeting this requirement.  *It
is worth noting that not all valid C programs are valid C++
programs.*  All C files must compile cleanly with clang++.

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
in learning this material, programming assignments are to be done
individually unless otherwise noted by the assignment/project
specification. What this means is that you should do whatever is
necessary to ensure your work remains your work. If during in the
grading process, it is determined that students shared or duplicated
work, those students will automatically score a zero for the offense.
For a second offense, the student or students involved will fail this
course and a report will be sent to the Dean of Students office which
could result in additional disciplinary action.  Additionally,
undergraduates offenders cannot mentor in the future.  In the event a
graduate student is caught cheating, that student will fail.

### Learning Outcomes

By the end of this course, you will be able to:

* Understand the OSI reference model and a variety of network
  protocols.

* Implement specific network programming constructs on Unix platforms
  to create robust real-world sockets-based applications.

* Design and implement client/server programs using a variety of
  protocols and platforms.

* Apply the concepts of the C programming language to the construction
of moderately complex software implementation problems.
