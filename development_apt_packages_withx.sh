#!/bin/bash

function install_development_apt_packages_withx {

  declare -a DEVELOPMENT_APT_PACKAGES_WITHX=(
    brasero
    geany
    git-gui
    gksu
    gnome-disk-utility
    gnome-system-monitor
    gparted
    keepassx
    p7zip-full
    synaptic
    xclip
  )

  for element in ${DEVELOPMENT_APT_PACKAGES_WITHX[@]}; do
    apt_install $element;
  done

  unset DEVELOPMENT_APT_PACKAGES_WITHX;
}
