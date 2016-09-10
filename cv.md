---
layout: default
title: Curriculum Vitae

internships:
  - who: Software Engineer Intern
    where: Twitter
    when:  Summer 2014
    what: |
      - Worked on improving usability of large-scale data analytics tools (Twitter's *Scalding* tool).

  - who: Research Intern
    where: Microsoft Research (Redmond)
    when:  Summer 2013
    what: |
      - Worked on autotuning cluster-scale deep neural networks.
      - Automatic optimization of locality using simple cache models and parameterizable scheduling

  - who: Software Intern
    where: "Cray, Inc."
    when:  Summer 2011
    what: |
      - Worked with and evaluated Cray’s parallel productivity language, Chapel
      - Developed and optimized HPC benchmarks using MPI and Chapel

  - who: Software Development Intern
    where: Epic
    when:  Summer 2009
    what: |
      - Designed and developed software for Epic’s Stork application using Caché and VisualBasic
      - Collaborated with Epic team members and physicians to integrate my project with Epic’s software

teaching:
  - position: Non-tenured Faculty at Rensselaer Polytechnic Institute
    detail: |
      - CSCI 4975/6975: LLVM: A Compiler Case Study, Fall 2016
      - CSCI 2500: Computer Organization, Fall 2016
      - CSCI 2500: Computer Organization, Spring 2016

  - position: Teaching Assistant at Rensselaer Polytechnic Institute
    detail: |
      - CSCI 4320/6340: Parallel Computing & Programming - with Christopher Carothers, Spring 2013

  - position: Instructor at Mechanical Engineering Department, SUNY Stony Brook
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
##### [Rensselaer Polytechnic Institute](http://www.rpi.edu) — [Computer Science Department](http://www.cs.rpi.edu)
- Doctor of Philosophy (Dec 2015)
- Master of Science (May 2005)
- Bachelor of Science (May 2002)
- **Advisor**: [Christopher Carothers](http://www.cs.rpi.edu/~chrisc)

## Publications

### Conference Papers

- {% publication lapre-wsc-2015 %}
- {% publication gonsiorowski-pads-2015 %}
- {% publication lapre-pads-2014 %}
- {% publication barnes-pads-2013 %}
- {% publication lapre-autumnsim-2012 %}

### Journal Papers

- {% publication gonsiorowski-tomacs %}
- {% publication tyrrell-biomedicine-2004 %}

## Teaching Experience

{% for i in page.teaching %}
<div><strong>{{i.position}}</strong> {{i.detail | markdownify}}</div>
{% endfor %}

## Service

{% for i in page.service %}
<div><strong>{{i.position}}</strong> {{i.detail | markdownify}}</div>
{% endfor %}

### References

* Christopher Carothers – Ph.D. Advisor – [chris.carothers AT gmail.com](mailto:chris.carothers AT gmail.com)
* Chuck Stewart  – Computer Science Department Head – [cvstewart AT gmail.com](mailto:cvstewart AT gmail.com)
* Anisha Smith – Former Student – [anishacsmith AT gmail.com](mailto:anishacsmith AT gmail.com)
