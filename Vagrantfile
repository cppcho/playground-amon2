Vagrant.configure("2") do |config|
config.vm.box = "bento/centos-6.9"
    config.vm.network "private_network", ip: "192.168.33.12"
    config.vm.hostname = "manga"

    config.vm.synced_folder ".", "/myapp", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
end
