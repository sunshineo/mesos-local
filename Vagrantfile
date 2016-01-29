# Vagrant.configure takes the api version as a parameter, currently 2
Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.landrush.enabled = true

  config.vm.define "tms-mesos-001.iad.prod.zulily.com" do |instance|
    instance.vm.box = "ubuntu/trusty64"
    instance.vm.network "private_network", ip: "172.16.0.101", virtualbox__intnet: "c001c96a3f"
    instance.vm.hostname = "tms-mesos-001.iad.prod.zulily.com"
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
  end

  config.vm.define "tms-mesos-002.iad.prod.zulily.com" do |instance|
    instance.vm.box = "ubuntu/trusty64"
    instance.vm.network "private_network", ip: "172.16.0.102", virtualbox__intnet: "c001c96a3f"
    instance.vm.hostname = "tms-mesos-002.iad.prod.zulily.com"
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
  end

  config.vm.define "tms-mesos-003.iad.prod.zulily.com" do |instance|
    instance.vm.box = "ubuntu/trusty64"
    instance.vm.network "private_network", ip: "172.16.0.103", virtualbox__intnet: "c001c96a3f"
    instance.vm.hostname = "tms-mesos-003.iad.prod.zulily.com"
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
  end

  config.vm.define "tms-mesos-004.iad.prod.zulily.com" do |instance|
    instance.vm.box = "ubuntu/trusty64"
    instance.vm.network "private_network", ip: "172.16.0.104", virtualbox__intnet: "c001c96a3f"
    instance.vm.hostname = "tms-mesos-004.iad.prod.zulily.com"
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
  end
  config.vm.define "tms-mesos-005.iad.prod.zulily.com" do |instance|
    instance.vm.box = "ubuntu/trusty64"
    instance.vm.network "private_network", ip: "172.16.0.105", virtualbox__intnet: "c001c96a3f"
    instance.vm.hostname = "tms-mesos-005.iad.prod.zulily.com"
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
  end
  config.vm.define "tms-mesos-006.iad.prod.zulily.com" do |instance|
    instance.vm.box = "ubuntu/trusty64"
    instance.vm.network "private_network", ip: "172.16.0.106", virtualbox__intnet: "c001c96a3f"
    instance.vm.hostname = "tms-mesos-006.iad.prod.zulily.com"
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
  end

end
