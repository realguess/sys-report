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

# Format print: name and version
function disp {
  printf "[36;1m%-12s:[0m [32m%s[0m\n" "$1" "$2"
}

# Linux Standard Base and distribution specific information
DISTRIBUTION=$(lsb_release --description)
disp "Distribution" "${DISTRIBUTION:13}"

# System information - kernel release
KERNEL=$(uname -r)
disp "Kernel" "${KERNEL}"

# TODO
# File system disk space
#df -aTh | grep '^Filesystem\|^/dev/'
#echo ''

# Git (for latest stable Git release: http://git-scm.com/)
command -v git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  GIT=$(git --version)
  disp "Git" "${GIT:12}"
fi

# Nginx (for latest version: http://nginx.org/en/download.html)
command -v nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
  NGINX=$(nginx -v 2>&1)
  disp "Nginx" "${NGINX:21}"
fi

# MongoDB shell
command -v mongo > /dev/null 2>&1
if [ $? -eq 0 ]; then
  MONGO=$(mongo --version)
  disp "MongoDB" "${MONGO:23}"
fi

# Node
command -v node > /dev/null 2>&1
if [ $? -eq 0 ]; then
  NODE=$(node -v)
  # FIXME
  # NODE_LATEST=$(curl -s http://nodejs.org | grep '<p class="version">' | sed 's/<[^>]*>//g' | sed 's/[[:space:]]*//g')
  # echo "Node: ${NODE} Latest: ${NODE_LATEST}"
  disp "Node" "${NODE:1}"
fi

# NPM
command -v npm > /dev/null 2>&1
if [ $? -eq 0 ]; then
  NPM=$(npm -v)
  disp "NPM" "${NPM}"
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
  disp "MySQL" "${MYSQL:25:6}" # FIXME: Obviously a quick substring extraction
fi

# PHP
command -v php > /dev/null 2>&1
if [ $? -eq 0 ]; then
  PHP=$(php --version 2>&1)
  disp "PHP" "${PHP:4:6}" # FIXME: Obviously a quick substring extraction
fi

# Drush
command -v drush > /dev/null 2>&1
if [ $? -eq 0 ]; then
  DRUSH=$(drush --version)
  disp "Drush" "${DRUSH:14}"
fi

# Postfix
# command -v postfix > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#   # FIXME: How to get current version?
#   POSTFIX=$()
#   echo "Postfix: ${POSTFIX}"
# fi

# CoffeeScript
command -v coffee > /dev/null 2>&1
if [ $? -eq 0 ]; then
  COFFEESCRIPT=$(coffee --version)
  disp "CoffeeScript" "${COFFEESCRIPT:21}"
fi
