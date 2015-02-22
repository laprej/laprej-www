---
layout: post
title: "Simulating an interactive Twitter workload"
description: "My latest project has led me to try to simulate workloads from real-world social networks. Starting from Graph500's Kronecker graph and integrating with Retwis, with a sprinkle of my own retweet behavior, I came up with something that works for me that I thought I'd share."
---

This week I submitted some early work to a workshop co-located with EuroSys in Bordeaux, France. In the process of gathering data for my submission, I discovered some interesting things about simulating social network graphs that I thought I'd share more broadly.

## Followers following power law
Everyone knows the degree distribution of natural graphs follows a power law: most people have a handful of friends or followers (in my case, on the order of 0), while a handful of people (Katy Perry, Justin Bieber, Barack Obama) have many millions of followers. We know how to at least reproduce graphs with this same degree distribution with a class of synthetic graph generators known as Kronecker generators.

```{r, include=F}
source('common.R')
d <- claret_data("name LIKE 'claret-v0.14%'")
```

Now we plot it with a simple smoothing function:

```{r time, echo=T}
ggplot(subset(d, nshards==4 & initusers==4096), aes(
    x=nclients, y=total_time, group=cc, color=cc
))+stat_smooth()+ylab('Time (s)')+xlab('clients')+
theme_mine
```
