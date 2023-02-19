#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER



#this is for user data when creating new instance
