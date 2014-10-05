# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Avoid 'stdin is not a tty' error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # Specify locale
  config.vm.provision 'shell', inline: 'locale-gen en_AU.UTF-8'

  config.vm.provision :babushka do |babushka|
    babushka.local_deps_path = 'babushka-deps'
    babushka.meet 'nginx',
      :params => {
        :site => 'ledgerdary',
        :source => '/vagrant/dist'
      }
  end
end
