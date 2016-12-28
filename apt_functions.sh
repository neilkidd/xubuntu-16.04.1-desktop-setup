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
    printf "%s\n" "Call to install() - parameter is zero length or empty."
  else
    package_status=$(dpkg-query -W --showformat='${Status}\n' $1|grep "install ok installed")

    if [ "" == "$package_status" ]
    then
      printf "Installing:%s\n" $1
      apt-get -y --force-yes install $1
    else
      printf "NOT Installing:%s - already installed.\n" $1
    fi
  fi
}

function apt_purge(){
  if [ -z "$1" ]
  then
    printf "Call to purge() - parameter is zero length or empty.\n"
  else
    package_status=$(dpkg-query -W --showformat='${Status}\n' $1|grep "install ok installed")

    if [ "" == "$package_status" ]
    then
      printf "Not purging:%s It is not installed.\n" $1
    else
      printf "Purging:%s\n" $1
      apt-get purge -y $1
    fi
  fi
}
