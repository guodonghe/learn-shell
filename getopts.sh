#!/bin/bash
# ʹ��getopts���ݽű�ѡ����� 
# 'getopts'ѡ����һ��ð�ţ���ʾ�����в�����2��ð����ѡ���п�ѡ����
# ʵ��һ
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

# ʵ����
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

# shift $(( $OPTIND-1 )) ���þ��ǰѾ��� `-' �ģ��� getopts �����������λ�ò����� unset �ˣ�
# ʹ�ó������� `ls -l -h /tmp' ����������� -l��-h ѡ��� unset �ˣ������� `/tmp' ��Ϊ ${1} ��ֵ��
# Bash ֧�ּ�����õİ汾ֱ���� `${!OPTIND}' ��ֵ���� `/tmp' ������ case ���֮��Ϳ��ԣ�

