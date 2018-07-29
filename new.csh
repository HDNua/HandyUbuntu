#!/bin/csh
set new_latest = $1
if ($new_latest == "") then
	echo "please specify new version name"
	exit
endif

# 
set latest = `cat latest`
cp -r $latest $1
rm $latest/WORKING
rm latest
touch latest
echo $new_latest > latest
echo "copy done."
