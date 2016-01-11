# Justin M. LaPre's Personal Webpage

This is the source for my personal webpage, visible at:
- http://www.cs.rpi.edu/~laprej

Created using [Jekyll](http://jekyllrb.com) & [Twitter Bootstrap](http://getbootstrap.com).

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


## Todo
- [ ] Upgrade to Bootstrap v4 as in sampa-public
- [ ] Refactor styles to use Sass/scss
- [ ] Figure out what we can do better now with Jekyll 3
