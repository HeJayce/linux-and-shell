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



##### 截取字符串

假设有变量 var=http://www.aaa.com/123.html

**1. # 号截取，删除左边字符，保留右边字符。**

```sh
echo ${var#*//}
```

其中 var 是变量名，# 号是运算符，*// 表示从左边开始删除第一个 // 号及左边的所有字符

即删除 http://

结果是 ：www.aaa.com/123.htm

**2. ## 号截取，删除左边字符，保留右边字符。**

```sh
echo ${var##*/}
```

\##*/ 表示从左边开始删除最后（最右边）一个 / 号及左边的所有字符

即删除 http://www.aaa.com/

结果是 123.htm

**3. %号截取，删除右边字符，保留左边字符**

```sh
echo ${var%/*}
```

%/* 表示从右边开始，删除第一个 / 号及右边的字符

结果是：http://www.aaa.com

**4. %% 号截取，删除右边字符，保留左边字符**

```sh
echo ${var%%/*}
```

%%/* 表示从右边开始，删除最后（最左边）一个 / 号及右边的字符

结果是：http:

**5. 从左边第几个字符开始，及字符的个数**

```sh
echo ${var:0:5}
```

其中的 0 表示左边第一个字符开始，5 表示字符的总个数。

结果是：http:

**6. 从左边第几个字符开始，一直到结束。**

```sh
echo ${var:7}
```

其中的 7 表示左边第8个字符开始，一直到结束。

结果是 ：www.aaa.com/123.htm

**7. 从右边第几个字符开始，及字符的个数**

```sh
echo ${var:0-7:3}
```

其中的 0-7 表示右边算起第七个字符开始，3 表示字符的个数。**往右截取**

结果是：123

**8. 从右边第几个字符开始，一直到结束。**

```sh
echo ${var:0-7}
```

表示从右边第七个字符开始，一直到结束。

结果是：123.htm



#### shell数组

bash支持一维数组（不支持多维数组），并且没有限定数组的大小。

在 Shell 中，用括号来表示数组，数组元素用"空格"符号分割开。定义数组的一般形式为：

```
数组名=(值1 值2 ... 值n)
```

例如：

```sh
array_name=(value0 value1 value2 value3)
```

还可以单独定义数组的各个分量：

```shell
array_name[0]=value0
array_name[1]=value1
array_name[n]=valuen
```

可以不使用连续的下标，而且下标的范围没有限制。

##### 读取数组

读取数组元素值的一般格式是：

```
${数组名[下标]}
```

例如：

```sh
valuen=${array_name[n]}
```

使用 **@** 或`*`符号可以获取数组中的所有元素，例如：

```sh
echo ${array_name[@]}
echo ${array_name[*]}
```

##### 获取数组的长度

获取数组长度的方法与获取字符串长度的方法相同，例如：

```sh
# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
length_n=${#array_name[n]}
```

### shell注释

单行`#`

多行

```sh
:<<EOF
注释内容...
注释内容...
注释内容...
EOF
```

其中EOF可用其他代替

### <span id="expr">expr</span>





#### `&&` 与`;`顺序执行

pwd && whoiam

`&&`是逻辑判断，第一条成功才会执行第二条

`;`不判断顺序执行

