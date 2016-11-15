#!/bin/bash


dir="$(dirname "$0")"

. $dir/apt_functions.sh
. $dir/base_apt_packages_nox.sh
. $dir/development_apt_packages_nox.sh
. $dir/development_apt_packages_withx.sh
. $dir/install_atom.sh
. $dir/install_google_chrome.sh
. $dir/install_xubuntu_restricted_extras.sh
. $dir/install_rbenv.sh
. $dir/install_nvm.sh
. $dir/install_oracle_java_8.sh
. $dir/install_slack_desktop.sh
. $dir/install_virtualbox_5_1.sh
. $dir/install_vagrant.sh
. $dir/install_x2go.sh
. $dir/install_docker_16_04.sh
. $dir/purge_apt_packages.sh
. $dir/final_cleanup.sh

apt_dist_upgrade;
install_base_apt_packages_nox;
install_development_apt_packages_nox;
install_development_apt_packages_withx;
install_rbenv;
install_nvm;
#install_oracle_java_8;
install_atom;
install_google_chrome;
install_xubuntu_restricted_extras; #gives lots of warnings
install_slack_desktop;
install_virtualbox_5_1;
install_vagrant;
install_x2go; #- done via x2go cmd line
install_docker_apt; 16.04.1
purge_apt_packages;
final_cleanup;
