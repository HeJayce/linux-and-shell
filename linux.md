# Linux

## 注意

**不要再服务器访问高峰运行高负载命令**

**远程配置防火墙时不要把自己踢出防火墙**

**合理分配权限**

**定时备份数据和日志**



## 文件

### 链接

软连接：类似于快捷方式  

硬链接：类似于拷贝，相比于cp -p  两个文件可以同时更新

删除源文件后，软连接不可访问，硬链接可以继续访问

硬链接不可以操作目录

如何判断是否是硬链接：

​	查看i节点，一个i节点会映射到多个文件 



### 目录作用

| 目录名      | 作用                                     |
| ----------- | ---------------------------------------- |
| /bin        | 存放系统命令                             |
| /sbin       | 保存和系统环境设置相关的命令             |
| /usr/bin    | 存放系统命令，区别是单用户模式下不能执行 |
| /usr/sbin   | 存放根文件系统不必要的系统管理命令       |
| /boot       | 系统启动目录                             |
| /dev        | 设备文件                                 |
| /etc        | 配置文件                                 |
| /home       | 家目录                                   |
| /lib        | 系统调用函数库保存位置                   |
| /lost+found | 根分区备份恢复目录                       |
| /media      | 挂载目录，系统建议只挂载媒体设备         |
| /mnt        | 挂载目录，硬盘，U盘                      |
| /misc       | 挂载目录，建议挂载NFS服务                |
| /opt        | 第三方安装软件保存位置                   |
| /prco       | 虚拟文件系统，数据不会存在硬盘中         |
| /sys        | 和prco相似，主要保存内核信息             |
| /root       |                                          |
| /srv        | 服务数据目录                             |
| /tmp        | 临时目录，存放临时文件                   |
| /usr        | 系统软件资源目录                         |
| /var        | 动态数据保存位置                         |

挂载目录类似于Windows的盘符





## 终端

1. 物理终端

   直接接入本机

2. 虚拟终端

   在物理终端商软件虚拟实现的终端，centos6 有默认6个虚拟终端

   Ctrl + Alt + Fn （n = 1-6）

   设备文件路径：/dev/tty#

3. 模拟终端

   图形界面打开的命令行、ssh、telnet

   设备文件路径：/dev/pts/# 无穷个

查看终端设备`tty`

## 命令提示符

```
prompt
```

[root@localhost ~]#

 [root@localhost ~] : PS1

 prompt:

 管理员：#

 普通用户：$



## 系统分区

### 主分区

最多只能有4个

### 扩展分区

当主分区不够时，拿出一个分区做扩展分区

扩展分区最多只能有1个

主分区加扩展分区最多有4个

不能写入数据，不能格式化，只能包含逻辑分区

### 逻辑分区

可以写入数据，

### 格式化

高级格式化，又称逻辑格式化，它指根据用户选定的文件系统（FAT32，NTFS，EXT2，3，4）

linux默认EXT4格式会把分区变成一个一个等大小的数据块，每个数据块为4kb

文件有一个inode号，文件读取通过这个编号去硬盘分区数据块后找



## 挂载



## 权限

文件权限：r读，w写，x执行

rw- r-- r--

u    g   o  

u所有者 g所属组 o 其他人

权限够用就行，除了可执行文件（脚本等），不需要执行权限

| 字符 | 权限 | 对文件含义         | 对目录含义           | 文件操作          | 目录操作          |
| ---- | ---- | ------------------ | -------------------- | ----------------- | ----------------- |
| r    | 读   | 查看文件内容       | 列出目录内容         | cat、tail、less.. | ls                |
| w    | 写   | 修改文件           | 目录中创建、删除文件 | vim               | touch 、mkdir、rm |
| x    | 执行 | 进入目录，执行文件 | 进入目录             | bash等            | cd                |

对文件的删除权限其实要看所属目录的权限是否有写权限



## 命令

输入命令，回车:

 shell程序找到键入命令所对应的可执行程序或代码，并由其分析后提交给内核分配资源将其运行起来。表现为一个或多个进程。

在shell中可执行的命令有两类:

 内建命令:由shell自带的，而且通过某命令形式提供;

 外部命令:在当前系统的某文件系统路径下有对应的可执行程序文件:

 which, whereis

区别内部或外部命令:

 `type COMMAND`

shell 程序可搜寻的执行文件的路径定义在PATH环境变量中：

```sh
ehco $PATH	
```

[![image-20211204233557973](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201062321146.png)](https://camo.githubusercontent.com/72c3852f5994102902bc5cb38228ed4e502a885f25393052592d5dccf242b8de/68747470733a2f2f6a6179636568652e6f73732d636e2d68616e677a686f752e616c6979756e63732e636f6d2f696d6167652d32303231313230343233333535373937332e706e67)

自左至右依次查询，查到停止

shell搜寻代外部命令的路径结果会缓存至kv（key-value）存储中：

可用命令`hash`命令查看

[![image-20211204234259452](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201062322340.png)](https://camo.githubusercontent.com/d8a9732dce4431d1d85d8d7a018a54a899b541cbc78c7d0041ca23e07609f8ba/68747470733a2f2f6a6179636568652e6f73732d636e2d68616e677a686f752e616c6979756e63732e636f6d2f696d6167652d32303231313230343233343235393435322e706e67)

**缓存副作用：**

如果命令位置发生了转移，系统还是会按缓存路径运行，导致命令失效

```
mv /bin/ls /usr/bin/ls
ls
# -bash: /bin/ls: NO such file or directory
```

清除缓存：

```sh
hash -d [command] #删除一个命令缓存
hash -r  #删除所有缓存
```

## 连接

### linux&macos

```sh
ssh username@ip 
```

-p：指定端口

使用私钥登陆：

```sh
ssh -i ~/.ssh/jayce username@ip
```

文件

## 关机与重启

### `shutdown`

立即关机：

```sh
shutdown -h now
```

延迟一分钟关机

```sh
shutdown -h 1
```

### `halt`

直接关机

### `reboot`

重启系统

### `sync`

将内存的数据同步到磁盘

作用：关机和重启之前执行。放止数据丢失

## 登陆和注销

登陆少用root账号登陆，可避免操作失误。

可使用普通用户登陆，再用`su -用户名`切换系统管理员身份

### `logout`

注销

logout在图形运行级别无效，在运行级别3下有效

## 运行级别

linux有7个运行级别

0：关机

1：单用户（可找回密码，不需要密码）

2：多用户无网络

3：多用户有网络

4：保留

5：图形界面

6：重启

常用的是3和5

运行级别配置文件：/etc/inittab (centos7以前)

在配置文件中修改运行级别

### 切换指定运行级别

基本语法

init [012356]

## 用户管理

### 用户组

系统可以对有共性的多个用户进行统一的管理

每个用户至少属于一个组

比如root属于root组

### 增加删除组

```sh
groupadd
groupdel
```

### 家目录

home目录下有各个用户的家目录

当用户登陆时，会自动进入自己的家目录

```sh
/home/jayce
```

### 添加用户

```sh
useradd
useradd -d /home/jayce -m jayce
```

-d ： 指定用户目录

-m ： 如果目录为空，则新建

-g：指定用户组

```shell
passwd
```

设置密码

```sh
passwd jayce
```

在创建好用户后要设置密码

### 删除用户

```sh
userdel
```

默认加用户名是不会删除其所有文件的

-f ：强制删除，即时已经登陆

-r：连同相关用户文件一起删除

**另一种方法：**

进入`/etc/passwd`中，删除用户记录

⚠️不安全

### 修改用户的组

```sh
usermod
usermod -g usergroup username
```

### 查看用户

```sh
id username
```

### 切换用户

```sh
su - username
```

从高权限到低权限不需要密码

返回root用`exit`

#### 查看当前用户

`who am i` = `whoami`


### 用户信息存放

- 用户配置文件：/etc/passwd
  - 
  - 用户名:密码(加密在shadow):用户id:组id::家目录:对应的shell
- 组配置文件：/etc/group
  - 组名:口令:组id:列表(看不到)
- 口令配置文件：/etc/shadow
  - 加密文件存放密码

## 常用指令

### `man`

 查看指令手册

```sh
/usr/share/man
```

man1---man9

有多个man的目的是为了区分权限

 `man1` 用户命令

 `man2` 系统调用

 `man3` c库调用

 `man4` 设备及特殊文件

 `man5` 配置文件格式

 `man6` 游戏

 `man7` 杂项

 `man8` 管理类命令

有些关键字在不止一个章节中

指导章节：man # [COMMAND]

```sh
man`命令配置文件`/etc/man.config
```

 `MANPATH /.../.../...`

#### 操作方法

Space，向文件尾翻屏:

b，向文件首部翻屏:

d，向文件尾部翻半屏:

u，向文件首部翻半屏:

RETURN，向文件尾部翻一行

y ，向文件首部翻一行

q ，退出

### `p`

### `wd`

 查看当前位置的绝对路径

### `ls`

` -a` 显示所有文件包括隐藏

` -l `以列表的形式

​	![image-20220106224229321](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201062242168.png)

​	d：目录   -：文件   l：软连接

`-h` humman人性化，字节大小带上单位

`-d` 显示目录本身

![image-20220106225118919](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201062251334.png)

`-i` 查询文件号



### `ln`

创建链接

软连接：类似于快捷方式  

硬链接：类似于拷贝，相比于cp -p  两个文件可以同时更新

删除源文件后，软连接不可访问，硬链接可以继续访问

`-s`   soft 软连接

```sh
ln `-s` [源文件] [目标文件]
```





### `mkdir`

 创建目录

 -p 创建多级目录

### `rmdir`

删除空目录

### `rm`

` -r `递归删除

`-f `强制删除

### `cp`

```sh
cp 	1.txt /home
```

 `-r` 递归复制

`-p` 保留文件属性，不会更改修改文件时间

 `\cp`强制覆盖复制，不需要单独确认

### `mv`

 移动或重命名

 移动：

```sh
mv /home/pig.txt /root
```

 重命名：

```sh
mv oldname newname
```



### `touch`

新建文件 如果文件名中间需要空格，则必须用双引号

```sh
touch "program files"
```

但尽量不要用空格作为文件名，很麻烦



### `cat`

 查看文件内容

 -n 显示行号

​	与cat相反的显示方法：`tac`

​	![image-20220109102201471](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201091022043.png)

 配合 | more 按页显示文本内容

### `more`

- space 向下翻页
- enter 向下翻行
- q 退出
- ctrl F 向下滚一屏
- ctrl B 返回上一屏
- = 输出当前行号
- :f 输出文件名和当前行号

### `less`

功能与more类似，但比more强大

less在显示文件内容时，根据显示需要进行加载内容，对大型文件有较高效率

- space 向下翻页
- enter 向下翻行
- q 退出
- pageup
- pagedown
- /字串 向下搜寻【字串】功能：n：向下查找：N：向上查找
- ?字串 向上搜寻【字串】功能：n：向上查找：N：向下查找

### `chmod`

语法：

```sh
chmod [{ugoa}{+-=}{rwx}][文件/目录]
chmod [mode=421][文件/目录]
chmod -R 递归修改
```

u(所有者) g(所属组) o(其他人) a(所有人)

+(增加) -(减少) =(赋予)

例如：

```sh
chmod u+x,o-r start.sh
chmod (-R) 765 start.sh
```

  

### `echo`

`>`和`>>`

`>`输出重定向

`>>`追加

`history`

记录历史操作

登陆shell时，会读取命令历史文件中记录下来的命令： ~/.bash_history

登陆进shell后，新执行的命令只会记录在缓存中

登出shell后，会被追加至记录里

- `-a `更新历史记录文件
- `-d` 删除历史记录命令 `history -d 100`
- `-c` 清空命令历史记录

快捷操作：

`!100` 运行第100行历史记录的命令

`!string` 调用历史中最近一个以string开头的命令

`!!` 重复运行上一条命令



### `find`

find命令是根据文件的属性进行查找

- 文件名(-name)
- 文件大小(-size)
- 所有者(-user)
- 所属组(-group)
- 是否为空(-empty)
- 时间，time为日期（天），min为分钟，**只有这两种**
  	atime：访问时间（access time），指的是文件最后被读取的时间,可	以使用touch命令更改为当前时间；
  	ctime：变更时间（change time），指的是文件本身最后被变更的时	间，变更动作可以使chmod、chgrp、mv等等；
  	mtime：修改时间（modify time），指的是文件内容最后被修改的时间，修改动作可以使echo重定向、vi等等；

#### 文件名查找

1. `find / -name httpd.conf`　　

   在根目录下查找文件httpd.conf，表示在整个硬盘查找

2. `find /etc -name httpd.conf　`　

   在/etc目录下文件httpd.conf

3. `find /etc -name '`\*srm\*`'　`　

   使用通配符*(0或者任意多个)。表示在/etc目录下查找文件名中含有字符串‘srm’的文件*

4. `find . -name 'srm*'`　

   表示当前目录下查找文件名开头是字符串‘srm’的文件

#### 文件特征查找 

1. `find / -amin -10 `　

   查找在系统中最后10分钟访问的文件(access time)

2. `find / -atime -2　`　

   查找在系统中最后48小时访问的文件

3. `find / -empty `

   查找在系统中为空的文件或者文件夹

4. `find / -group cat `　

   查找在系统中属于 group为cat的文件

5. `find / -mmin -5 `

   查找在系统中最后5分钟里修改过的文件(modify time)

6. `find / -mtime -1 `　

   查找在系统中最后24小时里修改过的文件

7. `find / -user jayce `　

   查找在系统中属于jayce这个用户的文件

8. `find / -size +10000c`　

   查找出大于10000000字节的文件

   (c:字节，w:双字，k:KB，M:MB，G:GB)

9. `find / -size -1000k` 　

   查找出小于1000KB的文件

#### 混合查找方式

​	参数有：`!`，`-and(-a)`，`-or(-o)`。

  1. `find /tmp -size +10000c -and -mtime +2` 　

     在/tmp目录下查找大于10000字节并在最后2分钟内修改的文件

  2. `find / -user fred -or -user jayce `　　

     在`/`目录下查找用户是fred或者jayce的文件文件

  3. `find /tmp ! -user jayce`　　

     在`/tmp`目录中查找所有不属于jayce用户的文件



### `grep`

主要参数

[options]主要参数：

​	`-c`：只输出匹配行的计数。(count)

```shell
grep -c ftp /etc/passwd
```

![image-20220111161732807](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111617840.png)

​	`-i`：不区分大小写 

```shell
grep -i FTP /etc/passwd
```

![image-20220111161753629](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111617063.png)

​	`-h`：查询多文件时不显示文件名。

![image-20220111162602191](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111626834.png)

​	`-l`：查询多文件时只输出包含匹配字符的文件名。

![image-20220111162624906](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111626791.png)

​	`-n`：显示匹配行及行号。

![image-20220111162658201](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111626789.png)

​	`-s`:   不显示不存在或无匹配文本的错误信息。

​	`-v`：显示不包含匹配文本的所有行。

#### grep输出相邻行

```shell
grep -A 1 bash oss.sh
grep -B 2 bash oss.sh
grep -C 3 bash oss.sh
```

![image-20220111163121166](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111631651.png)

![image-20220111163355721](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111633711.png)

![image-20220111163437416](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201111634820.png)



总结：`-A`选项，是 After 的缩写**查看后面**，`-B`选项，是 Before 的缩写查看前面，`-C`选项，它是`-A`和`-B`选项的合体**两边都看**

#### grep正则表达式









### `which`     

查看可执行文件的位置 ，只有设置了环境变量的程序才可以用

### `whereis`

 寻找特定文件，只能用于查找二进制文件、源代码文件和man手册页

### `locate`       

配合数据库查看文件位置 ,详情：locate -h查看帮助信息



### `cut`

显示每行内容

由此可以实现提取每一行的第n个字符

参数：

- -b  以字节为单位进行分割

- -c  以字符为单位进行分割

- -d  自定义分隔符

- -f  与-d一起使用，指定显示哪个区域

  实例：

  ```sh
  cut -d "%" -f 1
  ```

  以%为分隔符，截取百分号前面的数值 -f 取截取后的第一行

  ​	



### `awk`

```sh
awk '条件1{动作1} 条件2{动作2}..' filename 
```

```sh
df -h|grep "vda1"|awk '{printf $5 "\t\n"}'|cut -d "%" -f 1
```

#### 条件

##### BEGIN

在所有数据读取之前执行这条命令

awk默认先读取第一行数据，如果

```sh
ps -ef|grep sshd|awk 'BEGIN{printf "输出进程号\n"} {print $2}'
```

![image-20220122172009408](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202201221720695.png)

如果没有BEGIN，则输出为

![image-20220317105404238](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202203171054281.png)

由此可见，BEGIN后的第一行是默认直接读取一次，不影响后面。

##### END

与BEGIN类似，读取最后一行



指定分隔符截取：

FS：输入分隔符

OFS：输出分隔符

```
awk 'BEGIN{FS="|";OFS="|"}{print $1,$2,$3,$4}' informix.txt
```

![image-20220317111917170](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202203171119258.png)
