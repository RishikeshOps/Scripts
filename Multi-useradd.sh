#!/bin/bash

# Prompt the user for the number of users to create
read -p "Enter the number of users to create: " num_users

# Loop through each user and create the account
for (( i=1; i<=$num_users; i++ ))
do
    # Prompt the user for the username and password
    read -p "Enter username for user $i: " username
    read -p "Enter password for user $i: " password

    # Create the user account
    sudo useradd -m $username

    # Set the password for the user account
    echo "$username:$password" | sudo chpasswd

    echo "User account $username created successfully!"
done
