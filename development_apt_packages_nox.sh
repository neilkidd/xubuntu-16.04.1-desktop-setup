#!/bin/bash

function install_development_apt_packages_nox {
  
  declare -a DEVELOPMENT_APT_PACKAGES_NOX=(
    ack-grep
    htop
    libav-tools
    mediainfo
    nmap
    tmux
    tree
    vim
  )
  
  for element in ${DEVELOPMENT_APT_PACKAGES_NOX[@]}; do
    apt_install $element;
  done
  
  unset DEVELOPMENT_APT_PACKAGES_NOX;
}



