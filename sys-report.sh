#!/bin/bash

##
# Print system information, used for keeping system up to date.
#
# For Amazon AWS use only.
# 
# Chao Huang (chao@realguess.net)
# March 24, 2012
##

# System information
uname -a
echo ''

# File system disk space
df -aTh | grep '^Filesystem\|^/dev/'
echo ''

# Nginx
nginx -v
echo ''

# MongoDB
mongo --version
echo ''

# Node packages
npm outdated -g
echo ''
