#!/bin/sh -x

TOMCAT=/usr/local/apache-tomcat-7.0.22
EXPORTVERSION10=/root/iparentkid

echo "Welcome to PARIS V10 install script."
service tomcat5 stop

echo "Backup SQL Data.."
rm -f /tmp/ipk.sql.bz2
mysqldump -h localhost -u root -p ipk | bzip2 -9 > /tmp/ipk.sql.bz2

service mysqld stop

echo "Updating software..."

rpm -e --nodeps  mysql-server
rpm -e --nodeps  mysql-devel
rpm -e --nodeps  mysql
rpm -e --nodeps  mysql-bench
rpm -e --nodeps  mysql-connector-odbc
rpm -e --nodeps  MySQL-client
rpm -e --nodeps  MySQL-server
rpm -e --nodeps  MySQL-shared
gpg --import $EXPORTVERSION10/rpm/mysql_pubkey.asc
rpm --import $EXPORTVERSION10/rpm/mysql_pubkey.asc
#rpm -Uvh $EXPORTVERSION10/rpm/MySQL-server-5.5.17-1.linux2.6.i386.rpm
#rpm -Uvh $EXPORTVERSION10/rpm/MySQL-client-5.5.17-1.linux2.6.i386.rpm
#rpm -Uvh $EXPORTVERSION10/rpm/MySQL-shared-5.5.17-1.linux2.6.i386.rpm
yum localinstall  $EXPORTVERSION10/rpm/MySQL-server-5.5.17-1.linux2.6.i386.rpm $EXPORTVERSION10/rpm/MySQL-client-5.5.17-1.linux2.6.i386.rpm $EXPORTVERSION10/rpm/MySQL-shared-5.5.17-1.linux2.6.i386.rpm

cp -f /usr/share/mysql/mysql.server /etc/init.d/mysqld
cp -f $EXPORTVERSION10/my.cnf /etc/my.cnf
(cd /etc/init.d;chkconfig --add mysqld;chkconfig mysqld on)


rpm -e --nodeps jdk


chmod +x $EXPORTVERSION10/rpm/jdk-6u29-linux-i586-rpm.bin
cd $EXPORTVERSION10
./rpm/jdk-6u29-linux-i586-rpm.bin

(HERE=`pwd`; cd /usr/local; tar xzpf $HERE/apache-tomcat-7.0.22.tar.gz)
cp -f $EXPORTVERSION10/tomcat /etc/init.d
chmod 755 /etc/init.d/tomcat 
(cd /etc/init.d;chkconfig --add tomcat;chkconfig --level 234 tomcat on)

echo "done."

service mysqld start

mysql -u root -p ipk  < $EXPORTVERSION10/ipk.sql

echo "...done."

echo "Application software..."
cp -a $EXPORTVERSION10/*.war $TOMCAT/webapps/
service tomcat stop
service httpd stop

service tomcat start
service httpd start

iptables -I RH-Firewall-1-INPUT -p tcp -m tcp --dport 80 -j ACCEPT

iptables -I RH-Firewall-1-INPUT -p tcp -m tcp --dport 443 -j ACCEPT

sleep 3
cd $EXPORTVERSION10
rm -f *.rpm
echo "All done. Installation of iParentKid was successful."
echo "Please point your web browser to http://192.168.1.1/"
sleep 10

