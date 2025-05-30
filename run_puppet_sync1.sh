#!/bin/bash

# 定义日志文件路径
LOG_DIR="/var/log/puppet-sync"
LOG_FILE="${LOG_DIR}/puppet-sync-$(date +%Y%m%d).log"

# 创建日志目录（如果不存在）
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# 日志函数
log() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local message="$1"
    echo "[$timestamp] $message" | tee -a "$LOG_FILE"
}

# 定义要执行puppet-sync的主机组
HOSTS=("huoshanyun-stream" "huidian-stream" "tianyiyun-stream" "baidu-stream")

# 记录脚本开始执行
log "开始执行puppet-sync脚本"
log "目标主机: ${HOSTS[*]}"

# 遍历主机组执行ansible命令
for host in "${HOSTS[@]}"; do
    log "=== 开始在主机 $host 上执行puppet-sync ==="

    # 执行ansible命令并检查返回值
    if ansible $host -m shell -a 'puppet-sync' -b; then
        log "主机 $host 的puppet-sync执行成功"
    else
        log "错误: 主机 $host 的puppet-sync执行失败"
        log "脚本执行终止"
        exit 1  # 如果命令执行失败，脚本将退出
    fi

    log "----------------------------------------"
done

# 记录脚本执行完成
log "所有主机的puppet-sync执行完成"

# 记录脚本执行统计信息
log "执行统计:"
log "- 总主机数: ${#HOSTS[@]}"
log "- 成功主机数: ${#HOSTS[@]}"
log "- 失败主机数: 0"
log "- 执行时间: $(date '+%Y-%m-%d %H:%M:%S')"

# 设置日志文件权限
chmod 644 "$LOG_FILE"
