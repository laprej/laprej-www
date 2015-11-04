# Brandon Holt Personal Webpage

This is the source for my personal webpage, visible at:
- https://bholt.github.io
- https://homes.cs.washington.edu/~bholt/

Created using [Jekyll](jekyllrb.com) & [Twitter Bootstrap](getbootstrap.com).

## Setup

I think you should be able to install all the necessary Gems using Bundler:

    > bundle install

## Watching changes

You can always watch changes in Jekyll projects with:

    > jekyll serve --watch

But now I've setup `guard` with LiveReload support so it'll automatically refresh browser windows, too. To use, run:

    > bundle exec guard

This is configured by the `Guardfile`, which was initialized by running:

    bundle exec guard init jekyll-plus

## Using R Markdown
Posts can now execute code in R blocks to generate figures using the `knitr` package. First, you're going to have to install a couple packages, so fire up the R console, and:

    > R
    R version 3.0.2 (2013-09-25) -- "Frisbee Sailing"
    Copyright (C) 2013 The R Foundation for Statistical Computing
    Platform: x86_64-apple-darwin10.8.0 (64-bit)
    ...
    > install.packages("knitr")

Then to create a post with R Markdown, you just need to create a file with `.knitr` extension (`.Rmd` breaks how Jekyll handles `.md` files so we're using this other extension).

Example knitr code:

    ```{r, include=F}
    opts_chunk$set(dev='svg', echo=F, message=F, warning=F, error=F, fig.width=6, fig.height=4)
    source('common.R')
    ```
    
    ```{r, echo=T}
    d <- data(db("SELECT * FROM tapir WHERE total_time is not null AND name LIKE 'claret-v0.14%'"))
    ```
    
    ```{r time}
    ggplot(subset(d, nshards==4 & initusers==4096), aes(
        x=nclients, y=total_time, group=cc, color=cc
    ))+stat_smooth()+ylab('Time (s)')+xlab('clients')+
    theme_mine
    ```


For best results on the web, use `dev='svg'` to generate plots in SVG.

## Todo
- [ ] Upgrade to Bootstrap v4 as in sampa-public
- [ ] Refactor styles to use Sass/scss
- [ ] Figure out what we can do better now with Jekyll 3
