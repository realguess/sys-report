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

# Git (for latest stable Git release: http://git-scm.com/)
git --version
echo ''

# Nginx (for latest version: http://nginx.org/en/download.html)
nginx -v
echo ''

# MongoDB
mongo --version
echo ''

# Node
current=$(node -v)
latest=$(curl -s http://nodejs.org | grep '<p class="version">' | sed 's/<[^>]*>//g' | sed 's/[[:space:]]*//g')
echo "Node.js: current: $current latest: $latest"
echo ''

# Node packages
npm outdated -g
echo ''

# Get latest version of jQuery
curl -s http://code.jquery.com/jquery.min.js | awk 'NR == 1 { print $3 }'
echo ''
