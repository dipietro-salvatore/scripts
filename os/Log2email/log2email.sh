#!/bin/bash
#This script find the biggest log file in the forlder DIR and send it by email. After that it erases the file
#Run as root user or set it in the crontab.
#Put this file in /usr/local/bin/log2email.sh and type    sudo chmod +x /usr/local/bin/log2email.sh
#  /2  *  *   *   *        /usr/local/bin/log2email.sh

#Email settings
EMAIL="@gmail.com"
FROM="raspberrypi@local"
SUBJECT="Raspberry Log File"

#Log Limit conditions
DIR="/var/log"
LIMIT=80
COMMAND=$(df | grep /var/log | awk  '{print $5;}' | sed -e "s/%//g")

#Variables
FILE=""
TMP="/tmp"
FILETMP=""

touch $DIR/log2emial.log
echo "$(date): check limit log file" >> $DIR/log2emial.log

if [ $COMMAND -gt $LIMIT ] 
then
	#Find the biggest file in the directory
	FILE="$( ls -S $DIR | head -1 )"
	echo "send log mail (file: $FILE)" >> $DIR/log2emial.log
	#Set the email
	FILETMP="$TMP/$FILE.tmp"
	echo "To: $EMAIL" > $FILETMP
	echo "From: $FROM" >> $FILETMP
	echo "Subject: $SUBJECT ($FILE)" >> $FILETMP
	echo " " >> $FILETMP
	#set content of the file in the email
	cat $DIR/$FILE >> $FILETMP

	#reset the file
	rm $DIR/$FILE && touch $DIR/$FILE
	
	#Send the file
	cat $FILETMP | ssmtp $EMAIL 
	rm $FILETMP	
fi
