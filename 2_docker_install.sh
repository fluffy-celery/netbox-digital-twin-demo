#!/bin/bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "--- Installing Docker ---"  
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker docker-compose

bash -c "$(curl -sL https://get.containerlab.dev)"
sudo apt install python3
sudo apt install python3.10-venv

echo "--- Creating Python3 virtual Env ---"
python3 -m venv venv
source ./venv/bin/activate
#echo "--- Installing config management requirements ---"
#pip install -r ./config_mgmt/requirements.txt
echo "Run: 'source venv/bin/activate' to activate the venv."

echo "--- Starting Virtual Enviorment ---"
source venv/bin/activate