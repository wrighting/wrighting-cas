#This doesn't work as there isn't a jessie repo
#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:webupd8team/java -y
#So use the trusty one instead
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
sudo apt-get update
sudo apt-get install oracle-java8-installer
#sudo apt-get install oracle-java8-jdk
VERSION=1.7.1
mkdir temp
cd temp
if [ -f ../pwm_v${VERSION}.zip ]
then
  unzip ../pwm_v${VERSION}.zip
fi
(cd servlet;ant)
if [ -f pwm.war ]
then
  mvn install:install-file -DgroupId=password.pwm -DartifactId=pwm -Dversion=${VERSION} -Dpackaging=war -Dfile=pwm.war
  mvn install:install-file -DgroupId=password.pwm -DartifactId=pwm-servlet -Dversion=${VERSION} -Dpackaging=jar -Dfile=servlet/build/pwm-servlet.jar
else
   echo "Must download the zip file first see https://code.google.com/p/pwm/"
fi
#Should be possible to replace this with a mvn install at a later date
VERSION=0_6_4
wget https://github.com/jrivard/ldapchai/archive/v${VERSION}.zip
unzip v${VERSION}.zip
cd ldapchai-${VERSION}
mvn install:install-file -DgroupId=com.novell -DartifactId=ldapchai -Dversion=${VERSION} -Dpackaging=jar -Dfile=build/ldapChai.jar
