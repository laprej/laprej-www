---
layout: default
title: Curriculum Vitae

internships:
  - who: Summer Intern
    where: Army Research Labs, Aberdeen Proving Ground, MD
    when:  Summers 2010 &#8212; 2012
    what: |
      - Developed large-scale radio simulations
      - Remotely collaborated with colleagues during academic year

  - who: Software Engineer
    where: ViaSat Incorporated, Carlsbad, CA
    when:  March 2005 &#8212; July 2006
    what: |
      - Developed next generation of Software-Defined Radios for the U.S. Navy
      - Implemented various software components on a real-time/embedded platform (Green Hills INTEGRITY)
      - Extensive use of C/C++, TCP/IP, and CORBA

teaching:
  - position: Adjunct Instructor at Rensselaer Polytechnic Institute
    detail: |
      - CSCI 2500: Computer Organization, Spring 2016

  - position: Teaching Assistant at Rensselaer Polytechnic Institute
    detail: |
      - CSCI 4320/6340: Parallel Computing & Programming - for Dr. Christopher Carothers, Spring 2013

  - position: Instructor at Mechanical Engineering Department, Stony Brook University
    detail: |
      - C Programming for Engineers, Spring 2008

service:
  - position: Winter Simulation Conference
    detail: |
      - Network and Communications Track Co-Chair, Dec 2016

---

<p class="contact">
<a href="mailto:laprej AT cs.rpi.edu"><span class="glyphicon glyphicon-envelope"></span> laprej AT cs.rpi.edu</a>
</p>

## Research Interests
My research over the past few years has primarily focused on improving performance of parallel discrete-event simulations.
Such simulations have utility in a large range of applications such as simulating aircraft in the national air space or developing new radio protocols.
By leveraging compiler tools and novel state-saving techniques, development of parallel code is simplified while maintaining a high-performance envelope.

## Education

#### [Rensselaer Polytechnic Institute](http://www.rpi.edu) — [Computer Science Department](http://www.cs.rpi.edu)
- Doctor of Philosophy, Computer Science (Dec 2015)
- Master of Science, Computer Science (May 2005)
- Bachelor of Science, Computer Science (May 2002)

#### [Stony Brook University](http://www.stonybrook.edu) - [Computer Science Department](http://www.cs.stonybrook.edu)
- Master of Science, Computer Science & Engineering (Dec 2008)

## Publications

### Conference Papers

- {% publication lapre-wsc-2015 %}
- {% publication gonsiorowski-pads-2015 %}
- {% publication lapre-pads-2014 %}
- {% publication barnes-pads-2013 %}
- {% publication lapre-autumnsim-2012 %}

### Journal Papers

- {% publication tyrrell-biomedicine-2004 %}

## Teaching Experience

{% for i in page.teaching %}
<div><strong>{{i.position}}</strong> {{i.detail | markdownify}}</div>
{% endfor %}

## Work Experience

{% for i in page.internships %}
<div><strong>{{i.where}}</strong> — <em>{{i.who}}</em> — {{i.when}}
{{i.what | markdownify}}</div>
{% endfor %}

## Service

{% for i in page.service %}
<div><strong>{{i.position}}</strong> {{i.detail | markdownify}}</div>
{% endfor %}

### References

* Christopher Carothers – Ph.D. Advisor – [chris.carothers AT gmail.com](mailto:chris.carothers AT gmail.com)
* Chuck Stewart  – Computer Science Department Head – [cvstewart AT gmail.com](mailto:cvstewart AT gmail.com)
* Anisha Smith – Former Student – [anishacsmith AT gmail.com](mailto:anishacsmith AT gmail.com)
