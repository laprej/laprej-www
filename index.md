---
layout: default
title: Home
tagline: Rensselaer Polytechnic Institute
---

<img src="img/JustinBerkeley.jpg" class="img-rounded img-responsive"/>

<div id="timeline" class="pull-right col-md-5">
<a class="twitter-timeline" href="https://twitter.com/laprej" data-widget-id="686692552041492480">Tweets by @laprej</a>
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
I recently completed my Ph.D. in Computer Science at Rensselaer Polytechnic Institute under my advisor [Christopher Carothers](http://www.cs.rpi.edu/~chrisc).
My research interests include high performance computing (HPC), parallel discrete-event simulations (PDES), optimistic simulation using Jefferson's Time Warp protocol, and how to reduce development time and complexity by leveraging the compiler.
The majority of this research has been conducted using [Rensselaer's Optimistic Simulation System (ROSS)](https://github.com/carothersc/ROSS) which was developed by Dr. Carothers and his graduate students over the years.

## Research Interests
I am interested in simulating bigger problems today than we did yesterday.
And bigger again tomorrow.
In order to keep expanding the size of the problems we are able to tackle, we need to keep improving the simulation software we have available.

In order to drive this progression forward, we must investigate multiple avenues of research.
These include model refinement, data compression, and compiler-assisted tools to help develop robust, correct, and high-performance code.
As the cost of data movement is beginning to dominate, it makes sense to question assumptions about where to perform computations on that data.

Additionally, new simulators will be needed to run on the supercomputers of tomorrow.
Scaling issues must be addressed as these machines evolve in new and unforeseen ways e.g., power, threads per core, etc.
In turn, modern software engineering techniques will be required to provide the foundation for building the next generation of simulation platforms and toolkits.

## Projects

Read more about various work in progress and past on the [Projects](projects/index.html) page. A few highlights:

- [LORAIN](projects/index.html#LORAIN): Automatically generating reverse event handlers to support optimistic PDES.
