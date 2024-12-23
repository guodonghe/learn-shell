# 磁盘挂载

#!/bin/bash

# 检查是否以 root 权限运行
if [ "$EUID" -ne 0 ]; then
    echo "请使用 root 权限运行此脚本"
    exit 1
fi

# 定义变量
DISK_DEVICE="/dev/sdb"  # 新磁盘的设备名称（请根据实际情况修改）
MOUNT_POINT="/mnt/data"  # 挂载点路径（可以自定义）

# 检查磁盘是否存在
if [ ! -b "$DISK_DEVICE" ]; then
    echo "磁盘设备 $DISK_DEVICE 不存在，请检查！"
    exit 1
fi

# 创建分区
echo "正在为磁盘 $DISK_DEVICE 创建分区..."
(
echo n  # 新建分区
echo p  # 主分区
echo 1  # 分区号
echo    # 使用默认的第一个扇区
echo    # 使用默认的最后一个扇区
echo w  # 写入更改
) | fdisk $DISK_DEVICE

# 刷新分区表
partprobe $DISK_DEVICE

# 格式化分区
PARTITION="${DISK_DEVICE}1"
echo "正在格式化分区 $PARTITION..."
mkfs.ext4 $PARTITION

# 创建挂载点
echo "正在创建挂载点 $MOUNT_POINT..."
mkdir -p $MOUNT_POINT

# 挂载分区
echo "正在挂载分区 $PARTITION 到 $MOUNT_POINT..."
mount $PARTITION $MOUNT_POINT

# 更新 /etc/fstab
echo "正在更新 /etc/fstab..."
UUID=$(blkid -s UUID -o value $PARTITION)
echo "UUID=$UUID $MOUNT_POINT ext4 defaults 0 0" >> /etc/fstab

# 验证挂载
echo "验证挂载是否成功..."
mount | grep $MOUNT_POINT && echo "磁盘挂载成功！" || echo "挂载失败，请检查。"

exit 0
