#!/bin/bash

# 主机组数组
HOST_GROUPS=("tianyiyun-stream" "huoshanyun-stream" "huidian-stream" "baidu-stream")

# 要执行的命令列表
COMMANDS=(
  "cat /data/sysadmin/service_deploy_data/stream-server/stream_serv.ini | grep serv_ips"
  "cat /data/sysadmin/service_deploy_data/ulu_srs/conf/srs.conf   |grep listen_ip"
  "ps -ef | grep stream_serv | grep -v grep"
  "md5sum /data/sysadmin/service_deploy_data/stream-server/stream_serv"
)

# 循环执行
for HOST in "${HOST_GROUPS[@]}"; do
  echo "==================== $HOST ===================="
  for CMD in "${COMMANDS[@]}"; do
    echo ">> Running: $CMD"
    ansible "$HOST" -m shell -a "$CMD" -b
    echo
  done
done
