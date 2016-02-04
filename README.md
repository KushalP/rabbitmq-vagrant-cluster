# rabbitmq-vagrant

This repo creates a three node vagrant cluster using the public Chef
RabbitMQ cookbook.

## Dependencies

You will need the following software installed:

 - [vagrant](https://www.vagrantup.com/)
 - [Ruby](https://www.ruby-lang.org/) and [RubyGems](https://rubygems.org/)
 - [Bundler](http://bundler.io/)
 - [make](https://www.gnu.org/software/make/)

## Building the cluster

To build the cluster, a `Makefile` has been provided that takes care
of everything for you. To run the tasks in the `Makefile`, run `make`.

### Extra provisioning step

When provisioning nodes, the changes to `/etc/hosts` aren't picked up
immediately. This causes issues with RabbitMQ as it's unable to find
the nodes we're telling it. To get around this, we're first
provisioning RabbitMQ and then setting it up as a cluster.
