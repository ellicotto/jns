#!/bin/bash
# script name:     inst_julia.sh
# last modified:   2018/09/15
# sudo:            yes

script_name=$(basename -- "$0")
SECONDS=0

if ! [ $(id -u) = 0 ]; then
   echo "usage: sudo ./$script_name"
   exit 1
fi

apt -y install julia

su pi <<EOF
julia -e 'Pkg.add("IJulia");'
julia -e 'using IJulia;'
EOF
echo $script_name,$SECONDS >> jns_log.csv
