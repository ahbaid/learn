# Ubuntu Notes

# Releases
* https://wiki.ubuntu.com/Releases

# Updating
### List Upgradeable Packages
~~~~
sudo apt list --upgradeable
~~~~
### Update & Upgrade Packages:
~~~~
sudo apt update
sudp apt upgrade
~~~~
### Update Dependencies
~~~~
sudo apt-dist upgrade
~~~~
### Configure unpacked packages
~~~~
dpkg --configure -a
~~~~
### Remove Dependencies for Uninstalled Packages
~~~~
sudo apt-get autoremove
~~~~

# Upgrading 
### Update Manager Core
~~~~
sudo apt install update-manager-core
~~~~
### Upgrade Release
~~~~
sudo do-release-upgrade
~~~~
### Upgrade Release (to the Beta/Development version)
~~~~
sudo do-release-upgrade -d
~~~~

# Updating a Single Package
~~~~
sudo apt-get install --only-upgrade mypackage
~~~~
or
~~~~
sudo apt-get dist-upgrade mypackage
~~~~
or
~~~~
sudo apt-get upgrade mypackage
~~~~

# Install Unity on 18.04
* Ubuntu 18.04 uses Gnome as the default desktop.
* These instructions install the Unity desktop.
~~~~
sudo apt install ubuntu-unity-desktop
~~~~
* See https://linuxconfig.org/how-to-install-unity-desktop-on-ubuntu-18-04-bionic-beaver-linux


