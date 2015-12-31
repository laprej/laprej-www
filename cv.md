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
  - position: Adjunct Instructor at Rensselaer Polytechnic Institute
    detail: |
      - CSCI 2500: Computer Organization, Spring 2016

  - position: Teaching Assistant at Rensselaer Polytechnic Institute
    detail: |
      - CSCI 4320/6340: Parallel Computing & Programming - with Christopher Carothers, Spring 2013

  - position: Instructor at Mechanical Engineering Deptartment, SUNY Stony Brook
    detail: |
      - C Programming for Engineers, Spring 2008

---

<p class="contact">
<a href="mailto:laprej AT cs.rpi.edu"><span class="glyphicon glyphicon-envelope"></span> laprej AT cs.rpi.edu</a>
</p>

## Research Interests
I am interested in helping programs scale from workstations up to huge machines in order to solve the biggest problems in data-intensive and scientific computing workloads. To tackle this problem I design programming models and language features that express parallelism and locality, compilers that leverage that additional information to do aggressive optimization, and runtime systems that handle dynamism to make full use of each architecture's capabilities.

## Education
##### [Rensselaer Polytechnic Institute](http://www.rpi.edu) — [Computer Science Department](http://www.cs.rpi.edu)
- Ph.D. (Dec 2015)
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

- {% publication tyrrell-biomedicine-2004 %}

## Teaching Experience

{% for i in page.teaching %}
<div><strong>{{i.position}}</strong> {{i.detail | markdownify}}</div>
{% endfor %}

### References Available Upon Request
