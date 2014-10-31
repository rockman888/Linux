#!/bin/sh
echo "FILE WILL BE UNTAR IS : $1'.tar.gz'"
#check md5
md5sum /home/xmission/$1".tar.gz" > $1"_MD5_LOCAL"
cd /home/xmission
diff $1"_MD5_LOCAL" $1"_MD5_SERVER" > $1"_MD5_RESULT"
#if [ wc -l $1"_MD5_RESULT" -ne 0 ]
#then
#echo "CHECK MD5 in LOCAL FAILLL"
#exit
#fi
cd /home/xmission/tmp
rm -rf *
tar -xzf /home/xmission/$1".tar.gz" -C /home/xmission/tmp
echo -n "OK"
cd /home/xmission/tmp/server1
python /home/xmission/patch_local.py
cd ..
echo "COPY...."
for i in 2 3 4 5; do cp -r server1 server$i; done
echo "UNTAR CONFIGURE FILE"
tar -xzf /home/xmission/ServerCfg.tar.gz -C /home/xmission/tmp/
echo "CHANGE PERMISSION"
cd /home/xmission/tmp
chown -R xmission:xmission server*
chmod +x server*/linux*
echo "COMPLETE UNTAR"

