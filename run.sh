#!/bin/bash 
set -a
source .env
set +a

echo 

ansible-playbook -i inventory.ini playbook.yml 
