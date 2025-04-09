#!/bin/bash 
set -a
source .env
source test/scripts/logging.sh
set +a 

echo "Starting test script..."
echo "Current directory: $(pwd)"

if [ ${#ANSIBLE_USER} -ge 1 ]; then
    echo "ANSIBLE_USER is set to $ANSIBLE_USER"
else
    echo "ANSIBLE_USER is not set or empty"
    echo "Please set ANSIBLE_USER in .env file"
    echo "Exiting..."
    exit 1
fi 

echo "Starting vagrant VM for testing..."
cd test/vagrant 
vagrant up 
if [ $? -ne 0 ]; then
    echo "Vagrant up failed"
    exit 1
fi
echo "Vagrant up succeeded"
IP=$(vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "Failed to get IP address from Vagrant VM"
    exit 1
fi
echo "USER: $ANSIBLE_USER"
echo "IP: $IP"


cd - 

