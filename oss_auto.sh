#!/bin/bash
host="oss-cn-hangzhou.aliyuncs.com"
bucket="elawlog"

# bucket="bucket名"
# Id="AccessKey ID"
# Key="Access Key Secret"
# 参数1，PUT：上传，GET：下载
# 参数2，上传时为本地源文件路径，下载时为oss源文件路径
# 参数3，上传时为OSS目标文件路径，下载时为本地目标文件路径
# method=$1
# source=$2
# dest=$3
date=$(date +%Y)
source="/egova/apache-tomcat-7.0.105/logs/catalina.${date}".out
echo ${source}

echox $dest

# filename="/egova/apache-tomcat-7.0.105/logs/catalina.${filename}".out
# dest=

osshost=${bucket}.${host}
 
# 校验method
if test -z "${method}"
then
    method=GET
fi
 
if [ "${method}"x = "get"x ] || [ "${method}"x = "GET"x ]
then
    method=GET
elif [ "${method}"x = "put"x ] || [ "${method}"x = "PUT"x ]
then
    method=PUT
else
    method=GET
fi
 
#校验上传目标路径
if test -z "${dest}"
then
    dest=${source}
fi
 
echox "method:"${method}
echox "source:"${source}
echox "dest:"${dest}
 
#校验参数是否为空
if test -z "${method}" || test -z "${source}" || test -z "${dest}"
then
    echox $0 put localfile objectname
    echox $0 get objectname localfile
    exit -1
fi
echox "${method}"x
echox "PUT"x
if [ "${method}"x = "PUT"x ]
then
    resource="/${bucket}/${dest}"
    contentType=$(file -ib ${source} |awk -F ";" '{print $1}')
    dateValue="$(TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT')"
    stringToSign="${method}\n\n${contentType}\n${dateValue}\n${resource}"
    signature=$(echox -en $stringToSign | openssl sha1 -hmac ${Key} -binary | base64)
    echox $stringToSign
    echox $signature
    url=http://${osshost}/${dest}
    echox "upload ${source} to ${url}"
    curl -i -q -X PUT -T "${source}" \
      -H "Host: ${osshost}" \
      -H "Date: ${dateValue}" \
      -H "Content-Type: ${contentType}" \
      -H "Authorization: OSS ${Id}:${signature}" \
      ${url}
else
    resource="/${bucket}/${source}"
    contentType=""
    dateValue="$(TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT')"
    stringToSign="${method}\n\n${contentType}\n${dateValue}\n${resource}"
    signature=$(echox -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64)
    url=http://${osshost}/${source}
    echox "download ${url} to ${dest}"
    curl --create-dirs \
      -H "Host: ${osshost}" \
      -H "Date: ${dateValue}" \
      -H "Content-Type: ${contentType}" \
      -H "Authorization: OSS ${Id}:${signature}" \
      ${url} -o ${dest}
fi
