#!/bin/bash
# script name:     inst_stack.sh
# last modified:   2018/09/15
# sudo: no

SECONDS=0
script_name=$(basename -- "$0")
script_dir=$(pwd)
log_file="$script_dir/installation_log.csv"
jns_user='pi'
home_dir="/home/$jns_user"
env="$home_dir/.venv/jns"
revision=$(cat /proc/cpuinfo | grep Revision)

if [ $(id -u) = 0 ]
then
   echo "usage: ./$script_name"
   exit 1
fi

if [ ! -d "$env" ]; then
  python3 -m venv $env
fi

# activate virtual environment
source $env/bin/activate

pip3 install pip==9.0.0
pip3 install setuptools
pip3 install -U pip

cat requirements.txt | xargs -n 1 pip install

printf "%s %s %s %s %s\n" $(date +"%Y-%m-%d %T") ${revision:10} $script_name $SECONDS >> $log_file
