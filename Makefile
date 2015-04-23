PYTHON=python2.7

# targets that aren't filenames
.PHONY: all clean deploy

CSEHOST := bicycle.cs.washington.edu
deploy: BUILDARGS := --config _config.yml,_config_sandbox.yml

setup:
	bundle install
	
build: setup
	bundle exec jekyll build --config _config.yml,_deploy.yml

deploy: clean build
	rsync --compress --recursive --checksum --itemize-changes --perms --chmod=ug+rw,o+r --exclude=files/ --delete _site/ $(CSEHOST):/cse/web/homes/bholt
