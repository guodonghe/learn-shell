#!/bin/bash

# 定义目标目录数组
TARGET_DIRS=(
    "/data/sysadmin/service_deploy_data/objectrecognition_person/bin/"
    "/data/sysadmin/service_deploy_data/objectrecognition_p3/bin"
    "/data/sysadmin/service_deploy_data/objectrecognition_p2/bin"
    "/data/sysadmin/service_deploy_data/objectrecognition/bin"
)

# 日志文件路径
LOG_FILE="/var/log/delete_core_files.log"

# 记录开始时间
echo "========== Core File Cleanup Started: $(date) ==========" >> "$LOG_FILE"

# 遍历每个目录
for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        # 查找 core 文件
        core_files=$(find "$dir" -type f -name "core*")

        if [ -n "$core_files" ]; then
            echo "Deleting core files in: $dir" >> "$LOG_FILE"
            for file in $core_files; do
                echo "Deleted: $file" >> "$LOG_FILE"
                #rm -f "$file"
            done
        else
            echo "No core files found in: $dir" >> "$LOG_FILE"
        fi
    else
        echo "Directory not found: $dir" >> "$LOG_FILE"
    fi
done

# 记录结束时间
echo "========== Core File Cleanup Completed: $(date) ==========" >> "$LOG_FILE"


# 示例二

#!/bin/bash

# 定义目标目录数组
TARGET_DIRS=(
    "/data/sysadmin/service_deploy_data/objectrecognition_person/bin/"
    "/data/sysadmin/service_deploy_data/objectrecognition_p3/bin"
    "/data/sysadmin/service_deploy_data/objectrecognition_p2/bin"
    "/data/sysadmin/service_deploy_data/objectrecognition/bin"
)

# 遍历每个目录，删除 core 文件
for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Cleaning core files in: $dir"
        #find "$dir" -type f -name "core*" -delete
        find "$dir" -type f -name "core*"
        echo "$(date): Deleted core files in $dir" >> /var/log/delete_specific_core_files.log
    else
        echo "Directory not found: $dir"
    fi
done

echo "Core file cleanup completed."
