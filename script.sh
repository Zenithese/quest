#! /bin/bash
cd home/ec2-user/
sudo yum -y update
sudo yum -y install git
sudo yum -y install httpd
sudo service httpd start
sudo yum -y install docker
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo service docker start
git clone https://github.com/Zenithese/quest.git
cd quest/
sudo docker-compose up