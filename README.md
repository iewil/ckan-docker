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
sudo docker run hello-world




##dockerfile 
login as sudo
`sudo -i`
sudo apt-get update
sudo apt-get install python-dev postgresql libpq-dev python-pip python-virtualenv git-core solr-jetty
sudo apt install python-pastescript
sudo mkdir -p /usr/lib/ckan/default
sudo chown <username> /usr/lib/ckan/default

sudo mkdir -p /usr/lib/ckan/default
sudo chown <username> /usr/lib/ckan/default
virtualenv --no-site-packages /usr/lib/ckan/default
. /usr/lib/ckan/default/bin/activate

pip install -e 'git+https://github.com/ckan/ckan.git#egg=ckan'

pip install -r /usr/lib/ckan/default/src/ckan/requirements.txt
deactivate

sudo -u postgres createuser -S -D -R -P ckan_default
sudo -u postgres createdb -O ckan_default ckan_default -E utf-8

sudo mkdir -p /etc/ckan/default
sudo chown -R username /etc/ckan/

paster make-config ckan /etc/ckan/default/development.ini

--> edit development.ini to include new postgres password

##installing solr
sudo apt-get update && apt-get upgrade -y
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
