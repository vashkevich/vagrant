#!/bin/bash

#	cp /vagrant/jdk-8u121-linux-i586.tar.gz /opt/
#	cd /opt
#	tar xzf jdk-8u121-linux-x64.tar.gz
#	cd /opt/jdk1.8.0_121/
#	sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 2
#	sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_121/bin/jar 2
#	sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_121/bin/javac 2
#	sudo alternatives --set jar /opt/jdk1.8.0_121/bin/jar
#	sudo alternatives --set javac /opt/jdk1.8.0_121/bin/javac
#	sudo export JAVA_HOME=/opt/jdk1.8.0_121
#	sudo export JRE_HOME=/opt/jdk1.8.0_121/jre
#	sudo export PATH=$PATH:/opt/jdk1.8.0_121/bin:/opt/jdk1.8.0_121/jre/bin
	
	echo "Set firewall rule"
	sudo iptables -I INPUT -p tcp --dport 8080 -m state --state NEW -j ACCEPT
	echo "Reload firewall"
	sudo /etc/init.d/iptables restart
	echo "Install Java"
	sudo yum -y install java >/dev/null
	echo "Make directory for tomcat"
	sudo mkdir /usr/local/tomcat/
	echo "Set vagrant as the owner /usr/local/tomcat/"
        sudo chown -R vagrant:vagrant /usr/local/tomcat/
	cd /usr/local/tomcat/
	echo "Download tomcat 8"
	wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz -d /usr/local/tomcat >/dev/null
	echo "Unpack tomcat's archive"
	sudo tar xf apache-tomcat-8.5.11.tar.gz -C /usr/local/tomcat
#	echo "Set vagrant as the owner /usr/local/tomcat/"
#	sudo chown -R vagrant:vagrant /usr/local/tomcat/
	sudo cp -rp /usr/local/tomcat/apache-tomcat-8.5.11/*  /usr/local/tomcat/
	sudo rm -rf /usr/local/tomcat/apache-tomcat-8.5.11/
	echo "Start Tomcat"
	sudo chmod +x /usr/local/tomcat/bin/./startup.sh
	sudo /usr/local/tomcat/bin/./startup.sh
	
