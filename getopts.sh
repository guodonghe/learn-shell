#!/bin/bash
# 使用getopts传递脚本选项参数 
# 'getopts'选项后跟一个冒号，表示必须有参数，2个冒号是选项有可选参数
# 实例一
usage() {
	cat << EOF
Usage:
$0 -I interface -i ipaddr
EOF
    exit 1
}
while getopts "I:i:" opt; do
	case $opt in 
	    I) 
              interface=$OPTARG
	      echo $OPTARG
	    ;;
	    i)
	      ip=$OPTARG
	      echo $OPTARG
	    ;;
	    ?) usage
	    ;;
	esac
done

if [[ -z "$interface" || -z "$ip" ]];then
	usage
else
	ifconfig $interface | grep -iE "${ip}\b"
fi

# 实例二
while getopts "h?dsb" opt;do
	case "$opt" in
	    h|\?)
		 echo "hello world"
            ;;
             d)
		 echo "beijing"
	     ;;
             s)
		 echo "shanghai"
	     ;;
	     b)
		 echo "zhengzhou"
	     esac
done

# shift $(( $OPTIND-1 )) 作用就是把具有 `-' 的，给 getopts 处理的命令行位置参数都 unset 了，
# 使用场景类似 `ls -l -h /tmp' 这样的命令，把 -l、-h 选项都给 unset 了，让最后的 `/tmp' 成为 ${1} 的值。
# Bash 支持间接引用的版本直接用 `${!OPTIND}' 的值就是 `/tmp' ，放在 case 语句之外就可以；

