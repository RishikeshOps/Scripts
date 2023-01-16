#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io -y

sudo usermod -aG docker $USER
