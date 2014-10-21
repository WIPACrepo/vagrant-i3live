#!/bin/bash

echo "---[ Updating existing packages ]---"
sudo yum update -y

echo "---[ Installing EPEL ]---"
sudo yum install -y epel-release
