.PHONY: deps berkshelf up

all: deps berkshelf up

deps:
	bundle

berkshelf:
	bundle exec berks install -b Custom.Berksfile
	bundle exec	berks vendor cookbooks -b Custom.Berksfile

up:
	vagrant up
