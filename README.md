# shell_study

学习脚本编程

## shell用途

实现自动化

1. 自动化批量初始化(update，软件安装)
2. 自动化软件部署（tomcat，nginx）
3. 管理应用程序（KVM，集群管理扩容，Mysql）
4. 日志分析处理程序（PV，UV，200，!200,grep/awk,top 100）
5. 自动化备份，恢复程序（Mysql完全备份/增量 + crond）
6. 自动化管理程序（批量修改，升级，配置更新）
7. 自动化信息采集，监控（收集系统/应用状态信息，CPU，内存，disk，apache，Mysql，tcp状态）Zabbix专业软件可实现采集
8. 自动化扩容（增加云主机-->部署应用）通过监控

## shell语法

### shell变量

#### 定义变量

定义变量时，变量名和等号之间不能有空格

```shell
filename="jayce.txt"
```

**定义规则**：

1. 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头
2. 中间不能有空格，可以使用下划线 `_`
3. 不能使用标点符号
4. 不能使用bash里的关键字

#### 使用变量

在变量名前加`$`

```sh
name="Jayce"
echo $name
echo ${name}
```

注意：花括号可选，但最好加

#### 只读变量

```sh
name="Jayce"
readonly name
```

添加了只读后，变量就不可以在变更值

#### 删除变量

`unset` unset可以删除变量

```sh
unset name
```

**注意：unset不能删除只读变量**

#### 变量类型

与其他编程语言类似，shell有三种变量类型

1. **局部变量** 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2. **环境变量** 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3. **shell变量** shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行



#### shell字符串

在定义字符串的时候，有三种方法

- 单引号
  - 单引号中任何字符都可以原样输出，不可嵌套变量
  - 单引号中不可单独出现单独的单引号，转义也不行，但成对可以
- 双引号
  - 双引号可以有变量
  - 双引号可出现转义字符
- 不用引号



##### 拼接字符串

- 双引号
```sh
  your_name="Jayce"
  greeting="hello, "$your_name" !"
  greeting_1="hello, ${your_name} !"
  echo $greeting  $greeting_1
  #输出 hello, Jayce ! hello, Jayce !
```

- 单引号

```sh
  greeting_2='hello, '$your_name' !'
  greeting_3='hello, ${your_name} !'
  echo $greeting_2  $greeting_3
  #输出 hello, Jayce ! hello, ${your_name} !
```

其中greeting_2中的变量其实并没有在单引号内

greeting_3中的变量未生效，被当做了字符串

[]()

##### 获取字符串长度

`${#val_name}`

在变量名前加上`#`

##### 提取子字符串

`${val_name:1:4}`

注意：索引值从0开始

##### 查找字符串

查找字符 **i** 或 **o** 的位置(哪个字母先出现就计算哪个)：

```sh
string="runoob is a great site"
echo `expr index "$string" io` 
# 输出 4
```

[expr命令](#expr)





































### <span id="expr">expr</span>

#### `&&` 与`;`顺序执行

pwd && whoiam

`&&`是逻辑判断，第一条成功才会执行第二条

`;`不判断顺序执行

