#!/usr/bin/env bash
#
# bootstrap.sh
# -- script to bootstrap chef on workstation and robots
#

# determine what OS are we on, osx (darwin) or ubuntu (linux-gnu)
SL_GCC_INSTALLER='GCC-10.6.pkg'
SL_GCC_INSTALLER_URL='https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.6.pkg'
SL_GCC_INSTALLER_CHECKSUM='650cc32d89beb50841696aeb37a4c2d5'

osx(){
  echo "bootstrapping osx workstation"
  echo "installing osx gcc installer..."
  \curl ${SL_GCC_INSTALLER_URL} -o ~/Downloads/${SL_GCC_INSTALLER}
  if [ "${SL_GCC_INSTALLER_CHECKSUM}" = "`md5 ~/Downloads/${SL_GCC_INSTALLER} | cut -d= -f2 | sed -e 's/[ ]//g'`" ]
  then
    sudo installer -pkg ~/Downloads/${SL_GCC_INSTALLER}  -target /
    rm ~/Downloads/${SL_GCC_INSTALLER}
  else
    echo "installer doesn't match expected checksum. Exiting..."
    exit 1
  fi 

  echo "installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

  echo "installing git..."
  brew install git

  echo "upgrading homebrew..."
  brew update
  brew upgrade

  echo "installing ruby and rvm..."
  \curl -L https://get.rvm.io | bash -s stable --ruby

  echo "updating rubygems..."
  gem install rubygems-update

  echo "installing chef..."
  gem install chef --no-ri --no-rdoc
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
