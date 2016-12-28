#!/bin/bash

function install_vagrant {

  if hash vagrant 2>/dev/null; then
    echo "Vagrant is already installed"
  else
    mkdir -p ~/tmp/vagrant
    cd ~/tmp/vagrant
    wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb
    sudo dpkg -i ./vagrant_1.9.1_x86_64.deb
    cd ~
    rm -Rf ~/tmp/vagrant
  fi

}
