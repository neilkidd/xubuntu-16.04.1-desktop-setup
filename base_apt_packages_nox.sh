#!/bin/bash

function install_base_apt_packages_nox {
  
  declare -a BASE_APT_PACKAGES_NOX=(
    aptitude
    autoconf
    build-essential
    curl
    gdebi-core
    git
    git-core
    libavcodec-extra
    libcurl4-openssl-dev
    libffi-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    libxml2-dev
    libxslt1-dev
    libyaml-dev
    openssh-client
    openssh-server
    python-software-properties
    rar
    rsync
    samba
    software-properties-common
    sqlite3
    zlib1g-dev
  )
  
  for element in ${BASE_APT_PACKAGES_NOX[@]}; do
    apt_install $element;
  done
  
  unset BASE_APT_PACKAGES_NOX
}



