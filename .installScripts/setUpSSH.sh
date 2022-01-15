#!/usr/bin/sh

#create ssh key (add to github)
ssh-keygen -t ed25519 -C "your_email@example.com"
#add to agent
eval "$(ssh-agent -s)"
ssh-add "../.ssh/id_ed25519"
