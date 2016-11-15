#!/bin/bash

function install_oracle_java_8 {
  
  if [ ! -f /etc/apt/sources.list.d/webupd8team-java-trusty.list ]; then
    
    add-apt-repository -y ppa:webupd8team/java
		debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true'
		apt_quiet_update
		apt_install oracle-java8-installer
    update-java-alternatives -s java-8-oracle
  fi
  
}

