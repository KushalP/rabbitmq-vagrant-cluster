# rabbitmq-vagrant-cluster

This repo creates a three node vagrant cluster using the public Chef
RabbitMQ cookbook.

## Dependencies

You will need the following software installed:

 - [Vagrant](https://www.vagrantup.com/)
 - [Ruby](https://www.ruby-lang.org/) and [RubyGems](https://rubygems.org/)
 - [Bundler](http://bundler.io/)
 - [Make](https://www.gnu.org/software/make/)

## Building the cluster

To build the cluster, a `Makefile` has been provided that takes care
of everything for you. To run the tasks in the `Makefile`, run `make`.

### Extra provisioning step

When provisioning nodes, the changes to `/etc/hosts` aren't picked up
immediately. This causes issues with RabbitMQ as it's unable to find
the nodes we're telling it. To get around this, we're first
provisioning RabbitMQ and then setting it up as a cluster.

### Administering cluster

You have two options to administer the cluster.

#### Using the admin UI

Once the cluster has been provisioned, you can login to the admin UI
at http://10.125.0.11:15672/ using `admin` as the username and
password.

#### Over SSH

You can SSH to any of the nodes in the cluster using `vagrant ssh
$NODE` where `$NODE` is one of `node1`, `node2` or `node3`.
