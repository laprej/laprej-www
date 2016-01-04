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
      (ii) out-of-the-box thinking, and
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
      The student needs to iterate faster when less experience is available.
      As the student becomes more confident and knowledgeable, less feedback is required.

  - heading: Thinking Creatively
    text: |
      The wealth of knowledge available to your average smartphone owner is mind-boggling; it no longer makes sense to have students memorize facts.
      A better tactic is building solid *pattern matching* skills.
      Being able to recognize a spin on a graph coloring problem is far more useful than trying to attack the problem from the scratch.
      Additionally, it is likely that a fair amount of code exists online that already solves this problem, at least partially.
      Let your subconscious do the heavy lifting&#8212;that's what it's good at
      Learn to silence your mind
      There is no box!
      Incoming freshman are taught to pass tests
      Fostering critical thinking and alternative thinking methods to discover solutions

  - heading: Engaging Students
    text: |
      In-class youtube breaks
      Humor
      Problem of the day
      iPhones have destroyed attention spans
      Inspire a sense of community in the class room
      Creates a comforting environment for students to take chances

---

{% for i in page.teaching_statement %}
<div style="text-align:justify"><h2>{{i.heading}}</h2> {{i.text | markdownify}}</div>
{% endfor %}
