#!/bin/bash
# script name:     inst_lab_ext.sh
# last modified:   2018/05/29
# sudo:            no

SECONDS=0
script_name=$(basename -- "$0")
script_dir=`dirname $0`
log_file="$script_dir/installation_log.csv"
jns_user='pi'
home_dir="/home/$jns_user"
env="$home_dir/.venv/jns"

if [ $(id -u) = 0 ]
then
   echo "usage: ./$script_name"
   exit 1
fi

. $home_dir/.bashrc
. $env/bin/activate
jupyter lab clean
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install bqplot --no-build
jupyter labextension install jupyterlab_bokeh --no-build
jupyter lab build
