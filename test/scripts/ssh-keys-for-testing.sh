#!/bin/bash

# Simple script to generate temporary SSH keys

# Set temporary directory for keys
PROJECT_DIR="./temp_ssh_keys"

# Create the directory if it doesn't exist
mkdir -p ${PROJECT_DIR}

# Generate a timestamp for unique naming
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Check if no keys already exists 
if [ -f "${PROJECT_DIR}/id_rsa" ]; then
  echo "Temporary SSH keys already exist in ${PROJECT_DIR}. Please remove them before running this script."
  exit 1
fi


# Generate the key (Ed25519, no passphrase)
ssh-keygen -t ed25519 -N "" -f "${PROJECT_DIR}/id_rsa" -C "tempkey@test" -q

echo "Temporary SSH keys generated:"
echo "  Private key: ${PROJECT_DIR}/id_rsa"
echo "  Public key:  ${PROJECT_DIR}/id_rsa.pub"