#!/bin/sh

launchctl setenv PATH /usr/local/bin:$PATH
log_dir=$HOME/logs/homebrew/update
log_name=${log_dir}/`date "+%Y%m%d"`.log

if [ ! -d ${log_dir} ]; then
  mkdir -p ${log_dir}
fi

brew doctor >> ${log_name} 2>&1
if [ $? -eq 1 ]; then
    brew file update >> ${log_name} 2>&1
    brew file cask_upgrade >> ${log_name} 2>&1
fi
