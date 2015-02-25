---
layout: post
title: Scholarly markdown (with R) for fun and more fun (probably no profit)
description: |
  A new workflow for writing up research in Markdown and executing R inline to generate visualizations. Otherwise known as "iPython's not good enough for me".
---

> I've been thinking a lot recently about how I can making it easier for me to share ongoing research.

Thinking so much, in fact, that when I first sat down to write this post, I got as far as writing the above sentence before getting distracted talking to people (mostly officemates [James B.](http://homes.cs.washington.edu/~bornholt/) and Katie K.) and playing around with various technologies for about a month before coming back to write this post. The basic question in my mind was:

> How can I tie together the process of *doing* research with the periodic task of writing up my findings for publication?

Whenever I go to write a paper, I find myself wishing I had spent more time thinking through how I want to present the ideas. I especially wish I had spent more time sketching out what the evaluation will look like, since I invariably come up with a bunch of new experiments which cause me to immediately pause on the writing process and go back to running experiments. I would like to encourage myself (and others) to practice presenting the research, writing down the motivations, hypotheses, and evaluation strategies, as I'm doing it. I also feel like we could benefit as a community from sharing premature ideas to get feedback, inspiration, and avoid common pitfalls.

With the assumption that I'm never going to do any of this if it is a huge pain and distracts me from the questions I'm trying to answer, I set out to come up with a better way to write up my research that I would find both fun and rewarding and that would ideally save time. So naturally, I started with what I didn't like.

### iPython Notebook

I played around for a while trying to use [iPython Notebook](http://ipython.org/notebook.html) to do this. The idea was that I should be able to write about the experiments I'm doing (the motivation behind them, etc) and write the code to actually do the experiments, and the code to plot the results, all in the same tool. The first problem is that I don't actually like Python. Secondly, I don't like having to run an iPython notebook server whenever I want to even look at my file (since the source format for `.ipynb` is indecipherable json). Finally, I can't stand the cell-based execution model of iPython. I'm not a computer, I don't want to have to manually tell it what to run and when.

### Latex

I also have a related frustration with writing papers in Latex. I don't like that all the `\emph{}` `\begin{figure}...\label{}\end{figure}` and `Figure~\ref{fig:blah}` get in the way of the writing, and, more importantly, force the output to only ever go to a PDF, to be submitted to a conference, stew for 6 months, and either appear in the conference or resubmitted (rinse and repeat).

# Building blocks

So, the convergence of these two is that I want something that lets me intersperse writing with code for experiments and visualization, in an easily-readable and sharable format, with the ability to turn it into a blog post or a conference paper.

### Pandoc and Scholarly Markdown

[Pandoc](http://johnmacfarlane.net/pandoc/) is an amazing tool for converting between markup formats. It especially excels at Markdown to HTML and Latex. Their syntax extends basic Markdown with common things like ASCI tables, but more importantly, with syntax for scholarly work, such as citations (`[@bibtex]`). Best of all (for some): it is written in Haskell. For my part, I like that it has decent support for extending processing with "filters", which let you operate directly on the intermediate AST representation, so you can customize how Headers look, without needing to hack on the *very sophisticated* parser needed for handling all of Markdown's magic.

After playing with pure Pandoc for a while, I found a fork, [Scholdoc](http://scholdoc.scholarlymarkdown.com/), which adds support for a dialect known as [Scholarly Markdown](http://scholarlymarkdown.com/). This has really great support for common things like math equations and floats with captions, with a clean, uniform syntax for giving things labels, which can be easily referred to with another easy syntax tweak. For example, to refer to a section:

```
As we will explain in Section [#intro], we...

# Introduction {#intro}
```

Scholarly Markdown seems to fulfill most of my desires for the writing process, allowing an easy syntax that can be turned into HTML/webpages or Latex/PDFs with ease.

### Knitr

The final piece of the puzzle is how to run experiments, explore my data, and generate final plots for my research. My solution to this comes from the ancient vein of [literate programming](http://www.literateprogramming.com/), championed by none other than Donald Knuth.

Despite abhorring the R language as any respectable Programming Language researcher must, it just so happens that I do most of my data exploration and plotting in R because I like [ggplot](http://ggplot2.org/) that much. [Knitr](http://yihui.name/knitr/) embodies the literate programming philosophy, espousing the same goals as me:

> Elegant, flexible and fast dynamic report generation.

Knitr builds upon Sweave, and together they allow one to intersperse blocks of R code within documents (in markup languages such as Markdown). The blocks of R code are executed and their output, be it text, data table, or plot, will be shown inline in the output HTML or Latex document. The source code can optionally be shown in the output as well, resulting in something very similar to iPython notebook's executable cells, interspersed with blocks of text.

# A combined solution

The solution to my problem so far appears to be to combine Knitr's ability to generate plots inline, with Scholdoc's extended markdown syntax. My ongoing efforts live in a project I'm currently calling [Mortarboard](https://github.com/bholt/mortarboard) (get it, like what scholars wear, but sounds something like Markdown).

 So far, I have successfully used variations on the concept to write a recent workshop paper with a sigplanconf latex template. And I worked out how to integrate Knitr with [Jekyll](http://jekyllrb.com/) to make it trivial to explore data and generate plots for blog posts, which I used in my recent post, [Simulating an interactive Twitter workload]({% post_url 2015-02-18-simulating-an-interactive-twitter-workload %}) to generate beautiful SVG plots.


### Next

There is still a bunch I want to do to continue to improve this process. First, I want to clean up the somewhat hacked together solutions into a more reusable form in my [Mortarboard](https://github.com/bholt/mortarboard) project. I think the modifications to Jekyll can easily be contained in a Jekyll plugin. And a better Makefile for building Latex documents from `.Rmd` files is needed.

Further extensions will include support for Latex's `\autoref` in both Latex and HTML outputs. I would also like to figure out how to "include" documents in others to allow me to split larger projects into multiple files, as right now I can only generate output from a single markdown file.

#### Plotly
[Plotly](https://plot.ly/) is an interesting tool for creating web-based visualizations. After dismissing it a year ago, I went back recently and discovered that they now have lots of really cool features to let viewers interact with plots and data, making it possible to imagine having readers explore data from my blog posts themselves, rather than relying on just the interpretation I come up with. Even better, these plots can be programmatically generated from various other plotting libraries, such as Python's matplotlib, or R's ggplot! I'm still working out how to use Plotly with Knitr effectively, and have been a bit frustrated with how not all ggplot features are supported by Plotly, making that conversion a bit difficult.

#### Collaboration
A bunch of collaborative web-based tools for academic writing have been cropping up lately, including [ShareLatex](https://www.sharelatex.com/) and [Authorea](http://authorea.com). I would like to see how to incorporate some of the online collaboration that these platforms facilitate with the convenience and customizability of my new scholarly markdown / knitr setup.
I don't know quite how to do that, maybe something with the Google Docs live collaboration API? I would love to hear more ideas.

Right now, all I have is the ability to edit files online in Github and have Github send a webhook to my colleague [Adrian](http://homes.cs.washington.edu/~asampson/)'s excellent [Hooknook](http://github.com/sampsyo/hooknook) tool, which will build and post the updated version of the paper or blog post, allowing collaborators to always get the latest version.

### Authorea

I am a fan of [Authorea](http://authorea.com/), which I think aims to do exactly what I want. They are a brand new company making waves trying to find new ways of sharing scientific work. Their tool allows writing in simple formats like Markdown, but can also handle Latex when precision is needed. The default output format is a webpage that's minimalistic but tasteful, but they allow exporting to a variety of PDF journal formats, or to raw Latex. They have useful collaboration tools that let you edit your document section by section, locking sections while editing to avoid conflicts, commenting on text, and bibtex citation support. It automatically versions using git and can synchronize with Github. They even recently added support for embedding runnable iPython notebooks!

I am certainly very hopeful about Authorea's ideas and the direction they're going, but a few hangups, mostly just due to its sheer infancy, have kept me from being able to use it right now. First of all, all the javascript they use seems to bog it down even with a moderate few-page article. More importantly, I found it very cumbersome to include plots: if I was iterating on some plot, I had to drag and drop the new version into the webpage every time I wanted to show someone. Embedding the iPython notebook had the same problem, that it couldn't be kept in sync very easily. Finally, the lack of extensibility meant that I couldn't fix little things that bothered me, like not having `\autoref` support, so every time I wanted to refer to a figure, I had to type out "Figure \ref{label}", and the labels had to be done with raw Latex `\label` markers.

I look forward to watching Authorea's progress, and will continue to check in to see what they are coming up with. But in the meantime, I will continue exploring what I can build out of these other tools.

---
Completely disagree with me on every point? Really love iPython (or R, for that matter) and want to fight me about it? Are you really excited about sharing your research, too? I would love to hear your thoughts on the matter, please reach out to me on Twitter: [@holtbg](http://twitter.com/holtbg).
