
echo " "
echo -e "\e[1;32m--------- Support uppatch for all linux ---------- \e[0m"
echo -e "\e[1;32m  + AUTHOR		: ViLH (huuvi168@gmail.com) \e[0m"
echo -e "\e[1;32m  + LAST MODIFIED	: 2014-11-26 \e[0m"
echo -e "\e[1;32m--------- ----------------------------- ---------- \e[0m"

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
	echo -e "\e[0;31m DirPath not found -> Please Check ... \e[0m"
else
	now=$(date)
	echo -e "\e[1;33m All Linux had updated patch Completed~ \e[0m"	#1;33m yellow
	echo -e "\e[1;33m $now \e[0m"
fi
echo " "
