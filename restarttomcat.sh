echo "关闭tomcat"
ps -ef | grep java | grep tomcat| awk {'print $2'} | sed -e "s/^/kill -9 /g" | sh -
sleep 5
echo "启动tomcat"
/nbzhcg/apache-tomcat-7.0.69-8081/bin/startup.sh
cd ~
/nbzhcg/apache-tomcat-7.0.69-5080/bin/startup.sh
cd ~
/nbzhcg/apache-tomcat-7.0.69-5081/bin/startup.sh
cd ~
/nbzhcg/apache-tomcat-7.0.69-6397/bin/startup.sh
 

