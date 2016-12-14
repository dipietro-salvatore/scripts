#!/bin/bash
#This script will use the sSMTP program to send a mail to a fixed address.

EMAIL=email@gmail.com
FROM=raspberry-pi@home.com
SUBJECT="Raspberry turn up"
FILE="/tmp/email.txt"


echo "To: $EMAIL" > $FILE
echo "From: $FROM" >> $FILE
echo "Subject: Raspberry turn up" >> $FILE
echo "" >> $FILE
echo "Date: $(date)" >> $FILE
echo "Uptime: $(uptime)" >> $FILE
echo "Public IP Address: $( wget -qO- http://ipecho.net/plain )" >> $FILE
echo "Local IP Address:  $(ifconfig eth0 | grep "inet addr" | awk '{ print $2}'| cut -d ":" -f2 )" >> $FILE

cat $FILE | ssmtp $EMAIL 
