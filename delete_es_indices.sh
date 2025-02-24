#!/bin/bash

# Elasticsearch 服务器地址
ES_HOST="http://localhost:9200"

# 指定要删除的月份
for month in $(seq -w 9 11); do
    # 指定要删除的日期
    for day in $(seq -w 1 30); do
        # 生成索引名称
        INDEX_NAME="face_img_detail_2022.${month}.${day}"

        # 打印要删除的索引
        echo "Deleting index: $INDEX_NAME"

        # 发送 DELETE 请求
        curl -X DELETE "$ES_HOST/$INDEX_NAME" -w "\n"

        # 检查是否成功删除
        if [ $? -eq 0 ]; then
            echo "Successfully deleted index: $INDEX_NAME"
        else
            echo "Failed to delete index: $INDEX_NAME"
        fi
    done
done

# 使用 seq -w 1 30 处理日期, seq -w 1 30 确保 1 变成 01，2 变成 02，避免 face_img_detail_2022.09.1 这样的错误
