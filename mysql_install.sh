#!/bin/bash
wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
yum -y install mysql57-community-release-el7-10.noarch.rpm
yum -y install mysql-community-server --nogpgcheck
systemctl start mysqld
systemctl status mysqld
password=$(grep "A temporary password is generated" /var/log/mysqld.log|awk '{print $11}')
echo ${password}
mysql -uroot -p${password}
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Abc123!@#';