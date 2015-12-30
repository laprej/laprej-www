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
  - position: Teaching Assistant at University of Washington
    detail: |
      - [CSE 548](http://www.cs.washington.edu/education/courses/cse548/14au/): Graduate Computer Architecture - with Luis Ceze, Autumn 2014
      - [CSE PMP 548](http://www.cs.washington.edu/education/courses/csep548/12au/): Computer Architecture for Professional Master's Program - with Luis Ceze, Autumn 2012

  - position: Instructor at National Computational Science Institute (NCSI) Workshops
    detail: |
      - Lectured on CUDA programming, assisted students one-on-one, developed assignments and labs
      - Workshops
        - SC11 Education Program Parallel Track (Nov 2011)
        - Blue Waters Petascale Institute (June 2011)
        - SC10 Education Program Parallel Track (Nov 2010)
        - Intermediate Parallel Programming (August 2010)

  - position: Teaching Assistant at UW-Eau Claire
    detail: |
      - CS 145 (Fundamentals of Object Oriented Programming), for Dan Stevenson, Fall 2010
      - CS 245 (Advanced Programming and Data Structures), for Dan Stevenson, Spring 2011
      - Assisted in labs, held office hours, graded programming assignments, one-on-one tutoring

---

<p class="contact">
<a href="mailto:laprej@cs.rpi.edu"><span class="glyphicon glyphicon-envelope"></span> laprej@cs.rpi.edu</a>
</p>

## Research Interests
I am interested in helping programs scale from workstations up to huge machines in order to solve the biggest problems in data-intensive and scientific computing workloads. To tackle this problem I design programming models and language features that express parallelism and locality, compilers that leverage that additional information to do aggressive optimization, and runtime systems that handle dynamism to make full use of each architecture's capabilities.

## Education
##### [University of Washington](http://uw.edu) — [Department of Computer Science & Engineering](http://cs.washington.edu)
- Master of Science (Dec 2013)
- PhD (in progress)
- **Advisors**: Luis Ceze & Mark Oskin

##### [University of Wisconsin - Eau Claire](http://uwec.edu)
- Bachelor of Science (May 2011)
- **Majors**: Computer Science, Physics & Astronomy
- **Advisor**: Dan Ernst

### Honors

- [Hacherl Graduate Fellowship](http://www.cs.washington.edu/education/grad/current/GradFellowships/Hacherl.html) at University of Washington (2011)
- [National Merit Scholarship](http://www.nationalmerit.org/nmsp.php) at University of Wisconsin - Eau Claire (2007-2011)
- [John T. Carroll Scholarship](http://www.uwec.edu/Physics/academics/carroll.htm) at University of Wisconsin - Eau Claire (2010)

## Publications

### Conference Papers

- {% publication lorain %}
- {% publication warp-speed %}
- {% publication grappa-usenix %}
- {% publication alembic %}
- {% publication flatcombining %}

### Workshop Papers

- {% publication claret-papoc %}
- {% publication grappa-wrsc %}
- {% publication hotpar12 %}

### Undergraduate Publications

- {% publication jocse %}
- {% publication peerreview %}

## Internship Experience

{% for i in page.internships %}
<div>
<strong>{{i.where}}</strong> — <em>{{i.who}}</em> — {{i.when}}
{{i.what | markdownify}}
</div>
{% endfor %}

## Teaching Experience

{% for i in page.teaching %}
<div><strong>{{i.position}}</strong> {{i.detail | markdownify}}</div>
{% endfor %}

## References

* Luis Ceze, PhD. – PhD Advisor – [luisceze@cs.washington.edu](mailto:luisceze@cs.washington.edu)
* Mark Oskin 	– PhD Advisor – [oskin@cs.washington.edu](mailto:oskin@cs.washington.edu)
* Dan Ernst, PhD. – Assistant Professor, Undergraduate Research Advisor – [dje@cray.com](mailto:dje@cray.com)
