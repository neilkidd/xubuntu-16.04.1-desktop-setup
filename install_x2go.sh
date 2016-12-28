#!/bin/bash

function install_x2go {

  #from https://www.howtoforge.com/tutorial/x2go-server-ubuntu-14-04
  REPO_CHECK=$(dpkg-query -W --showformat='${Status}\n' x2goserver | grep "install ok installed")
  if [ "" == "$REPO_CHECK" ]; then

    apt_install software-properties-common

    add-apt-repository -y ppa:x2go/stable
    apt_quiet_update
    apt_install x2goserver
    apt_install x2goserver-xsession

    # apt_install x2gomatebindings # if you use MATE/mubuntu
    # apt_install x2golxdebindings # if you use LXDE/lubuntu

    # See http://askubuntu.com/questions/763597/x2go-with-ubuntu-mate-xfce-16-04-fails-to-start
    # to add the correct libs to the profile

    #client
    apt_install x2goclient
  fi
}
