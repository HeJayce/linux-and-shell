#!/bin/bash
#清理旧版mysql，或者rhel\centos自带的mariadb
# mysqlstat=$(rpm -qa | grep mysql)
# mariadbstat=$(rpm -qa | grep mariadb)
# if [ ${mysqlstat} ]; then
#     rpm -e ${mysqlstat} --nodeps
# fi
# if [ ${mariadbstat} ]; then
#     rpm -e ${mariadbstat} --nodeps
# fi
# rm -rf /etc/my.cnf
# rm -rf /etc/mysql
libnumastat=$(rpm -qa | grep libnuma)
libaiostat=$(rpm -qa *numactl*)
if [ ! ${libnumastat} ]; then
    yum -y install libnuma  
fi
if [ ! ${libaiostat} ]; then
    yum -y install numactl
fi
#未完

