---
layout: default
title: Home
tagline: University of Washington
---

<img src="img/seattle.jpg" class="img-rounded img-responsive"/>

<div id="timeline" class="pull-right col-md-5">
<a class="twitter-timeline pull-right" height=400px href="https://twitter.com/holtbg" data-widget-id="545291687996571648">Tweets by @holtbg</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>

## News
<ul class="news list-unstyled">
{% for post in site.posts limit: site.front_page_news %}
    {% if post.shortnews %}
        <li class="shortnews">
            <span class="date">{{ post.date | date_to_long_string }}</span>
            {{ post.content }}
        </li>
    {% else %}
        <li class="bloglink">
            <span class="date">{{ post.date | date_to_long_string }}</span>
            <a href="{{site.base}}{{ post.url }}">&raquo; {{ post.title }}</a>
        </li>
    {% endif %}
{% endfor %}
</ul>
{% assign numposts = site.posts | size %}
{% if numposts >= site.front_page_news %}
<p><a href="{{ site.base }}/posts/">&hellip;</a></p>
{% endif %}

## About Me
I am a grad student at the University of Washington, pursuing a PhD in Computer Science and Engineering. My research interests include exploring programming models, languages, and compilers for the purposes of exposing and expressing parallelism in a way that existing architectures can use it. My research is done as part of the Computer Architecture group at UW ([Sampa](http://sampa.cs.washington.edu)), with co-advisors [Luis Ceze](http://www.cs.washington.edu/homes/luisceze/) and [Mark Oskin](http://www.cs.washington.edu/homes/oskin). With them, I am working on the [Grappa](http://grappa.io) project, an effort to improve performance of irregular applications on commodity clusters in software.

## Research Interests
I'm interested in helping people solve tough problems using the most powerful computer they have available. 

Right now, the *tough problems* people seem to be facing involve analyzing and understanding large, irregular data sets (including such "Big Data" problems as social network analytics). These problems are particularly challenging because their execution is highly data-dependent and unpredictable, wreaking havoc on systems which are optimized for regular access patterns.

For many people — in particular, most data scientists — the *most powerful computer* they have access to is actually pretty beefy: a compute cluster, even if it's just an on-demand cluster from the cloud. These highly-parallel distributed-memory machines are notoriously difficult to do useful things with.

Solving these problems requires being willing to change any part of the traditional "stack": hardware, compiler, runtime, programming language, or tools. I enjoy hacking LLVM to automatically extract communication, develop fancy C++11 interfaces to runtimes, and exploring how to leverage high-level program information to optimize low-level runtime calls.

## Projects

Read more about various work in progress and past on the [Projects](projects/index.html) page. A few highlights:

- [Claret](projects/index.html#Claret): Bringing ADTs and approximate computing to NoSQL databases.
- [Grappa](projects/index.html#Grappa): Picking up the slack in commodity clusters for irregular applications.
- [Igor](projects/index.html#Igor): A system to make it easier to run parameter sweeps and collect data from experiments.

## Personal
Despite appearances, in addition to locking myself up in a room coding all day, I do other things as well. I enjoy hiking, soccer, frisbee, and sci-fi. I particularly like mountains, in which Washington is not disappointing me.
