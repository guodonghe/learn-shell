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
