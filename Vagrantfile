# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = 'pineapples-ubuntu-14.04.03'
  config.vm.define 'rubyvoodoo'

  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.network :forwarded_port, guest: 22,
                                     host: 2222,
                                     id: 'ssh'


  config.vm.provider 'virtualbox' do |virtual_box|
    virtual_box.name = 'rubyvoodoo'
    # virtual_box.customize ['modifyvm', :id, '--cpuexecutioncap', '100']
  end

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = '.ansible/rails-playbook.yml'
    ansible.inventory_path = '.ansible/inventory'
    ansible.verbose = 'v'
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end
end
