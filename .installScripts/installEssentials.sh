#!/bin/sh
# got this mostly from https://askubuntu.com/questions/519/how-do-i-write-a-shell-script-to-install-a-list-of-applications
# well there doesn't seem to be any difference between the following two lines and not including them, unfortunately
# sudo true
# test $? -eq 0 || exit 1 "gotta sudo"

apt-get update
apt-get install -y $(cat essentialPackages.txt)
