#!/usr/bin/env bash

USER_HOME=$(eval echo ~${SUDO_USER})

sudo apt-get purge openjdk-\* 

mkdir -p ${USER_HOME}/java

sudo cp -r ${USER_HOME}/Downloads/jdk-8u111-linux-x64.tar.gz ${USER_HOME}/java

cd ${USER_HOME}/java

sudo tar xvzf jdk-8u111-linux-x64.tar.gz

cd

echo "JAVA_HOME=${USER_HOME}/java/jdk1.8.0_111" >> sudo /etc/profile
echo "JRE_HOME=${USER_HOME}java/jre1.8.0_111" >> sudo /etc/profile
echo "PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin" >> sudo /etc/profile
echo "export JAVA_HOME" >> sudo /etc/profile
echo "export JRE_HOME" >> sudo /etc/profile
echo "export PATH" >> sudo /etc/profile

sudo update-alternatives --install "/usr/bin/java" "java" "${USER_HOME}/java/jdk1.8.0_111/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "${USER_HOME}/java/jdk1.8.0_111/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "${USER_HOME}/java/jdk1.8.0_111/bin/javaws" 1

sudo update-alternatives --set java ${USER_HOME}/java/jdk1.8.0_111/bin/java
sudo update-alternatives --set javac ${USER_HOME}/java/jdk1.8.0_111/bin/javac 
sudo update-alternatives --set javaws ${USER_HOME}/java/jdk1.8.0_111/bin/javaws

source /etc/profile

rm sudo

echo done
