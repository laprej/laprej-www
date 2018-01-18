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
* Pan Deng (dengp AT rpi.edu): TBD
* Yingyi Wu (wuy21 AT rpi.edu): TBD

### Undergraduate Mentors
* Hannah Deen
* Anthony DeLorenzo
* Max Shavrick
* Xinyue Yan

### Schedule of Topics

| Date      | Topic
| :----     | -----:
| 1/18      | History / OSI model
| 1/22      | Prof. LaPre unavailable, possible guest lecture TBA
| 1/25      | Prof. LaPre unavailable, possible guest lecture TBA
| 1/29      | C background
| 2/1       | Unix commands
| 2/5       | High level UDP and TCP/IP
| 2/8       | Byte ordering, socket creation, misc. inet functions
| 2/12      | Client / server model
| 2/15      | Client / server model
| 2/20      | UDP sockets
| 2/22      | Bonjour (Zeroconf) / Service Discovery
| 2/26      | TCP 3 Way Handshake, TCP States, TCP Close
| 3/1       | TCP congestion control, ACK, windows, etc
| 3/5       | Broadcasting
| 3/8       | Bit Torrent / DHT / P2P
| 3/12-3/16 | SPRING BREAK
| 3/19      | TCP sockets (SOCK_STREAM)
| 3/22      | Overflow Days
| 3/26      | select (I/O Multiplexing)
| 3/29      | Socket Options
| 4/2       | IPv4/IPv6 addressing, DNS, gethost\*(), nslookup
| 4/5       | IPv4/IPv6 addressing, DNS, gethost\*(), nslookup
| 4/9       | HTTP
| 4/12      | Overflow Days
| 4/16      | SSL
| 4/19      | RPI Sec A (SSL-related?)
| 4/23      | MPI
| 4/26      | RPI Sec B
| 4/30      |
| 4/27      |
| 5/1       | Overflow Days

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

**Late Projects Policy**: Three late days are permitted for
assignments.  They will be consumed in whole day increments. In other
words, if you are one hour late, that will count as one day. 25 hours
late will count as two days, etc. Once these are exhausted, late
assignments will not be graded.

**Grade Disputes**: Grade disputes must be made within 10 days.
After 10 days has elapsed, the grade on record will stand.

**Grade Modifiers Policy**: Grade modifiers will be used in this
class. See the course catalog for more details.  There is no A+ nor is
a D- allowed under the RPI Grade Modifier Policy.

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

**Compatibility**: All assignments MUST compile with clang++ and run
on Ubuntu 14.04.  This is the compiler and operating system on
Submitty so you will have no problems meeting this requirement.  *It
is worth noting that not all valid C programs are valid C++
programs.*

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
