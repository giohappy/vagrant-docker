#!/bin/sh -eux
VAGRANT_USER='vagrant'

apt-get -y update;

sudo apt-get install -y virtualenv python-pip;
sudo pip install virtualenvwrapper;

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ;

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install -y docker-ce;
sudo usermod -aG docker $VAGRANT_USER;
sudo pip install docker-compose;

cat <<EOF >> /home/$VAGRANT_USER/.bashrc
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
EOF


