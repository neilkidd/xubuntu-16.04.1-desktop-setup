#!/bin/bash

function install_virtualbox_5_1 {
  
  REPO_CHECK=$(dpkg-query -W --showformat='${Status}\n' virtualbox-5.1 | grep "install ok installed")
  if [ "" == "$REPO_CHECK" ]; then
    echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee -a /etc/apt/sources.list
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    
    apt_quiet_update
    apt_install dkms
    apt_install virtualbox-5.1
    
    #Extension pack - from https://www.freesoftwareservers.com/index.php/2015/10/23/install-virtualbox-extension-pack-script-to-match-installed-version-server/
    version=$(vboxmanage -v)
    var1=$(echo $version | cut -d 'r' -f 1)
    var2=$(echo $version | cut -d 'r' -f 2)
    file="Oracle_VM_VirtualBox_Extension_Pack-$var1-$var2.vbox-extpack"
    wget http://download.virtualbox.org/virtualbox/$var1/$file -O /tmp/$file
    VBoxManage extpack install /tmp/$file
    rm /tmp/$file
  fi
}

