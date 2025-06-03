#!/bin/bash

# 定义要搜索的目录列表
#  "/data/sysadmin/service_deploy_data/objectrecognition_p3/bin/"
#    "/data/sysadmin/service_deploy_data/objectrecognition_p2/bin/"
DIRS=(
    "/data/sysadmin/service_deploy_data/objectrecognition_person/bin/"
    "/data/sysadmin/service_deploy_data/objectrecognition/bin/"
)

# 定义要替换的内容
OLD_TEXT="smoke2_thres=0.4,0.7,0.4,0.5,0.4,416"
NEW_TEXT="smoke2_thres=0.4,0.7,0.4,0.7,0.4,416"

# 日志文件，用于记录替换的文件
LOG_FILE="replacement_log.txt"
echo "Replacement started at $(date)" > "$LOG_FILE"

# 遍历目录
for DIR in "${DIRS[@]}"; do
    echo "Processing directory: $DIR" >> "$LOG_FILE"
    # 查找并替换文件内容
    find "$DIR" -type f -name "objectrecognition.ini" -exec sed -i "s/$OLD_TEXT/$NEW_TEXT/g" {} + -exec echo "Replaced in: {}" >> "$LOG_FILE" \;
done

echo "Replacement completed at $(date)" >> "$LOG_FILE"
echo "Check the log file: $LOG_FILE for details."

