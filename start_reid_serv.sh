#!/bin/bash
#
#
#reid_serv服务自动拉起脚本 
#
#
#

#时间
TMPDATE=$(/bin/date +%F' '%T)

#PID文件 
PIDFILE=/tmp/.reid_serv_start.pid

echo "hello"

#脚本运行状态
if [ -f ${PIDFILE} ];then
    /bin/ps -ef |/bin/grep -v grep |/bin/grep -q "$(/bin/cat ${PIDFILE})" && exit
fi

echo "world"

#创建PID文件 
echo $$ > ${PIDFILE}

echo ${PIDFILE}
echo "nihao"

#流服务器运行状态判断
DEVMGR_SERV_STATUS=$(/usr/bin/pgrep reid_serv)

#sleep 10
#服务状态返回
if [ ${#DEVMGR_SERV_STATUS} -eq 0 ];then
    #切换目录
    cd /data/sysadmin/service_deploy_data/reid_serv;
    #启动服务
    #/data/sysadmin/service_deploy_data/reid_serv/reid_serv
    source ~/.bashrc &&  ./reid_serv
    #打印日志
    echo "${TMPDATE} 启动reid_serv服务[ OK ]...."
fi

#删除PID文件 
/bin/rm -f ${PIDFILE}
