#!/bin/csh
set NEVERUSETHIS = "never-use-this"
set HDBIN=bin
set HDBIN_BASE="~/Dropbox/linux/$HDBIN"

# 
if ($1 != $NEVERUSETHIS) then
	rm -rf ~/$HDBIN

	# 
	set target_dir = $1
	if ($target_dir == "") then
		echo "usage: $0 <target_dir_name>"
		exit
	endif

	mkdir ~/$HDBIN
	cd $HDBIN_BASE/$target_dir
	$HDBIN_BASE/init.csh $NEVERUSETHIS '.' '.'
	exit
endif 

# 
set cwb = $3
set cwp = $2

cd $cwp
# echo "changed directory to $cwp"
# echo "[pwd -P: `pwd -P`]"
# echo "[cwb: $cwb]"
# echo "[cwp: $cwp]"
pwd -P

if ($cwb == '.' && $cwp == '.') then
	set mid_path = '.'
else if ($cwb == '.') then
	set mid_path = "$cwp"
else if ($cwp == '.') then
	set mid_path = "$cwb"
else 
	set mid_path = "$cwb/$cwp"
endif
# echo "[mid_path: $mid_path]"

foreach filename (*)
	if (-d $filename) then
		# echo "mkdir ~/$HDBIN/$mid_path/$filename"
		mkdir ~/$HDBIN/$mid_path/$filename
		# echo "$HDBIN_BASE/init.csh $NEVERUSETHIS $mid_path/$filename"
		$HDBIN_BASE/init.csh $NEVERUSETHIS $filename $mid_path
		# echo "TEST"
		echo ""
		
	else if ($filename =~ *.lnk) then
		set lnk_target = `cat $filename`
		set lnk_name = `echo $filename | cut -d'.' -f1`
		set lnk_ext = `echo $filename | cut -d'.' -f2`
	
		echo "ln -s $lnk_target $lnk_name"
		ln -s $lnk_target ~/$HDBIN/$mid_path/$lnk_name
		# echo "$lnk_name.$lnk_ext -> $lnk_target"
		
	endif
end

# end of program.
