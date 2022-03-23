#!/bin/bash
echo "?"
echo "1.查看v2ray状态 2.重启v2ray 3.修改配置文件 4.添加github代理"
read choose
if [ $choose == 1 ]; then
    service v2ray status
    lsof -i:10809
elif [ $choose == 2 ]; then
    service v2ray restart
elif [ $choose == 3 ]; then
    vim /usr/local/etc/v2ray/config.json
elif [ $choose == 4 ]; then
    git config --global http.proxy http://127.0.0.1:10809
    git config --global https.proxy http://127.0.0.1:10809
    # export https_proxy="127.0.0.1:10809"
    # export http_proxy="127.0.0.1:10809"
fi
   
        
