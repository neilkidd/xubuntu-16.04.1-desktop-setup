#!/bin/bash

function purge_apt_packages {
  
  declare -a PURGE_APT_PACKAGES=(
    abiword
    avahi-daemon
    gnumeric
    thunderbird
  )
  
  for element in ${PURGE_APT_PACKAGES[@]}; do
    apt_purge $element;
  done
  
  unset PURGE_APT_PACKAGES
}



