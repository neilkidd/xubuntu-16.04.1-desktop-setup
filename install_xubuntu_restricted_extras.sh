#!/bin/bash

function install_xubuntu_restricted_extras {
  
 debconf-set-selections <<< 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true'
 apt_install xubuntu-restricted-extras

}

