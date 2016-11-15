(X)Ubuntu 16.04.1 Post Install Scripts
======================================

These shell scripts are intended to be run after a fresh install of
an [XUbuntu 16.04.1 LTS](http://xubuntu.org/).

Don't try to re-run the scripts. Bad things may happen - see todo below.

## Usage:

Run from source folder:

    sudo ./install.sh

## TODO
* Check install_x2go.sh to auto add libs to  /etc/profile. These change based on installed desktop env - see comments in the script.
* Configure autoupdates. Security at minimum.
* Add ffmpeg?
* Add solorize
* Add script to copy virtual box vms, vagrant home, docker etc to mass storage
* Make it idempotent. This may be better achieved by porting to Ansible.
