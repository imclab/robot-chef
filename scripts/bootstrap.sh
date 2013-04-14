#!/usr/bin/env bash
#
# bootstrap.sh
# -- script to bootstrap chef on workstation and robots
#

# determine what OS are we on, osx (darwin) or ubuntu (linux-gnu)

osx(){
  echo "bootstrapping osx workstation"
  echo "installing ruby and rvm..."
  \curl -L https://get.rvm.io | bash -s stable --ruby

  echo "updating rubygems..."
  sudo gem install rubygems-update

  echo "installing chef..."
  sudo gem install chef --no-ri --no-rdoc

  echo "finished bootstrapping osx!"
}

ubuntu(){
  echo "bootstrapping ubuntu workstation or robot"

  echo "adding repository to apt sources..."
  echo "deb http://apt.opscode.com/ precise-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list

  echo "adding key..."
  sudo mkdir -p /etc/apt/trusted.gpg.d
  gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
  gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
  
  echo "updating packages and installing chef..."
  sudo apt-get update
  sudo apt-get install opscode-keyring
  sudo apt-get upgrade
  sudo apt-get install chef

  echo "done provisioning ubuntu host!"
}

if [ 1 == `echo $OSTYPE | grep -ic 'darwin'` ]
then
  osx
else
  ubuntu
fi