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



## shell 打印

### echo

**echo是用于终端打印的基本命令**

echo每次调用都会自动换行

输出的方式三种，无引号，双引号（需要转义），单引号（原样输出）

#### 缺点

使用双引号打印遇到特殊字符就需要转义，或者不要使用双引号，换成单引号可原样输出

如果不使用引号，则没法再文本中显示`;`，因为分号在bash中为命令界定

单引号的缺点是不能变量替换

### printf

**printf也是用于终端打印的基本命令：**

printf使用引用文本或由空格分隔的参数。

**％ns** 输出一个字符串，n是数字代指输出几个字符

**%ni**： 输出整数

**％d** 整型输出，

**％c** 输出一个字符，

**％f** 输出实数，以小数形式输出。

```shell
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876
```

**%-10s** 指一个宽度为 10 个字符（**-** 表示左对齐，没有则表示右对齐）

**%-4.2f** 指格式化为小数，其中 **.2** 指保留2位小数。



输出格式:

| 格式 | 功能         |
| ---- | ------------ |
| \a   | 输出警告声音 |
| \b   | 输入退格键   |
| \f   | 清楚屏幕     |
| \n   | 换行         |
| \r   | 回车         |
| \t   | 水平输出退格 |
| \v   | 垂直输出退格 |



## 文件描述符与重定向

### 文件描述符

文件描述符是与输入和输出流相关联的整数。常用的文件描述符是stdin、stdout和stderr

- 0 —— stdin（标准输入）
- 1 —— stdout（标准输出）
- 2 —— stderr（标准错误）



### 重定向

Linux Shell 重定向分为两种，一种输入重定向，一种是输出重定向；

- 输入方向就是数据从哪里流向程序。数据默认从键盘流向程序，如果改变了它的方向，数据就从其它地方流入，这就是输入重定向。

- 输出方向就是数据从程序流向哪里。数据默认从程序流向显示器，如果改变了它的方向，数据就流向其它地方，这就是输出重定向。

<table>
<caption>
表2：Bash 支持的输出重定向符号</caption>
<tbody>
<tr>
<tr>
<th>
类&nbsp;型</th>
<th>
符&nbsp;号</th>
<th>
作&nbsp;用</th>
</tr>
<tr>
<td rowspan="2">
标准输出重定向</td>
<td>
cmd&nbsp;&gt;file</td>
<td>
以覆盖的方式，把 cmd 的正确输出结果输出到 file&nbsp;文件中。</td>
</tr>
<tr>
<td>
cmd &gt;&gt;file</td>
<td>
以追加的方式，把 cmd 的正确输出结果输出到 file&nbsp;文件中。</td>
</tr>
<tr>
<td rowspan="2">
标准错误输出重定向</td>
<td>
cmd 2&gt;file</td>
<td>
以覆盖的方式，把 cmd 的错误信息输出到 file&nbsp;文件中。</td>
</tr>
<tr>
<td>
cmd 2&gt;&gt;file</td>
<td>
以追加的方式，把 cmd&nbsp;的错误信息输出到 file&nbsp;文件中。</td>
</tr>
<tr>
<td colspan="1" rowspan="6">
正确输出和错误信息同时保存</td>
<td>
cmd &gt;file&nbsp;2&gt;&amp;1</td>
<td>
以覆盖的方式，把正确输出和错误信息同时保存到同一个文件（file）中。</td>
</tr>
<tr>
<td>
cmd &gt;&gt;file&nbsp;2&gt;&amp;1</td>
<td>
以追加的方式，把正确输出和错误信息同时保存到同一个文件（file）中。</td>
</tr>
<tr>
<td>
cmd &gt;file1 2&gt;file2</td>
<td>
以覆盖的方式，把正确的输出结果输出到 file1 文件中，把错误信息输出到 file2 文件中。</td>
</tr>
<tr>
<td>
cmd &gt;&gt;file1&nbsp; 2&gt;&gt;file2</td>
<td>
以追加的方式，把正确的输出结果输出到 file1 文件中，把错误信息输出到 file2 文件中。</td>
</tr>
<tr>
<td>
cmd &gt;file 2&gt;file</td>
<td colspan="1" rowspan="2">
【<span><b>不推荐</b></span>】这两种写法会导致 file 被打开两次，引起资源竞争，所以 stdout 和 stderr 会互相覆盖</td>
</tr>
<tr>
<td>
cmd &gt;&gt;file 2&gt;&gt;file</td>
</tr>
</tbody>
</table>

例如：

```shell
#标准输出
echo ‘helllo world’ > hello.txt
echo ‘helllo world’ >> hello.txt
   #结果
#‘helllo world’
#‘helllo world’

```

```shell
#标准错误输出重定向
cd sh 2> error.log
cd shell 2>> error.log
   #结果
#-bash: cd: sh: No such file or directory
#-bash: cd: shell: No such file or directory

```

```shell
#正确输出和错误信息同时保存
#同一文件
cat 1.txt > out.log 2>&1
    #结果
#cat: 1.txt: No such file or directory
#hello

#不同文件
cat 1.txt > out.log 2>error.log
```

如果既想把`stdout`打印出终端，又想重定向至文件，就需要用到`tee`命令

#### `tee`命令

 tee命令用于读取标准输入的数据，并将其内容输出成文件

```shell
cat a* |tee  error.log 
```

![image-20220214021923090](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202202140219700.png)

注意：tee只能读取stdin ，不能读取到stderr

默认情况tee为覆盖文件，等同于`>` ，加入`-a` 参数为追加内容，类似于`>>`





## shell变量

### 定义变量

定义变量时，变量名和等号之间不能有空格

```shell
filename="jayce.txt"
```

### 定义命令

```sh
variable=`command`
variable=$(command)
```



### **定义规则**

1. 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头
2. 中间不能有空格，可以使用下划线 `_`
3. 不能使用标点符号
4. 不能使用bash里的关键字

### 使用变量

在变量名前加`$`

```sh
name="Jayce"
echo $name
echo ${name}
```

注意：花括号可选，但最好加

### 只读变量

```sh
name="Jayce"
readonly name
```

添加了只读后，变量就不可以在变更值

### 删除变量

`unset` unset可以删除变量

```sh
unset name
```

**注意：unset不能删除只读变量**

### 变量类型

与其他编程语言类似，shell有三种变量类型

1. **局部变量** 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2. **环境变量** 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3. **shell变量** shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行



### shell字符串

在定义字符串的时候，有三种方法

- 单引号
  - 单引号中任何字符都可以原样输出，不可嵌套变量
  - 单引号中不可单独出现单独的单引号，转义也不行，但成对可以
- 双引号
  - 双引号可以有变量
  - 双引号可出现转义字符
- 不用引号



#### 拼接字符串

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



#### 获取字符串长度

`${#val_name}`

在变量名前加上`#`



#### 提取子字符串

**从左边开始**

`${val_name:1:4}`



**从右边开始**

`${val_name:0-1:4}`

注意：索引值从0开始

**注意：不管从哪边开始计数，截取方向都是从左到右。**



#### 查找字符串

查找字符 **i** 或 **o** 的位置(哪个字母先出现就计算哪个)：

```sh
string="runoob is a great site"
echo `expr index "$string" io` 
# 输出 4
```

[expr命令](#expr)



#### 截取字符串

假设有变量 var=http://www.aaa.com/123.html

**1. # 号截取，删除左边字符，保留右边字符。**

```sh
#${string#*chars}
#string 表示要截取的字符，chars 是指定的字符
echo ${var#*//}
```

`*chars`连起来使用的意思是：忽略左边的所有字符，直到遇见 chars（chars 不会被截取）。

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

**#与##的区别是：#是从左边开始找第一个，##是找最后一个**



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



##### 1-4总结：

注意`*`的位置,*在哪边，哪边就不要



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

##### 汇总

| 格式                       | 说明                                                         |
| -------------------------- | ------------------------------------------------------------ |
| ${string: start :length}   | 从 string 字符串的左边第 start 个字符开始，向右截取 length 个字符。 |
| ${string: start}           | 从 string 字符串的左边第 start 个字符开始截取，直到最后。    |
| ${string: 0-start :length} | 从 string 字符串的右边第 start 个字符开始，向右截取 length 个字符。 |
| ${string: 0-start}         | 从 string 字符串的右边第 start 个字符开始截取，直到最后。    |
| ${string#*chars}           | 从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。 |
| ${string##*chars}          | 从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。 |
| ${string%*chars}           | 从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。 |
| ${string%%*chars}          | 从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。 |



### shell数组

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

#### 读取数组

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

#### 获取数组的长度

获取数组长度的方法与获取字符串长度的方法相同，例如：

如果只写`${#array_name}`，则默认为`${#array_name[0]}`

```sh
# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
length_n=${#array_name[n]}
```

```shell
a=(1 2 3 4);echo ${#a[3]} #1
a=(1 2 3 45);echo ${#a[3]} #2
```



## shell注释

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



## shell各类括号解读

### shell`()`

1. 命令组。括号中的命令将会新开一个子shell顺序执行，所以括号中的变量不能够被脚本余下的部分使用。括号中多个命令之间用分号隔开，最后一个命令可以没有分号，各命令和括号之间不必有空格。
2. 命令替换。等同于`cmd`，shell扫描一遍命令行，发现了$(cmd)结构，便将$(cmd)中的cmd执行一次，得到其标准输出，再将此输出放到原来命令。有些shell不支持，如tcsh。
3. 用于初始化数组。如：array=(a b c d)
   

### shell` (())`

双小括号 (( )) 的语法格式为：

((表达式))

1. 整数扩展。这种扩展计算是整数型的计算，不支持浮点型。((exp))结构扩展并计算一个算术表达式的值，如果表达式的结果为0，那么返回的退出状态码为1，或者 是"假"，而一个非零值的表达式所返回的退出状态码将为0，或者是"true"。若是逻辑判断，表达式exp为真则为1,假则为0。

   表达式可以只有一个，也可以有多个，多个表达式之间以逗号`,`分隔

   使用`$`获取 (( )) 命令的结果

   例如

   ```shell
   echo $((1+1))
   ```

2. 只要括号中的运算符、表达式符合C语言运算规则，都可用在$((exp))中，甚至是三目运算符。作不同进位(如二进制、八进制、十六进制)运算时，输出结果全都自动转化成了十进制。

   如：`echo $((16#5f)) `结果为95 (16进位转十进制)

3. 单纯用 (( )) 也可重定义变量值，比如 `a=5; ((a++)) `可将 $a 重定义为6

4. 双括号中的变量可以不使用$符号前缀。括号内支持多个表达式用逗号分开。

### <span id="[]">shell  `[]`</span >

1. bash 的内部命令，`[`和test是等同的。如果我们不用绝对路径指明，通常我们用的都是bash自带的命令。if/test结构中的左中括号是调用test的命令标识，右中括号是关闭条件判断的。这个命令把它的参数作为比较表达式或者作为文件测试，并且根据比较的结果来返回一个退出状态码。if/test结构中并不是必须右中括号，但是新版的Bash中要求必须这样。

   ```
   
   ```

   

2. Test和[]中可用的比较运算符只有==和!=，两者都是用于字符串比较的，不可用于整数比较，整数比较只能使用-eq，-gt这种形式。无论是字符串比较还是整数比较都不支持大于号小于号。如果实在想用，对于字符串比较可以使用转义形式，如果比较"ab"和"bc"：[ ab \< bc ]，结果为真，也就是返回状态为0。[ ]中的逻辑与和逻辑或使用-a 和-o 表示。

3. 字符范围。用作正则表达式的一部分，描述一个匹配的字符范围。作为test用途的中括号内不能使用正则。

4. 在一个array 结构的上下文中，中括号用来引用数组中每个元素的编号。
   

### shell `[[]]`



## 传递位置参数

脚本文件内部可以使用`$n`的形式来接收，例如，`$1`表示第一个参数，`$2` 表示第二个参数，依次类推。

如果参数个数太多，达到或者超过了 10 个，那么就得用`${n}`的形式来接收了，例如 ${10}、${23}。

```sh
#!/bin/bash
echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";
```

![image-20211014102022836](https://jaycehe.oss-cn-hangzhou.aliyuncs.com/markdown/202110141020304.png)

### 特殊变量

| 变量      | 含义                                                         |
| --------- | ------------------------------------------------------------ |
| $0        | 当前脚本的文件名。                                           |
| $n（n≥1） | 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1，第二个参数是 $2。 |
| $#        | 传递给脚本或函数的参数个数。                                 |
| $*        | 传递给脚本或函数的所有参数。                                 |
| $@        | 传递给脚本或函数的所有参数。当被双引号`" "`包含时，$@ 与 $* 稍有不同 |
| $?        | 上个命令的退出状态，或函数的返回值，（成功会返回 0，失败返回 1），（获取上一个的返回值，return） |
| $$        | 当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。 |



## if-else

### 基本语法

格式：

```sh
if  condition
then
    statement(s)
fi
```

最后必须以`fi`来闭合，fi 就是 if 倒过来拼写。也正是有了 fi 来结尾，所以即使有多条语句也不需要用`{ }`包围起来。

也可以将then和if写在一起

```sh
if condition;then 
	statement(s)
fi
```

实例：

```sh
if ((${a}==${b}))
then 
    echo "a=b"
else 
    echo "a!=b"
fi
```

可以延伸至if elif else语句



### test

#### 学前须知

test 命令比较奇葩，>、<、== 只能用来比较字符串，不能用来比较数字，比较数字需要使用 -eq、-gt 等选项；不管是比较字符串还是数字，test 都不支持 >= 和 <=。

#### test语法

test用来检测条件是否成立，可进行数值，字符串，文件三方面的比较。

语法为：

```sh
test expression
```

当 test 判断 expression 成立时，退出状态为 0，否则为非 0 值。

test的缩写为`[]`,`[]`更多的使用方法见[shell` []`](#[])

test实例：

```sh
#!/bin/bash
read age
if test $age -le 2; then
    echo "婴儿"
elif test $age -ge 3 && test $age -le 8; then
    echo "幼儿"
elif [ $age -ge 9 ] && [ $age -le 17 ]; then
    echo "少年"
elif [ $age -ge 18 ] && [ $age -le 25 ]; then
    echo "成年"
elif test $age -ge 26 && test $age -le 40; then
    echo "青年"
elif test $age -ge 41 && [ $age -le 60 ]; then
    echo "中年"
else
    echo "老年"
fi
```

#### test数值比较

| 选 项             | 作 用                          |
| ----------------- | ------------------------------ |
| num1 **-eq** num2 | 判断 num1 是否和 num2 相等。   |
| num1 **-ne** num2 | 判断 num1 是否和 num2 不相等。 |
| num1 **-gt** num2 | 判断 num1 是否大于 num2 。     |
| num1 **-lt** num2 | 判断 num1 是否小于 num2。      |
| num1 **-ge** num2 | 判断 num1 是否大于等于 num2。  |
| num1 **-le** num2 | 判断 num1 是否小于等于 num2。  |

助记：

- 相等 -eq (equal)
- 不相等 -ne （not equal)
- 大于 -gt (greater than)
- 小于 -lt (less than)
- 大于或等于 -ge (greater than or equal)
- 小于或等于 -le (less than or equal)

大g，小l，e等

#### test字符串判断

| 选 项                            | 作 用                                                 |
| -------------------------------- | ----------------------------------------------------- |
| **-z** str                       | 判断字符串 str 是否为空。                             |
| **-n** str                       | 判断宇符串 str 是否为非空。                           |
| str1 **=** str2 str1 **==** str2 | `=`和`==`是等价的，都用来判断 str1 是否和 str2 相等。 |
| str1 **!=** str2                 | 判断 str1 是否和 str2 不相等。                        |
| str1 **`\>`** str2               | 判断 str1 是否大于 str2。                             |
| str1 **`\<`** str2               | 判断 str1 是否小于 str2。                             |

**注意：`\>`是`>`的转义字符，这样写是为了防止`>`被误认为成重定向运算符。同样，`\<`也是转义字符。**

实例：

```sh
#!/bin/bash
read str1
read str2
#检测字符串是否为空
if [ -z "$str1" ] || [ -z "$str2" ]
then
    echo "字符串不能为空"
    exit 0
fi
#比较字符串
if [ $str1 = $str2 ]
then
    echo "两个字符串相等"
else
    echo "两个字符串不相等"
fi
```







#### test逻辑判断

| 选 项                          | 作 用                                                        |
| ------------------------------ | ------------------------------------------------------------ |
| expression1 **-a** expression  | 逻辑与，表达式 expression1 和 expression2 都成立，最终的结果才是成立的。 |
| expression1 **-o** expression2 | 逻辑或，表达式 expression1 和 expression2 有一个成立，最终的结果就成立。 |
| **!**expression                | 逻辑非，对 expression 进行取反。                             |



## 命令替换

将命令输出结果赋值给变量

```sh
begin_time=$(date +%s)    #开始时间，也可使用``替换
```

$() 仅在 Bash Shell 中有效，而反引号可在多种 Shell 中使用



如果被替换的命令的输出内容包括多行（也即有换行符），或者含有多个连续的空白符，那么在输出变量时应该将变量**用双引号包围**

```sh
#!/bin/bash
LSL=`ls -l`
echo $LSL  #不使用双引号包围
echo "--------------------------"  #输出分隔符
echo "$LSL"  #使用引号包围
```

第一句不换行，第三句正常换行



## <span id="expr">expr</span>

四则运算

```sh
expr 1 + 1
expr 1 - 1
expr 1 / 1
expr 1 \* 1
```



| 运算   | 表达式                   | 意义                                               |
| ------ | ------------------------ | -------------------------------------------------- |
| match  | match STRING REGEXP      | STRING 中匹配 REGEXP 字符串并返回匹配 字符串的长度 |
| substr | substr STRING POS LENGTH | 从 POS 位置获取长度为 LENGTH 的字符串              |
| index  | index STRING SUBSTR      | 杳找子字符串的起始位置                             |
| length | length STRING            | 计算字符串的长度                                   |

​	匹配字符串的长度，若找不到则返回 0：

```sh
expr match "123 456 789" ".*5"
6
```


从指定位置处抓取子字符串：

```sh
expr substr " this is a test" 3 5
his i
```


查找子字符串位置：

```sh
expr index "test for the game" "e"
2
```


计算子字符串长度：

```sh
expr length "this is a test"
14
```



### expr定义变量

在使用expr进行定义变量时，必须使用反引号或圆括号

例如：

```sh
#val=`expr 2 + 2`
val=$(expr 2 + 2)
echo "2+2=${val}"
```



### `&&` 与`;`顺序执行

pwd && whoiam

`&&`是逻辑判断，第一条成功才会执行第二条

`;`不判断顺序执行

