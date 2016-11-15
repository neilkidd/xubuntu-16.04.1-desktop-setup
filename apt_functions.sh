#!/bin/bash

function apt_dist_upgrade {
  
  apt_quiet_update;
  apt-get -y dist-upgrade;
  apt-get -y autoremove;
  apt-get -y autoclean;
}

function apt_quiet_update {
  
  apt-get -qq -y update;
}

function apt_install(){
  if [ -z "$1" ]
  then
    echo -e "Call to install() - parameter is zero length or empty."
  else
    package_status=$(dpkg-query -W --showformat='${Status}\n' $1|grep "install ok installed")
    
    if [ "" == "$package_status" ]
    then
      echo -e "Installing:$1"
      apt-get -y --force-yes install $1
    else
      echo -e "Not installing:$1 - already installed"
    fi
  fi
}

function apt_purge(){
  if [ -z "$1" ]
  then
    echo -e "Call to purge() - parameter is zero length or empty."
  else
    package_status=$(dpkg-query -W --showformat='${Status}\n' $1|grep "install ok installed")
    
    if [ "" == "$package_status" ]
    then
      echo -e "Not purging:$1 It is not installed."
    else
      echo -e "Purging:$1"
      apt-get purge -y $1
    fi
  fi
}