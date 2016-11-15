#!/bin/bash

function install_slack_desktop {
  
  REPO_CHECK=$(dpkg-query -W --showformat='${Status}\n' slack-desktop | grep "install ok installed")
  if [ "" == "$REPO_CHECK" ]; then
    curl -O https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-2.0.3-amd64.deb
    dpkg -i slack-desktop-*.deb
  fi
  apt_install slack-desktop
  # Cleanup and finish
  rm slack-desktop-*.deb
  
}

