
echo " "
echo -e "\e[1;32m--------- Support uppatch for all linux ---------- \e[0m"
echo -e "\e[1;32m  + AUTHOR		: ViLH (huuvi168@gmail.com) \e[0m"
echo -e "\e[1;32m  + LAST MODIFIED	: 2015-03-03 (Mung 13-Thu Ba) \e[0m"
echo -e "\e[1;32m--------- ----------------------------- ---------- \e[0m"

if [ $# -ne 2 ] 	#  -ne khac
then
	echo "{Usage:} sh uppatch.sh {dir-patch} {yes/no (yes:restart server - no:nothing todo)}"
	echo " "
	exit 1
fi

fulldir="$1server/script"	#$1: tham sè 1 + th­ môc server/script
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
	echo -e "\e[1;33m All Linux had updated patch Succeed~ \e[0m"	#1;33m yellow
	echo -e "\e[1;33m $now \e[0m"
	
	let localID=3	# local 3
	if [ $2 = "yes" ] 	# yes for restart server
	then
		echo " ********************************** "
		echo "Stoping linux 1,2,3,4,5 ... on local$localID "
		ssh Administrator@gw-local0$localID "cd /home/Administrator/Server/; ./client.exe 'Stop_Quick_Only_Linux_GM.exe'"
		echo "-> Already Stop all linux"

		sleep 10	# sleep 10 giay
		echo "Staring linux 1,2,3,4,5 ... on Local$localID "	
		ssh Administrator@gw-local0$localID "cd /home/Administrator/Server/; ./client.exe 'Start_Quick_Only_Linux_GM.exe'"
		echo "-> Start all linux done, please wait for 5 minutes and relogin to check!"
		
	else
		echo " ********************************** "
		echo -e "\e[1;33m Please login to gateway Local$localID for starting server! \e[0m"	#1;33m yellow
	fi

fi
echo " "


