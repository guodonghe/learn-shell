#!/bin/bash
#
#ZABBIX :discovery servers port run
#
#
#


#没有使用supervisor 维护进程
/bin/ls /var/run/supervisor.sock >/dev/null 2>&1
if [ $? -ne 0 ];then
    exit
fi



#Server Process discovery status
#服务自动发现
_SERVER_PROCESS (){
    #服务名称
    server_process=$(/usr/bin/supervisorctl status | /bin/awk '{print $1}' 2>/dev/null)
    [ ${#server_process} -eq 0 ] && exit
    #
    echo -en "{\n\t\"data\":[\n"
    echo -en "$server_process\n" | while read SERVERPROCESS
    do
        echo -en "\t\t{\n\t\t\t\"{#SERVERPROCESS}\":\"${SERVERPROCESS}\"},"
    done | /bin/sed -e 's/},$/}/' -e 's/},/},\n/g' 
    echo -en "\n\t]\n}\n"
}

#服务状态
_SERVER_STATUS(){
    /usr/bin/supervisorctl status ${1} | /bin/awk '{print $2}' |/bin/grep -q "RUNNING" 2>/dev/null 
    echo $?
}
#启动市场
_SERVER_UPTIME(){
    pid=`/usr/bin/supervisorctl status ${1} |/bin/awk -F ',' '{print $1}'|/bin/awk '{print $4}'`
    uptime=`ps -p $pid -o etime|/bin/grep -v ELAPSED|/bin/awk -F ':' '{print $(NF-1)}'`
    echo $uptime
}


#执行过程
if [ "x$1" == "xecho" ];then
    _SERVER_STATUS "$2"
fi
#
if [ "x$1" == "xdiscovery" ];then
    _SERVER_PROCESS
fi
#
if [ "x$1" == "xuptime" ];then
    _SERVER_UPTIME "$2"
fi

# 实例一
sh zabbix_check_server_process.sh echo pic_excel
# 实例二
/bin/bash zabbix_check_server_process.sh discovery  


# 触发器一
{Ali Template Supervisor:server_process.discovery[echo,{#SERVERPROCESS}].avg(#3)}>0.5 and {Ali Template Supervisor:server_process.discovery[echo,{#SERVERPROCESS}].last()}<>0
#触发器二
{Ali Template Supervisor:server_process.discovery[uptime,{#SERVERPROCESS}].max(#3)}<5


