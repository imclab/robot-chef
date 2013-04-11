#!/usr/bin/env bash
#
# bootstrap.sh
# -- script to bootstrap chef on workstation and robots
#

# determine what OS are we on, osx (darwin) or ubuntu (linux-gnu)

osx(){
  echo "bootstrapping osx workstation"
  # download xcode (from personal repo)
  # mount dmg
  # run installer

  # download homebrew

  # install git

  # install ruby with rvm
  #\curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled # Or, --ruby=1.9.3

  # install/update rubygems
  # install chef
  # we are done!
}

ubuntu(){
  echo "bootstrapping ubuntu workstation or robot"

  # add opscode repo to apt sources
  # install ruby
  # install git core
  # install rubygems
  # install chef
  # we are done bootstrapping
}

if [ 1 == `echo $OSTYPE | grep -ic 'darwin'` ]
then
  osx
else
  ubuntu
fi
