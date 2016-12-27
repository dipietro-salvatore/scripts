

DOWNLOAD_LINK="http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz"
DOWNLOADED="jdk.tar.gz"



sudo mkdir -p /usr/lib/jvm
cd /usr/lib/jvm

#Download file
sudo wget -O $DOWNLOADED  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $DOWNLOAD_LINK
 
#Unzip file
sudo tar zxvf $DOWNLOADED -C /usr/lib/jvm

#Get version
VERSION="$(tar --exclude='*/*' -tf $DOWNLOADED )"

#Install into the system
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$VERSION/bin/java" 1
sudo update-alternatives --set java /usr/lib/jvm/$VERSION/bin/java

#Test
java -version

