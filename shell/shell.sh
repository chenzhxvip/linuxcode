########################
#查询对应命令用xxx-xxx如sed-sed
########################


$0 这个程式的执行名字
$n 这个程式的第n个参数值，n=1..9
$* 这个程式的所有参数,此选项参数可超过9个。
$# 这个程式的参数个数
$$ 这个程式的PID(脚本运行的当前进程ID号)
$! 执行上一个背景指令的PID(后台运行的最后一个进程的进程ID号)
$? 执行上一个指令的返回值 (显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误)
$- 显示shell使用的当前选项，与set命令功能相同
$@ 跟$*类似，但是可以当作数组用


$ echo ${newvar:=b} ###变量newvar不为空(其值已被赋为a)，则${newvar:=b}被替换为newvar的值(即b)
${var:?string}替换规则为：若变量var不为空，则用变量var的值来替换${var:?string}；若变量var为空，则把string输出到标准错误中，并从脚本中退出。我们可利用此特性来检查是否设置了变量的值

#array_input_history[@] 代表所有参数  #array_input_history[@] 代表个数

stty -a #将所有选项设置的当前状态写到标准输出中
old_stty_settings=`stty -g`　#保存当前设置
stty "$old_stty_settings"　#恢复当前设置
stty -echo #禁止回显，当您在键盘上输入时，并不出现在屏幕上
stty echo #打开回显
stty raw #设置原始输入
stty -raw #关闭原始输入
stty igncr #开启忽略回车符
stty -igncr#关闭忽略回车符




${file#*/}：删掉第一个 / 及其左边的字符串：dir1/dir2/dir3/my.file.txt
${file##*/}：删掉最后一个 /  及其左边的字符串：my.file.txt
${file#*.}：删掉第一个 .  及其左边的字符串：file.txt
${file##*.}：删掉最后一个 .  及其左边的字符串：txt
${file%/*}：删掉最后一个  /  及其右边的字符串：/dir1/dir2/dir3
         ${file%%/*}：删掉第一个 /  及其右边的字符串：(空值)
         ${file%.*}：删掉最后一个  .  及其右边的字符串：/dir1/dir2/dir3/my.file
         ${file%%.*}：删掉第一个  .   及其右边的字符串：/dir1/dir2/dir3/my

# 是 去掉左边（键盘上#在 $ 的左边）
%是去掉右边（键盘上% 在$ 的右边）
单一符号是最小匹配；两个符号是最大匹配
${file:0:5}：提取最左边的 5 个字节：/dir1
${file:5:5}：提取第 5 个字节右边的连续5个字节：/dir2


**************************sed-sed******************************************************
用#代替单引号,才能使用变量$引用
s#include#chenzhx#g

a 追加内容 sed ‘/匹配词/a\要加入的内容’ example.file（将内容追加到匹配的目标行的下一行位置）
i 插入内容 sed ‘/匹配词/i\要加入的内容’ example.file 将内容插入到匹配的行目标的上一行位置）
sed  ‘1i Employee, EmpId’  empFile 

如果是要删除第三行：
sed -i '3d' 1.txt

如果删除以Love开头的行
sed -i '/^Love/d' 1.txt

删除包含Love的行
sed -i '/Love/d' 1.txt

删除前面两行
sed '1,2d' xxxx
-e链接多条命令
sed -i -e '/^curdate/d' -e '2i curdate=`/bin/date -d "1 day ago" "+%Y%m%d"`' /ysbin/syslogbackup.sh

^ 表示从开头匹配
[python] view plain copy print?
.* 表示匹配到行末尾
tmp.txt
asdxxx
haha
root@IPPBX:~# sed  's/.*sd.*/haha/g' tmp.txt
haha
haha


sed '/^abc/,$d' file  
解释：,$d的作用是删除匹配到的行到末行的行的所有数据。

**************************grep-grep******************************************************
grep -rn --include=*.[ch] YEASTAR_CBS_FUNC_GET_PJSIP_TRUNK_STATUS
grep -rn -A 51 --include=*.[ch] YEASTAR_CBS_FUNC_GET_PJSIP_TRUNK_STATUS
grep -r "xxxxx" /xxx/xxx

grep -v　反向查找
grep -E 或查找　grep -E "xx|sss"

**************************tar-tar******************************************************
tar 压缩时候制定压缩的相对路径 压缩..../pc/30.1.0.8 剔除前面的路径
tar -cf /home/chenzhx/newsrc/packtool/image/pc-30.1.0.8.tar -C /home/chenzhx/newsrc/packtool/image/release/pc 30.1.0.8


xz压缩文件方法或命令

xz -z 要压缩的文件
xz -d 要解压的文件

同样使用 -k 参数来保留被解压缩的文件。
创建或解压tar.xz文件的方法

习惯了 tar czvf 或 tar xzvf 的人可能碰到 tar.xz也会想用单一命令搞定解压或压缩。其实不行 tar里面没有征对xz格式的参数比如 z是针对 gzip，j是针对 bzip2。

创建tar.xz文件：只要先 tar cvf xxx.tar xxx/ 这样创建xxx.tar文件先，然后使用 xz -z xxx.tar 来将 xxx.tar压缩成为 xxx.tar.xz

解压tar.xz文件：先 xz -d xxx.tar.xz 将 xxx.tar.xz解压成 xxx.tar 然后，再用 tar xvf xxx.tar来解包。




**************************xargs-xargs******************************************************
xargs  -i　把输入当做一个个{} 　-t打印命令
xargs 应用
root@chenzhx:/home/chenzhx/newsrc/release/applibs/1.0.4/i686/tmp# file lib/* |grep ARM
lib/libblkid.so.1.1.0:       ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped
lib/libcom_err.so.2.1:       ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped
lib/libe2p.so.2.3:           ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped
lib/libext2fs.so.2:          ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped
lib/libext2fs.so.2.4:        ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped
lib/libusb-1.0.so.0.1.0:     ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, not stripped
lib/libuuid.so.1.3.0:        ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, stripped
lib/libysusb_app.so:         ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, not stripped
lib/libysusb.so:             ELF 32-bit LSB  shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, not stripped
root@chenzhx:/home/chenzhx/newsrc/release/applibs/1.0.4/i686/tmp# CUR_PATH^C
root@chenzhx:/home/chenzhx/newsrc/release/applibs/1.0.4/i686/tmp# file lib/* |grep ARM | awk -F ':' '{print $1}'
lib/libblkid.so.1.1.0
lib/libcom_err.so.2.1
lib/libe2p.so.2.3
lib/libext2fs.so.2
lib/libext2fs.so.2.4
lib/libusb-1.0.so.0.1.0
lib/libuuid.so.1.3.0
lib/libysusb_app.so
lib/libysusb.so
root@chenzhx:/home/chenzhx/newsrc/release/applibs/1.0.4/i686/tmp# file lib/* |grep ARM | awk -F ':' '{print $1}' | xargs rm


xargs  -i　把输入当做一个个{} 　-t打印命令
root@chenzhx:/tmp# cat shell 
abc1xxxx
abc2xxxx
abc3xxxx
root@chenzhx:/tmp# cat shell | grep abc.xxxx | xargs -t -i sed -i 's/{}/{}sss/g' shell 
sed -i s/abc1xxxx/abc1xxxxsss/g shell 
sed -i s/abc2xxxx/abc2xxxxsss/g shell 
sed -i s/abc3xxxx/abc3xxxxsss/g shell 
root@chenzhx:/tmp# cat shell 
abc1xxxxsss
abc2xxxxsss
abc3xxxxsss
root@chenzhx:/tmp# 


**************************tr-tr******************************************************
tr -d "\\n"　去掉回车
tr -d '\n'


**************************awk-awk******************************************************
awk  -F ':' '{if(NR>2) print $1}' |  awk '{gsub(/ /,"")}1'



**************************cat-cat******************************************************
cat > $file  <<EOF
syscore.networkservice.webport=$(( $start + 0 ))
EOF
