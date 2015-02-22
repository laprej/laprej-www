---
layout: post
title: "Simulating an interactive Twitter workload"
description: "My latest project has led me to try to simulate workloads from real-world social networks. Starting from Graph500's Kronecker graph and integrating with Retwis, with a sprinkle of my own retweet behavior, I came up with something that works for me that I thought I'd share."
---

This week I submitted some early work on mitigating contention on hot keys in key/value stores to a workshop co-located with EuroSys. In order to better motivate the work, I wanted to recreate scenarios from real life that lead to lots of contention on a few keys. In particular, what is most interesting for my work is cases where a lot of clients are all attempting to read and update the same key at once. One place where this happens organically is when something, such as a tweet, "goes *viral*" and is suddenly being seen, commented on, and re-shared by millions of people. This web phenomenon causes all kinds of problems for designers and maintainers of social networks or really anything on the internet. Though Twitter's [failwhale](http://www.whatisfailwhale.info/) has been retired for a couple years now, and Twitter can now withstand high tweet volumes, even the spikes that follow a #WorldCup goal or Katy Perry's SuperBowl shark, some situations can still slow it to a crawl, like Ellen DeGeneres's 2014 Oscar selfie.

It turned out that just with an existing graph generator and a simple model of user behavior, I was able to recreate some of this viral retweeting behavior in my simulated workload to put my system to the test.

I started with an application based on [Retwis](http://redis.io/topics/twitter-clone), which is a Twitter clone which serves as an example of how to use [Redis](http://redis.io), a popular key-value store. But to get a workload that taxes this application in a realistic way, I had to build a realistic graph, and come up with the operations, such as tweeting and following, that matched what Twitter sees every day.

## Followers following power law

Natural graphs, in particular social network graphs, follow particular patterns. They tend to be low-diameter (the "six degrees of Kevin Bacon" property), and the degree distribution follows a power law: most people have a handful of friends or followers (in my case, on the order of 0), while a handful of people (Katy Perry, Justin Bieber, Barack Obama) have many millions of followers. We know how to reproduce graphs with this same degree distribution with a class of synthetic graphs known as [Kronecker graphs](http://cs.stanford.edu/people/jure/pubs/kronecker-jmlr10.pdf). These graphs at least model the degree distribution, and low diameter correctly, though they may not model other properties, such as communities, quite as well.

Using the Kronecker graph generator from the [Graph500 benchmark](http://graph500.org) (a simplistic benchmark designed to test the graph analytics performance of supercomputers), it was easy to create a graph of users that follow each other in a way that matches real networks:

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
```

```{r followers}
d.follow <- histogram.facets(subset(df,
    initusers == 4096 & mix == 'geom_repost'
), 'stat_follower_counts', 'grp')
ggplot(d.follow, aes(x=x, weight=y))+
    stat_ecdf(color=c.blue)+
    xlab('# followers / user (log scale)')+ylab('CDF (log scale)')+
    scale_x_log10(breaks=c(1,10,100,1000))+scale_y_log10(breaks=c(0.1,0.5,1.0))+
    theme_mine
```

The plot above shows the distribution of the number of followers each user has in my synthetic graph with roughly 4000 users. It's plotted as a cumulative distribution function (CDF). On a log-log plot (both axes on logarithmic scales), a power-law distribution should look like a straight line, which it mostly does here. The way to read this is that 50% of the users have less than 100 followers, while a few users have nearly 2000, or half the network, following them.

## Retweeting behavior

To come up with a Twitter-like workload for this key-value store, I started by just having clients randomly choose between a few operations with some probability.

- Read the most recent tweets on their timeline *(75% chance)*
- Post a new tweet *(15% chance)*
- Follow another user *(5% chance)*
- Unfollow someone they're already following *(3% chance)*
- Create a new user *(2% chance)*

With the exception of "new user", the user (or users) in question are chosen uniformly randomly.

I added to this the ability to retweet a post, that is, to share a post on your timeline with all of your followers. You can't retweet something you haven't seen, though, so this retweeting behavior, rather than independently sampling from posts, is linked to the "read timeline" action. When a client reads a users's timeline, they then have some probability of retweeting some of the tweets. I do this by randomly choosing a number to retweet using a geometric distribution, which will be skewed toward 0, so most will not result in any retweets, but approximately 20% will have at least 1 retweet, and some may retweet as many as 8 from one timeline load.

In reality, tweets can go viral for a variety of reasons related to their content or their timeliness, or their use of hashtags, or whatever. The content of my simulated tweets is just random garbage (actually, it's [Hipster Ipsum](http://hipsum.co/)), so obviously the content can't affect it. Instead, I approximate the desired behavior by ranking tweets by the number of times they have been retweeted and retweeting those first.

<!-- When you're retweeting, however, you aren't creating a new post. Somewhere, we have to keep track of who has retweeted a given tweet, in order to prevent multiple retweets of the same tweet by the same user, and to show users the count of how many times it has been retweeted and let them expand a list of who has retweeted it. -->

The result is retweeting behavior that again fits a power law, as we can see below in another log-log CDF plot, this time of the number of times each post has been re-posted.

```{r reposts}
d.repost <- histogram.facets(
    subset(df, initusers == 4096 & mix == 'geom_repost')
, 'stat_repost_counts', 'grp')
ggplot(d.repost, aes(x=x, weight=y))+
    stat_ecdf(color=c.blue)+
    xlab('# reposts')+ylab('count')+
    scale_x_log10(breaks=c(1,10,100,1000))+
    scale_y_log10(breaks=c(0.1,0.2,0.4,0.6,0.8,1.0))+
    xlab('# reposts (log scale)')+ylab('CDF (log scale)')+
    theme_mine
```

Again, we can see it roughly follows a straight line, and again, most tweets are retweeted few times (40% less than 10 reposts), while a few are retweeted over 1000 times, so they are likely seen by a large fraction of the social network. This retweeting distribution matches some studies that have been done of Twitter.

I just thought it was cool that simply having the power-law degree distribution and retweeting the more popular tweets led to this complex behavior. It also, conveniently, worked in the favor of my modified key-value store which leverages commutativity to avoid falling over under these high-contention situations. I'll post soon in more detail about this work, but just to give a taste of it, here is a graph of the throughput as we increase the number of clients (and therefore the amount of contention), on a baseline system ("reader/writer") and my modified version ("commutative"):

```{r throughput}
require(scales)
d <- claret_data("name LIKE 'claret-v0.14%'")
d.u <- subset(d, nshards == 4 & initusers == 4096 
                & grepl('geom_repost', mix))
ggplot(d.u, aes(x=nclients, y=throughput/1000, 
        group=cc, fill=cc, color=cc, linetype=cc))+
    stat_summary(fun.y=mean, geom="line", size=0.4)+
    xlab('Concurrent clients')+ylab('Throughput (k trans. / sec)')+
    expand_limits(y=0)+
    theme_mine+
    scale_x_continuous(trans=log2_trans(), breaks=c(4,8,16,32,64))+
    theme(legend.position='right', legend.direction='vertical', legend.title.align=0)+
    cc_scales(title='Concurrency\ncontrol:')
```
