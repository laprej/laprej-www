---
layout: post
title: "Simulating an interactive Twitter workload"
description: "My latest project has led me to try to simulate workloads from real-world social networks. Starting from Graph500's Kronecker graph and integrating with Retwis, with a sprinkle of my own retweet behavior, I came up with something that works for me that I thought I'd share."
---


```{r include=F}
source('common.R')
```

Here is the code loading results from our database:

```{r, echo=T}
d <- data(db("SELECT * FROM tapir WHERE total_time is not null AND name LIKE 'claret-v0.14%'"))
```

Now we plot it with a simple smoothing function:

```{r time}
ggplot(subset(d, nshards==4 & initusers==4096), aes(
    x=nclients, y=total_time, group=cc, color=cc
))+stat_smooth()+ylab('Time (s)')+xlab('clients')+
theme_mine
```
