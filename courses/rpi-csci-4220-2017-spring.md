---
layout: default
title: CSCI 4220 Network Programming
description: Syllabus for CSCI 4220 Network Programming.
---

## CSCI 4220, Network Programming

### Spring 2017

Dr. Justin M. LaPre  
Department of Computer Science  
Rensselaer Polytechnic Institute  
110 8th Street Troy, New York 12180   
Course web site: [https://piazza.com/rpi/spring2017/csci4220](https://piazza.com/rpi/spring2017/csci4220)  
Office Hours: Amos Eaton 206, Tuesday and Friday, 4 p.m. to 6 p.m. (and by appointment).  
Class Time and Location: Amos Eaton 214, Mondays and Thursdays, 6 p.m. to 7:50 p.m.

**Like the Constitution, this syllabus should be considered a "living document" in that it is subject to change.
You will be notified of any changes made.**

### Course Description

Programming with an overview of the principles of computer networks,
including an overview of the OSI reference model and various popular
network protocol suites. Concentration on Unix interprocess
communication (IPC), network programming using TCP and UDP, as well as
client-side and mobile programming. Programming projects in C are required.

The first 20-30 minutes of lecture will be covered by Dr. Holzbauer.
Mondays will typically be guided RFC study (or something similar)
while Thursdays will quiz you on the topics from the previous lecture.
Afterwards, Dr. LaPre will continue with the remainder of lecture.

**Prerequisite** CSCI 4210 (Operating Systems).

### Required Textbooks

*Unix Network Programming, Volume 1: The Sockets Networking API, 3rd
Edition* (2003), by W. Richard Stevens et al.
[Amazon link.](http://a.co/aE8mNZ4)

### Graduate Teaching Assistants
We have two Graduate TAs assigned to our class.

* Yu Chen: TBD
* Shama Kollya: TBD

### Schedule of Topics

1  History / OSI model  
2  C background  
3  Unix commands  
4  High level UDP and TCP/IP  
5  Byte ordering, socket creation, misc. inet functions  
6  Client / server model  
7  Client / server model  
8  UDP sockets  
9  Bonjour (Zeroconf) / Service Dicovery  
10  TCP 3 Way Handshake, TCP States, TCP Close  
11  TCP congestion control, ACK, windows, etc  
12  Broadcasting  
13  Bit Torrent / DHT / P2P  
14  TCP sockets (SOCK_STREAM)  
15  Overflow Days  
SPRING BREAK  
16  select (I/O Multiplexing)  
17  Socket Options  
18  IPv4/IPv6 addressing, DNS, gethost\*(), nslookup  
19  IPv4/IPv6 addressing, DNS, gethost\*(), nslookup  
20  HTTP  
21  Overflow Days  
22  SSL  
23  RPI Sec A (SSL-related?)  
24  MPI  
25  RPI Sec B  
26  
27  
28  Overflow Days  

### Schedule of Projects and altered class days

* Project 1 out on Thursday, February 16th, due February 27th.
* February 21st, Monday schedule, we have class.
* Project 2 out on Monday, February 27th, due March 9th.
* Project 3 out on Monday, March 20th, due April 3rd.
* Project 4 out on Monday, April 3rd, due April 17th.
* Project 5 out on Monday, April 17th, due May 1st.

### Grading and Other Class Policies

*  70%: 5 programming projects (14 points each)
*  30%: In-class quizzes (Thursdays)

**We will also be using Submitty (AKA the homework server).  Details
  will follow on Piazza.**

**Attendance Policy**: Attendance at lectures is not required, but
be aware that I may include material not necessarily covered in the
text or on the web page.  You are responsible for all announcements
made in lecture (e.g., any change in due dates).
Additionally, you *are* responsible for the **problem of the day**.

**Problem of the day**: Each day in lecture you are to turn in the
(dated) problem assigned from the previous lecture.  The twist is that
actually solving the problem is optional, i.e., you will receive full
credit by simply putting your name on the page.  With a very high
likelihood, students actually attempting to solve the problem will
achieve a deeper understanding of the material than those that simply
write their name on the paper.  Students are excused from handing this
in on quiz days; turn it in at the beginning of the following lecture.

**Late Projects Policy**: Three late days are permitted for
assignments.  They will be consumed in whole day increments. In other
words, if you are one hour late, that will count as one day. 25 hours
late will count as two days, etc. Once these are exhausted, late
assignments will not be graded.

**Grade Disputes**: Grade disputes must be made within 10 days.
After 10 days has elapsed, the grade on record will stand.

**Grade Modifiers Policy**: Grade modifiers will be used in this
class. Nominally, for example, you expect to earn a B- if your score
is greater than 79.5 and less than 83.0, B if your score is greater
than 83 and less than 86, B+ if your score is greater than 86 and less
than 89.5. The same modifier points occur for the A, C and D ranges
except that there is no A+ nor is a D- allowed under the RPI Grade
Modifier Policy.

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
of time on it.

### Academic Integrity

While I strongly encourage you to form study groups and work together
in learning this material, the course project, homeworks and
programming assignments are to be done individually unless otherwise
noted by the assignment/project specification. What this means is that
you should do whatever is necessary to ensure your work remains your
work. If during in the grading process, it is determined that students
shared or duplicated work, those students will automatically score a
zero for the offense.  For a second offense, the student or students
involved will fail this course and a report will be sent to the Dean
of Students office which could result in additional disciplinary
action.  Additionally, undergraduates offenders cannot mentor in the
future.  In the event a graduate student is caught cheating, that
student will fail.

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
