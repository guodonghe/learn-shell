# 批量替换文件

#!/bin/bash

# 源文件路径
SOURCE_FILE="/root/person_det_rgb.pt"

# 搜索路径
SEARCH_PATH="/data"

# 目标文件名
TARGET_FILE_NAME="person_det_rgb.pt"

# 检查源文件是否存在
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "源文件 $SOURCE_FILE 不存在，退出程序。"
    exit 1
fi

# 使用 find 命令搜索目标文件
FOUND_FILES=$(find "$SEARCH_PATH" -name "$TARGET_FILE_NAME")

# 判断是否找到目标文件
if [[ -z "$FOUND_FILES" ]]; then
    echo "未找到任何名为 $TARGET_FILE_NAME 的文件。"
    exit 0
fi

# 遍历找到的文件并替换
for FILE in $FOUND_FILES; do
    if [[ -f "$FILE" ]]; then
        cp "$SOURCE_FILE" "$FILE" && echo "已替换: $FILE" || echo "替换失败: $FILE"
    else
        echo "$FILE 不是有效文件，跳过。"
    fi
done

echo "文件替换完成！"
