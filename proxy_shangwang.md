1. Docker Engine（守护进程）走代理（拉镜像时）
配置 /etc/systemd/system/docker.service.d/http-proxy.conf：
mkdir -p /etc/systemd/system/docker.service.d

cat <<EOF | tee /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:12334"
Environment="HTTPS_PROXY=http://127.0.0.1:12334"
Environment="NO_PROXY=localhost,127.0.0.1,::1"
EOF

然后重新加载：
systemctl daemon-reexec
systemctl restart docker

2. Dockerfile Build 阶段走代理（构建镜像时）
写 Dockerfile：

FROM ubuntu:22.04
# 声明 build 阶段可以接收代理参数
ARG HTTP_PROXY
ARG HTTPS_PROXY

# 用代理安装
RUN apt-get update && apt-get install -y curl
然后 build 时指定代理：
docker build \
  --build-arg HTTP_PROXY=http://127.0.0.1:12334 \
  --build-arg HTTPS_PROXY=http://127.0.0.1:12334 \
  -t myapp .
✅ 这样build 镜像时也走代理！
3. docker-compose 运行容器阶段走代理（容器内部用代理）
写 docker-compose.yml：
version: '3'
x-proxy-env: &proxy-env
  - HTTP_PROXY=http://127.0.0.1:12334
  - HTTPS_PROXY=http://127.0.0.1:12334
  - NO_PROXY=localhost,127.0.0.1

services:
  myapp:
    build:
      context: .
      args:
        HTTP_PROXY: http://127.0.0.1:12334
        HTTPS_PROXY: http://127.0.0.1:12334
    environment: *proxy-env
然后直接启动：
docker-compose up --build

🎯 终极流程总结表：
阶段 | 配置方式 | 作用
拉镜像（docker pull） | systemd 配置 proxy | docker 引擎走代理
Build 镜像（docker build） | --build-arg 和 Dockerfile ARG | 构建阶段走代理
运行容器（docker run/docker-compose） | docker-compose.yml 的 environment | 容器内部走代理


