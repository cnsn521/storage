#!/bin/bash

# 定义文件名和URL
FILE_NAME="webBenchmark_linux_x64"
DOWNLOAD_URL="https://github.com/maintell/webBenchmark/releases/download/0.6/webBenchmark_linux_x64"
TEST_URL="https://speed.cloudflare.com/__down?bytes=25000000000"

# 检查文件是否存在
if [ -f "$FILE_NAME" ]; then
    echo "$FILE_NAME 文件已存在，开始执行性能测试..."
else
    echo "$FILE_NAME 文件不存在，开始下载..."
    # 下载文件
    curl -L -o $FILE_NAME $DOWNLOAD_URL
    # 赋予执行权限
    chmod +x $FILE_NAME
    echo "下载并赋予执行权限完成，开始执行性能测试..."
fi

# 执行性能测试
./$FILE_NAME -c 16 -s $TEST_URL
