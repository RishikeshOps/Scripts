#!/bin/bash

#Docker Installetion
sudo apt update 
sudo apt  install docker.io -y
sudo apt install docker-compose -y

#Jenkins Installetion 
#for jenkins firstly you need java so 
sudo apt update
sudo apt install openjdk-11-jre -y

#Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

#for start jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

