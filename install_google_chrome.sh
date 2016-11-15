#!/bin/bash

function install_google_chrome {
  
  REPO_CHECK=$(dpkg-query -W --showformat='${Status}\n' google-chrome-stable | grep "install ok installed")
  
  if [ "" == "$REPO_CHECK" ]; then
    
    if [ ! -f /etc/apt/sources.list.d/google.list ]; then #consider nothing is configured
      wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	  # http://serverfault.com/questions/376392/apt-get-duplicate-sources-list-entry-for-google-chrome-ubuntu-11-10
      sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    fi
    
    apt-get -qq update
    apt_install google-chrome-stable
  fi
  
}

