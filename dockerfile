##dockerfile 
login as sudo
`sudo -i`
sudo apt-get update
sudo apt-get install python-dev postgresql libpq-dev python-pip python-virtualenv git-core solr-jetty
sudo apt install python-pastescript
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

cd /tmp
wget http://download.nus.edu.sg/mirror/apache/lucene/solr/6.2.1/solr-6.2.1.tgz
tar zxf solr-6.2.1.tgz
solr-6.2.1/bin/solr start
