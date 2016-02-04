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
of everything for you.
