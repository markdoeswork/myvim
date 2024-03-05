#!/bin/bash

# Check if the number of arguments is equal to 2
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 username ip_address"
  exit 1
fi

# Assign arguments to variables
USERNAME=$1
IP_ADDRESS=$2

# Copy the .vimrc file to the remote server
scp ~/.vimrc ${USERNAME}@${IP_ADDRESS}:~/

