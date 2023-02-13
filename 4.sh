#!/bin/bash
echo "1:show python process"
echo "2:stop process"
echo "3:start process"
echo "4:restart process"
echo "5:quit"
echo -n "please input to select options:"
while read input
do

	case "$input" in
		1) echo -n "please input filename:"
		read filename
		ps -ef | grep $filename | grep -v 'grep'
		echo -n "please input to select options:"
		;;
		2) echo -n "please input pid:"
		read pid
		kill -9 $pid
		echo -n "please input to select options:"
		;;
		3) echo -n "please input filename:"
		read filename
		nohup python3 $filename &
		echo -n "please input to select options:"
		;;
		4) echo -n "please input filename:"
		read filename
		kill -9 $(ps -ef |grep $filename |grep -v "grep" |awk '{print $2}')

		nohup python3 $filename &
		echo -n "please input to select options:"
		;;
		5) break
		;;
		*)echo -n "wrong input,please check and input again:"
		;;
	esac
done