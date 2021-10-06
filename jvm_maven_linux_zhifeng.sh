#!/bin/bash
# Author: Zhifeng JIANG from HKUST
# Reference: https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/

if ! command -v java &> /dev/null; then
  wget https://webank-ai-1251170195.cos.ap-guangzhou.myqcloud.com/jdk-8u192-linux-x64.tar.gz
  sudo mkdir -p $HOME/jvm/
  sudo tar xzf jdk-8u192-linux-x64.tar.gz -C $HOME/jvm/
  rm jdk-8u192-linux-x64.tar.gz
  JAVA_HOME=$HOME/jvm/jdk1.8.0_192/
  sudo update-alternatives --install /usr/bin/java java ${JAVA_HOME%*/}/bin/java 20000
  sudo update-alternatives --install /usr/bin/javac javac ${JAVA_HOME%*/}/bin/javac 20000
fi

if ! command -v mvn &> /dev/null; then
  wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz -P ./
  sudo tar xf ./apache-maven-*.tar.gz -C $HOME
  sudo ln -s $HOME/apache-maven-3.8.3 $HOME/maven
  rm ./apache-maven-*.tar.gz
  sudo mkdir -p /etc/profile.d
  sudo cp maven.sh /etc/profile.d/maven.sh
  sudo chmod +x /etc/profile.d/maven.sh
  source /etc/profile.d/maven.sh

fi
mvn --version

