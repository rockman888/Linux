
echo " "
echo "------ Support uppatch for all linux ------"
echo "  + AUTHOR		: ViLH (zidane)   "
echo "  + LAST MODIFIED	: 2014-10-30 "
echo "------ ----------------------------- ------"

if [ $# -ne 1 ] 
then
	echo "{Usage:} sh uppatch.sh {dir-patch}"
	echo " "
	exit 1
fi

fulldir="$1server/script"
flag=0

if [ -d $fulldir ] 		# tån t¹i server/script/
then		

	for i in 1 2 3 4 5
	do
		cp -rf $fulldir server$i
		echo "UP PATCH 'script' TO server$i -> Succeed"
	done
	
	echo " ********************************** "
	#cp -rf $fulldir server1	
	#echo "uppatch to server1 -> done"
	flag=1
fi	

# ----------------------------------------------------
fulldir="$1server/settings"	#$1: tham sè 1 + th­ môc server/settings
	
if [ -d $fulldir ]		# tån t¹i server/settings
then
	
	for i in 1 2 3 4 5
	do
		cp -rf $fulldir server$i
		echo "UP PATCH 'settings' TO server$i -> Succeed"
	done
	
	echo " ********************************** "
	flag=2
fi

if [ $flag -eq 0 ]
then
	echo "DirPath not found -> Please Check ..."		
else
	echo "All Linux had updated patch Completed~"	
fi
echo " "
