#!/bin/bash

##
# Print system information, used for keeping system up to date.
#
# For Amazon AWS use only. Currently only test on Ubuntu Linux.
# 
# Chao Huang (chao@realguess.net)
# March 24, 2012
##

# Linux Standard Base and distribution specific information
DISTRIBUTION=$(lsb_release --description)
echo "Distribution: ${DISTRIBUTION:13}"

# System information - kernel release
KERNEL=$(uname -r)
echo "Kernel: ${KERNEL}"

# TODO
# File system disk space
#df -aTh | grep '^Filesystem\|^/dev/'
#echo ''

# Git (for latest stable Git release: http://git-scm.com/)
GIT=$(git --version)
echo "Git: ${GIT:12}"

# Nginx (for latest version: http://nginx.org/en/download.html)
NGINX=$(nginx -v) # FIXME
#echo "Nginx: ${NGINX:15}"

# MongoDB shell
MONGO=$(mongo --version)
echo "MongoDB: ${MONGO:23}"

# Node
NODE=$(node -v)
NODE_LATEST=$(curl -s http://nodejs.org | grep '<p class="version">' | sed 's/<[^>]*>//g' | sed 's/[[:space:]]*//g')
echo "Node.js: ${NODE} Latest: ${NODE_LATEST}"

# Node packages
#npm outdated -g
#echo ''

# Get latest version of jQuery
#curl -s http://code.jquery.com/jquery.min.js | awk 'NR == 1 { print $3 }'
#echo ''
