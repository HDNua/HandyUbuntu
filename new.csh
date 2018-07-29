#!/bin/csh
#########################################################################
# 
# Author: Doyoung Han (rbfwmqwntm@naver.com)
# Revision: v1.0.0.0
# Revision Date: 2018-07-29 12:11 - v1.0.0.0
# 
#########################################################################
set new_latest = $1
if ($new_latest == "") then
	echo "please specify new version name"
	exit
endif

#------------------------------------------------------------------------
# clone latest set.
set latest = `cat latest`
cp -r $latest $1
rm $latest/WORKING
rm latest
touch latest
echo $new_latest > latest
echo "copy done."
