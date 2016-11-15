#!/bin/bash

function install_docker_apt {

  if hash docker 2>/dev/null; then
    echo "Docker is already installed"
  else
  	apt_quiet_update;
  	apt_install linux-image-extra-$(uname -r)
    apt_install linux-image-extra-virtual
  	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  	apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
  	apt_quiet_update;
  	apt-cache policy docker-engine;
  	apt_install docker-engine;
  	usermod -aG docker $SUDO_USER
  fi
}
