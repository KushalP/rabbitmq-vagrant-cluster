.PHONY: berkshelf vagrant cluster clean

all: deps berkshelf up cluster

deps:
	bundle

berkshelf:
	bundle exec berks install -b Custom.Berksfile
	bundle exec	berks vendor cookbooks -b Custom.Berksfile

up:
	vagrant up

cluster:
	RABBITMQ_CLUSTER=true vagrant provision

clean:
	@rm -rf cookbooks
	vagrant destroy
