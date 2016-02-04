Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  nodes = [
    { :hostname => "node1", :ip => "10.125.0.11"},
    { :hostname => "node2", :ip => "10.125.0.12"},
    { :hostname => "node3", :ip => "10.125.0.13"}
  ]

  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      # configure the box, hostname and networking
      node_config.vm.hostname = node[:hostname]
      node_config.vm.network :private_network, ip: node[:ip]

      # use the Chef provisioner to install RabbitMQ
      node_config.vm.provision :chef_solo do |chef|
        chef.node_name = node[:hostname]

        chef.add_recipe "hosts_file"
        chef.add_recipe "hosts_file::custom_entries"

        chef.add_recipe "rabbitmq"
        chef.add_recipe "rabbitmq::cluster"
        chef.add_recipe "rabbitmq::mgmt_console"
        chef.add_recipe "rabbitmq::policy_management"
        chef.add_recipe "rabbitmq::user_management"

        chef.json = {
          "rabbitmq" => {
            "erlang_cookie" => "hutch_cookie",
            "enabled_users" => [
              {
                "name" => "admin",
                "password" => "admin",
                "rights" => [
                  {
                    "vhost" => "/",
                    "conf" => ".*",
                    "write" => ".*",
                    "read" => ".*"
                  }
                ],
                "tag" => "administrator"
              }
            ],
            "policies" => {
              "ha-all" => {
                "pattern" => "^(?!amq\\.).*",
                "params" => {
                  "ha-mode" => "all",
                  "ha-sync-mode" => "automatic"
                },
                "priority" => 0
              }
            },
          },
          "hosts_file" => {
            "custom_entries" => Hash[*nodes.map { |v| v.values.reverse }.flatten]
          }
        }
      end
    end
  end
end
