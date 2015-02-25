---
title: Simple Pandoc filter for autoref
description: A dead-simple filter for using Latex's autoref with Scholdoc references.
layout: post
---
### Simple Pandoc filter for autoref
I played around with Pandoc filters to make a simple transformation which I can now use in my Latex documents. Basically, I wanted to add the ability to auto-generate the right text for each kind of reference, the way that `\autoref` does in Latex. Rather than typing out `As we can see in Section [#eval]` every time, I would prefer to write `As we can see in [#eval]`, leaving it up to some rules to generate the "Section 3", making it easy for me to change the rule globally if I wanted to use the abbreviation "§3" (saving all-important space). My filter, which I hacked up in Python because it takes so long to build Haskell (sorry, Haskell lovers), looks like this:

