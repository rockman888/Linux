echo "Stop LINUX server"
if [ -z $1 ];then
echo "Using: scriptStopStart.sh {serverNumber} Example: ./scriptStopStart.sh 1 to stop start linux server 1"
exit
fi
ssh Administrator@gw-local0$1 "cd /home/Administrator/Server/; ./client.exe 'Stop_Quick_Only_Linux_GM.exe'"

echo "Start LINUX server"
ssh Administrator@gw-local0$1 "cd /home/Administrator/Server/; ./client.exe 'Start_Quick_Only_Linux_GM.exe'"
echo "DONE"
