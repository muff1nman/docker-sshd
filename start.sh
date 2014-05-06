#!/usr/bin/env bash
#
# start.sh
# Copyright (C) 2014 Andrew DeMaria (muff1nman) <ademaria@mines.edu>
#
# All Rights Reserved.
#

SSH_PASS=`pwgen -c -n -1 8`
#useradd -m -g users docker
#chown docker /home/docker
echo root:$SSH_PASS | chpasswd
echo root:$SSH_PASS

/usr/sbin/sshd -D
