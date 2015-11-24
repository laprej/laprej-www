PYTHON=python2.7

# targets that aren't filenames
.PHONY: all clean deploy

CSEHOST := bicycle.cs.washington.edu
deploy: BUILDARGS := --config _config.yml,_config_sandbox.yml

define graffle2svg
	$(eval PDF := $(subst .svg,.pdf,$(3)))
	omnigraffle-export -c $(2) $(1) $(PDF)
	pdf2svg $(PDF) $(3)
	rm $(PDF)
endef

# img/retwis-overview.svg: _media/retwis.graffle
# 	$(call graffle2svg,$<,overview,$@)
#
# img/retwis-me-vs-ellen.svg: _media/retwis.graffle
# 	$(call graffle2svg,$<,me-vs-ellen,$@)
#
# media: img/retwis-overview.svg img/retwis-me-vs-ellen.svg

img/retwis-overview.png: _media/retwis.graffle
	omnigraffle-export -c overview $< $@

img/retwis-me-vs-ellen.png: _media/retwis.graffle
	omnigraffle-export -c me-vs-ellen $< $@

img/retwis-approx.svg: _media/retwis.graffle
	$(call graffle2svg,$<,approx-size,$@)

media: img/retwis-overview.png img/retwis-me-vs-ellen.png img/retwis-approx.svg


setup:
	bundle install

build: setup
	bundle exec jekyll build --config _config.yml,_deploy.yml

deploy: clean build
	rsync --compress --recursive --checksum --itemize-changes --perms --chmod=ug+rw,o+r --exclude=bin/ --exclude=drafts/ --exclude=pdf/ --exclude=private/ --delete _site/ $(CSEHOST):/cse/web/homes/bholt
	scp -r drafts $(CSEHOST):/cse/web/homes/bholt

clean:
	rm -rf _site
