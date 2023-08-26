#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if ! command_exists docker; then
    read -p "Docker is not installed. Do you want to install Docker? (yes/no): " install_docker
    if [ "$install_docker" == "yes" ]; then
        # Install Docker
        sudo apt-get update
        sudo apt-get install ca-certificates curl gnupg -y
        sudo install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
        sudo usermod -aG docker "$USER"
        echo "Docker installed and current user added to the docker group."
    else
        echo "Exiting script."
        exit 0
    fi
fi

# Check if Docker Compose is installed
if ! command_exists docker-compose && ! command_exists docker compose; then
    read -p "Docker Compose is not installed. Do you want to install Docker Compose? (yes/no): " install_compose
    if [ "$install_compose" == "yes" ]; then
        # Attempt to install Docker Compose Plugin
        sudo apt-get install docker-compose-plugin -y 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "Docker Compose installed."
        else
            # If plugin installation fails, try installing using apt-get
            sudo apt-get install docker-compose -y
            echo "Docker Compose installed using apt-get."
        fi
    else
        echo "Exiting script."
        exit 0
    fi
fi



