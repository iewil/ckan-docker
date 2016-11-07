# ckan-docker
Docker image for CKAN
- Ubuntu 16.04

Instructions

1. Log into your machine as a user with sudo or root privileges.
2. Open a terminal window.
3. Update package information, ensure that APT works with the https method, and that CA certificates are installed.

`$ sudo apt-get update`

`$ sudo apt-get install apt-transport-https ca-certificates`

4. Add the new GPG key.

`$ sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D`

`echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list`
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start