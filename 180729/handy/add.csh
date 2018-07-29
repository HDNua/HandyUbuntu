#!/bin/csh
set target_name=$1
set target_type=$2
set target_path=$3

if ($#argv < 3) then
	echo "usage: ./add.csh <name> <type> <path>"
	echo "(ex) ./add.csh metacc yacc ~/work/yacc/metacc/latest/build/metacc"
	exit
endif

mkdir "${target_name}_lnk"
touch "${target_name}.lnk"
echo "${target_name}_lnk/${target_type}" > "${target_name}.lnk"
touch "${target_name}_lnk/${target_type}.lnk"
echo "${target_path}" > "${target_name}_lnk/${target_type}.lnk"

echo "done."
