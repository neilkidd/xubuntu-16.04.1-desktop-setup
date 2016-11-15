#!/bin/bash

function remove_old_kernels {
  dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v linux-libc-dev | xargs sudo apt-get -y purge
}

function remove_orphaned_packages {
  apt-get -y autoremove
}

function remove_leftover_configs {
  dpkg --purge $(COLUMNS=200 dpkg -l | grep '^rc' | tr -s ' ' | cut -d ' ' -f 2)
}

function clean_package_cache {
  apt-get --assume-yes clean
  apt-get --assume-yes autoclean
}

function final_cleanup {
  remove_old_kernels
  remove_orphaned_packages
  remove_leftover_configs
  clean_package_cache
}


