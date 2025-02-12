#!/bin/bash

# 获取当前时间
TMPDATE=$(/bin/date +%F' '%T)

# 定义服务 1 (9081) 相关变量
PIDFILE_1=/tmp/.reid_serv_9081.pid
WORKDIR_1=/data/sysadmin/service_deploy_data/reid_serv
PORT_1=9081

# 定义服务 2 (9082) 相关变量
PIDFILE_2=/tmp/.reid_serv_9082.pid
WORKDIR_2=/data/sysadmin/service_deploy_data/newreid
PORT_2=9082

# 端口检查函数
check_port() {
    /usr/sbin/lsof -i :$1 > /dev/null 2>&1
    return $?  # 0: 端口被占用（服务运行中），1: 端口未占用（服务未运行）
}

# 启动服务函数
start_service() {
    local PIDFILE=$1
    local WORKDIR=$2
    local PORT=$3

    # 如果 PID 文件存在，并且进程仍在运行，则退出
    if [ -f ${PIDFILE} ]; then
        if /bin/ps -ef | /bin/grep -v grep | /bin/grep -q "$(/bin/cat ${PIDFILE})"; then
            echo "${TMPDATE} 端口 ${PORT} 的 reid_serv 已在运行，无需启动。" >> /var/log/reid_serv_monitor.log
            return
        fi
    fi

    # 记录当前脚本的 PID，防止重复运行
    echo $$ > ${PIDFILE}

    # 检查端口
    check_port ${PORT}
    if [ $? -ne 0 ]; then
        cd ${WORKDIR} || exit
        source ~/.bashrc && ./reid_serv
        echo "${TMPDATE} 启动 reid_serv (端口 ${PORT}) [ OK ]..." >> /var/log/reid_serv_monitor.log
    else
        echo "${TMPDATE} reid_serv (端口 ${PORT}) 已在运行。" >> /var/log/reid_serv_monitor.log
    fi

    # 确保服务启动后再删除 PID 文件
    sleep 5
    check_port ${PORT}
    if [ $? -eq 0 ]; then
        /bin/rm -f ${PIDFILE}
    fi
}

# 监控并启动两个服务
start_service ${PIDFILE_1} ${WORKDIR_1} ${PORT_1}
start_service ${PIDFILE_2} ${WORKDIR_2} ${PORT_2}
