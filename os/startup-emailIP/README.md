raspberry-ipadd-email
=====================

Raspberry script to receive and email with the public IP address

Installation:

1) install sSMTP on you raspberry box

  # apt-get update; apt-get install ssmtp
  
2) Configure the sSMTP program. the configuration file is located on /etc/ssmtp/ssmtp.conf


3) Download/Copy the ipaddr-email.sh  file on /usr/local/bin/ipaddr-email.sh 


4) Open and edit the script with your email and other stuff

5) run:

  # chmod +x /usr/local/bin/ipaddr-email.sh 
  

6) Open the /etc/rc.local file and add the following line before "exit 0"

  /bin/bash /usr/local/bin/ipaddr-email.sh
  
  
7) Reboot and see if it is working!


