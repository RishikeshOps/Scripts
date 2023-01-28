#!/bin/bash

#Docker Installetion
sudo apt update 
sudo apt  install docker.io -y

#Jenkins Installetion 
#for jenkins firstly you need java so 
sudo apt update
sudo apt install default-jdk -y

#Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install jenkins -y

#for start jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

