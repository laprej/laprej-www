---
title: Teaching Statement
layout: default
description: An online copy of my teaching statement and philosophy.

teaching_statement:
  - heading:
    text: |
      I consider myself a life-long student.
      In my years of study, I have discovered trends that can help lead to a successful academic career.
      These are, in no particular order:
      (i) fast turnaround times for feedback through testing,
      (ii) recognizing familiar problems, and
      (iii) engaging the students.

  - heading: Faster Iteration
    text: |
      All too often, novice programmers write 50, 100, or more lines of code only to discover that it does not compile.
      While compiler error messages have been improving, message-parsing abilities by the student are often not mature enough to decipher the gibberish spewed from the compiler.
      Any advice to "fix the first problem" invariably falls on deaf ears.
      Encouraging students to adopt a *test driven development* (TDD) methodology can improve the way they develop their code in several ways.
      First, the amount of code to examine is typically smaller.
      Second, by focusing on one component at a time they are "nearer" to the source of the problem.
      Third, it builds a sense of accomplishment as they eliminate bugs and see more and more tests passing.
      Students needs to iterate faster when they have less experience.
      As the student becomes more confident and knowledgeable, less feedback is required.

  - heading: Problem Recognition
    text: |
      Incoming freshmen have been trained in passing standardized exams. 
      Yet the wealth of knowledge available to your average smartphone owner is mind-boggling; it no longer makes sense to have students memorize facts.
      A better tactic is building solid *pattern matching* skills.
      Being able to recognize a spin on a graph coloring problem is far more useful than trying to attack the problem from scratch.
      Additionally, it is likely that a fair amount of code exists online that already solves this problem, at least partially.
      Seeing a variety of twists on known problems helps to improve problem recognition and increase insight into problems at a deeper level.
      Exposure to a breadth of problems helps to foster critical thinking and alternative thinking methods to discover solutions.

  - heading: Engaging Students
    text: |
      I like to keep the atmosphere of my class light.
      To break up long lectures, in addition to getting a drink and stretching, I find that students enjoy short and non-class-related YouTube videos.
      I find that these introduce some degree of levity as well as helping the students relax.
      By creating a comfortable environment, the students feel less inhibited asking and answering questions.
      Another one of my favorite tactics I have picked up over the years is a short *problem of the day* (POTD).
      The POTD must be (physically) handed in during class but the student need not even attempt it; the student's name on the paper is all that is required.
      The benefits of this are twofold: it encourages attendance and gives the student further opportunities for studying the material.

---

{% for i in page.teaching_statement %}
<div style="text-align:justify"><h2>{{i.heading}}</h2> {{i.text | markdownify}}</div>
{% endfor %}