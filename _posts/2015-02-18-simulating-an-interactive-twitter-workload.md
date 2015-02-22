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

library(jsonlite)
df.histogram <- function(json, version="none") {
  d <- fromJSON(json)
  return(data.frame(x=num(names(d)), y=num(unlist(d)), version=version))
}
df <- claret_data("name like '%v0.14%' and nclients = 32 and initusers = 4096")
df$grp <- with(df, sprintf("%s\n%s\nmix:%s/%s,\n%s", name, ccmode, mix, alpha, gen))

histogram.facets <- function(df, measure, grp) {
  d <- data.frame(x=c(),y=c(),version=c())
  for (i in 1:nrow(df)) {
    d <- rbind(d, df.histogram(df[i,measure], df[i,grp]))
  }
  return(d)
}

d <- claret_data("name LIKE 'claret-v0.14%'")
```

Now we plot it with a simple smoothing function:

```{r time, echo=T}
ggplot(subset(d, nshards==4 & initusers==4096), aes(
    x=nclients, y=total_time, group=cc, color=cc
))+stat_smooth()+ylab('Time (s)')+xlab('clients')+
theme_mine
```
