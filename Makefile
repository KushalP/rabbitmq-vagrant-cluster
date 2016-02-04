.PHONY: deps berkshelf

all: deps berkshelf

deps:
	bundle

berkshelf:
	bundle exec berks install -b Custom.Berksfile
	bundle exec	berks vendor cookbooks -b Custom.Berksfile
