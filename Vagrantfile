# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network 'private_network', ip: '192.168.10.10'

  # Avoid 'stdin is not a tty' error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # Specify locale
  config.vm.provision 'shell', inline: 'locale-gen en_AU.UTF-8'

  config.vm.provision :ansible do |ansible|
    ansible.inventory_path = 'provisioning/development'
    ansible.limit = 'all'
    ansible.playbook = 'provisioning/site.yml'
  end
end
