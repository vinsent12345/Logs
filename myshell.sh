#!/bin/sh
#chmod -x myshell.sh  获得执行权限




#批量重命名
BatchReName()
{
	DATEPATTERN="^[z][k][m][j][_]";
	dir="/Users/appma/Desktop/testapp/Resources/game";
	cd $dir;
	for file in *
 	do
 		if [[ $file =~ $DATEPATTERN ]]
 			then
 		#echo $file
 		#修改前面5个字母为ssmj_
 		mv -f $file `echo $file | sed 's/^...../ssmj_/'`;

 		#修改后面5个字母为snail
 		#mv -f $file `echo $i | sed 's/.....$/snail/'`;

 		#在前面添加 _hoho_
 		#mv -f $file `echo "_hoho_"$i`;

 		#所有的小写字母变大写字母
 		#mv -f $file `echo $i | tr a-z A-Z`;

 		#修改第一个字母为q
 		#mv -f $file `echo $i | sed 's/^./q/'`; 
 		else
 			echo $file is not target
 		fi 
 	done
}

#测试函数
TestFunction()
{
	echo "test function"
 # 	  echo "第一个参数为 $1 !"
 #    echo "第二个参数为 $2 !"
 #    echo "第十个参数为 $10 !"
 #    echo "第十个参数为 ${10} !"
 #    echo "第十一个参数为 ${11} !"
 #    echo "参数总数有 $# 个!"
 #    echo "作为一个字符串输出所有参数 $* !"


#注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
# $#	传递到脚本的参数个数
# $*	以一个单字符串显示所有向脚本传递的参数
# $$	脚本运行的当前进程ID号
# $!	后台运行的最后一个进程的ID号
# $@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
# $-	显示Shell使用的当前选项，与set命令功能相同。
# $?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错
}


str="hellow! Current Pid: $echo $$"
echo $str



#函数调用结果
# TestFunction
# if test $? -eq 0;then
# 	echo fun ok
# fi

#pwd显示当前目录  获得当前目录

#echo "12121212112121212"
#exit	#结束脚本 相当于return
#echo "3434344343433443"

#sudo chmod 777 文件夹名  					修改文件夹权限
#chmod -R 777 dir  							递归改权限
#sudo find / -name .bash_profile  			查找文件


#lsof -i:6013    查看当前运行在该端口都进程

#"通用”里有时没有"任何来源”这个选项：
#显示"任何来源"选项在控制台中执行：
#sudo spctl --master-disable
#不显示"任何来源"选项（macOS 10.12默认为不显示）在控制台中执行：
#sudo spctl --master-enable

#输出长度
#echo ${#str}
#截取第二个字符开始的4歌字符
#echo ${str:1:4}

#这个版本expr不支持 length,index,match等
#According to the POSIX standard, the use of string arguments length,substr, index, or match produces undefined results. In this version of
#expr, these arguments are treated just as their respective string values. 
#string="Alibaba is a great company"
#expr length "$string"  
#echo `expr index "$string" is`  
#expr length “this is a test”

#which java  显示java命令路径
#whereis java  显示java命令路径

#---------------环境变量---------------------------
#~/.bash_profile    个人环境变量
#全局设置
#下面的几个文件设置是全局的，修改时需要root权限

#1）/etc/paths （全局建议修改这个文件 ）
#编辑 paths，将环境变量添加到 paths文件中 ，一行一个路径
#Hint：输入环境变量时，不用一个一个地输入，只要拖动文件夹到 Terminal 里就可以了。

#2）/etc/profile （建议不修改这个文件 ）
#全局（公有）配置，不管是哪个用户，登录时都会读取该文件。

#3）/etc/bashrc （一般在这个文件中添加系统级环境变量）
#全局（公有）配置，bash shell执行时，不管是何种方式，都会读取此文件。

#---------------获取路径文件---------------------------
#for file in `ls /usr/local/mysql/`;do
#	echo $file
#done

#---------------只读变量-------------------------------
#readonly myUrl

#---------------删除变量  不能删除只读变量---------------
#unset variable_name

#---------------------启动数据库-----------------------
#cd "/usr/local/mysql/support-files/"
#sudo ./mysql.server status

#---------------------获得输入结果---------------------
#echo "What is your name?"
#read PERSON
#echo "Hello, $PERSON"
#echo "File Name: $0"
#echo "First Parameter : $1"
#echo "Second Parameter : $2"
#echo "Quoted Values: $@"
#echo "Quoted Values: $*"
#echo "Total Number of Parameters : $#"
#if [ $4 ] && [ $4 = "" ]
#then
#	echo "Forth Parameter is null"
#fi

#----------------------printf-------------------------
# printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
# printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
# printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
# printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876 
# %s %c %d %f都是格式替代符
# %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
# %-4.2f 指格式化为小数，其中.2指保留2位小数。

# \a	警告字符，通常为ASCII的BEL字符
# \b	后退
# \c	抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
# \f	换页（formfeed）
# \n	换行
# \r	回车（Carriage return）
# \t	水平制表符
# \v	垂直制表符
# \\	一个字面上的反斜杠字符
# \ddd	表示1到3位数八进制值的字符。仅在格式字符串中有效
# \0ddd	表示1到3位的八进制值字符

#----------------------open (mac os专有命令)-------------------------
# open ''    打开当前目录
# open http://www.badi.com   打开url
# open -a 打开应用
# open -t 用默认文本方式打开



#----------------------ideviceinstaller (mac 安装ipa)-------------------------
# brew install --ideviceinstaller

# 查看连接的设备udid
# $ idevice_id -l

# 获取设备上所有app的bundle id
# $ ideviceinstaller -l

# IPA安装到设备
# $ ideviceinstaller -i xx.ipa

# 卸载app
# $ ideviceinstaller -u appBundle_id

#---------------------------------xctool----------------------------------------
# 启动运行模拟器：

# xcrun instruments -w 'iPhone X'
# 1
# 在已经启动好的模拟器中安装应用：

# xcrun simctl install booted MailClinetApp.app 