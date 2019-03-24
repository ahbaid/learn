# Chef

## Pre-requisites::

### Chef Development Kit:
* http://downloads.chef.io
* Ubuntu 16.04 - https://packages.chef.io/files/stable/chefdk/3.6.57/ubuntu/16.04/chefdk_3.6.57-1_amd64.deb
* Ubuntu 18.04 - https://packages.chef.io/files/stable/chefdk/3.6.57/ubuntu/18.04/chefdk_3.6.57-1_amd64.deb
* Version Check:
~~~~
$ chef --version
Chef Development Kit Version: 3.6.57
chef-client version: 14.8.12
delivery version: master (5fb4908da53579c9dcf4894d4acf94d2d9ee6475)
berks version: 7.0.7
kitchen version: 1.24.0
inspec version: 3.2.6
~~~~

### Vagrant:
* http://vagrantup.com
* https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.deb
* Version Check:
~~~~
$ vagrant --version
Vagrant 2.2.3
~~~~

### VirtualBox:
* https://www.virtualbox.org/wiki/Linux_Downloads
* 6.0 for Ubuntu 18.04/10 - https://download.virtualbox.org/virtualbox/6.0.2/virtualbox-6.0_6.0.2-128162~Ubuntu~bionic_amd64.deb
* Pre-requisite packages for 18.04:
~~~~
apt install libqt5x11extras5
apt install libsdl-ttf2.0-0
~~~~
* Version Check:
~~~~
$ VBoxManage --version
6.0.2r128162
~~~~
