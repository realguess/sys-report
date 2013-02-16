#!/bin/bash

##
# Print system information, used for keeping system up to date.
#
# For Amazon AWS use only. Currently only test on Ubuntu Linux.
# 
# Chao Huang (chao@realguess.net)
# March 24, 2012
##

# Make sure cURL is installed
command -v curl > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "cURL is not installed"
  exit 1
fi

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
command -v git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  GIT=$(git --version)
  echo "Git: ${GIT:12}"
fi

# Nginx (for latest version: http://nginx.org/en/download.html)
command -v nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
  NGINX=$(nginx -v 2>&1)
  echo "Nginx: ${NGINX:21}"
fi

# MongoDB shell
command -v mongo > /dev/null 2>&1
if [ $? -eq 0 ]; then
  MONGO=$(mongo --version)
  echo "MongoDB: ${MONGO:23}"
fi

# Node
command -v node > /dev/null 2>&1
if [ $? -eq 0 ]; then
  NODE=$(node -v)
  # FIXME
  # NODE_LATEST=$(curl -s http://nodejs.org | grep '<p class="version">' | sed 's/<[^>]*>//g' | sed 's/[[:space:]]*//g')
  # echo "Node: ${NODE} Latest: ${NODE_LATEST}"
  echo "Node: ${NODE}"
fi

# NPM
command -v npm > /dev/null 2>&1
if [ $? -eq 0 ]; then
  NPM=$(npm -v)
  echo "NPM: ${NPM}"
fi

# Node packages
#npm outdated -g
#echo ''

# Get latest version of jQuery
#curl -s http://code.jquery.com/jquery.min.js | awk 'NR == 1 { print $3 }'
#echo ''

# MySQL
command -v mysql > /dev/null 2>&1
if [ $? -eq 0 ]; then
  MYSQL=$(mysql --version)
  echo "MySQL: ${MYSQL:25:6}" # FIXME: Obviously a quick substring extraction
fi

# PHP
command -v php > /dev/null 2>&1
if [ $? -eq 0 ]; then
  PHP=$(php --version 2>&1)
  echo "PHP: ${PHP:4:6}" # FIXME: Obviously a quick substring extraction
fi

# Drush
command -v drush > /dev/null 2>&1
if [ $? -eq 0 ]; then
  DRUSH=$(drush --version)
  echo "Drush: ${DRUSH:14}"
fi
