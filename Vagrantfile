disk = './sdb.vdi'
Vagrant.configure("2") do |config|
  config.vm.define "glusterfs01", primary: true do |glusterfs01|
    glusterfs01.vm.box = "centos/7"
    glusterfs01.vm.hostname = 'glusterfs01'

    glusterfs01.vm.network :public_network, ip: "192.168.0.111"

    glusterfs01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 20 * 1024]      
      v.customize ['storageattach', :id,  '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
      v.customize ["modifyvm", :id, "--name", "glusterfs01"]
    end
    #config.vm.provision :shell, path: "bootstrap.sh"

  end

  config.vm.define "glusterfs02" do |glusterfs02|
    glusterfs02.vm.box = "centos/7"
    glusterfs02.vm.hostname = 'glusterfs02'

    glusterfs02.vm.network :public_network, ip: "192.168.0.112"

    glusterfs02.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 20 * 1024]      
      v.customize ['storageattach', :id,  '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
      v.customize ["modifyvm", :id, "--name", "glusterfs02"]
    end
    #config.vm.provision :shell, path: "bootstrap.sh"

  end

  config.vm.define "glusterfs03" do |glusterfs03|
    glusterfs03.vm.box = "centos/7"
    glusterfs03.vm.hostname = 'glusterfs03'

    glusterfs03.vm.network :public_network, ip: "192.168.0.113"

    glusterfs03.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 20 * 1024]      
      v.customize ['storageattach', :id,  '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
      v.customize ["modifyvm", :id, "--name", "glusterfs03"]
    end
    #config.vm.provision :shell, path: "bootstrap.sh"

  end

end