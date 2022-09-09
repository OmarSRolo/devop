#!/usr/bin/env bash
sudo apt update
sudo apt install git apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update && sudo apt upgrade -y
sudo apt-cache policy docker-ce
sudo apt install docker-ce
mkdir "develop"
cd develop || exit
git clone ${git_repo}
