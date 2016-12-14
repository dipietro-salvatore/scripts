forward
=======

Simple script to run Linux as a router

Installation:
in a termila as root:

for Fedora/Centos: 

      #  yum -y install git && cd /tmp && git clone https://github.com/dipietro-salvatore/forward.git && cp /tmp/forward/forward.sh /usr/bin/forward.sh && chmod +rx /usr/bin/forward.sh

for Ubuntu/Debian

      #  apt-get -y install git && cd /tmp && git clone https://github.com/dipietro-salvatore/forward.git && cp /tmp/forward/forward.sh /usr/bin/forward.sh && chmod +rx /usr/bin/forward.sh


How to use:

     $  sudo forward.sh 192.168.1.1/24 eth0

where:
 192.168.1.1   is the new network that we want to add on the Linux box
 /24           the subnet for the new network
 eth0          the network interface
 
 
 http://www.2dd.it/articoli/sicurezza-informatica/linux-simple-script-run-box-router/
