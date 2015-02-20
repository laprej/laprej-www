#!/usr/bin/env Rscript
library("knitr")

## process the command line arguments as 'list' objects
## warning: uses 'eval', is definitely not safe to allow user-generated input
args <- commandArgs(TRUE)[-1]        ## grab arguments
chunk_opts <- eval(parse(text=sprintf('list(%s)',args[1])))
knit_opts <- eval(parse(text=sprintf('list(%s)',args[2])))

## defaults
opts_knit$set(base.url="", base.dir=".", root.dir=NULL, self.contained=FALSE, verbose=FALSE)

## note that objects `.` are just to stop objects returned by function that doesn't need to be assigned (do.call, knitr) spitting NULLs into the stdout stream.

. <- do.call(opts_chunk$set, chunk_opts) ## set chunk options
. <- do.call(opts_knit$set, knit_opts)   ## set knit options

## knit the document being processed; takes input from stdin and outputs to stdout
. <- knit(text = readLines(file("stdin")), output=stdout(), quiet=TRUE)
