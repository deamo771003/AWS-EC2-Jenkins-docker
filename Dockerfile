FROM jenkins/jenkins:lts
USER root

# 安装 Docker 客户端
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# 可选: 只保留 Docker 客户端, 移除 Docker 守护进程等其他组件
RUN apt-get remove -y docker docker-engine docker.io containerd runc
RUN apt-get autoremove -y

# 安装 docker-compose
# 请替换下面的版本号为您需要的版本
ARG DOCKER_COMPOSE_VERSION=2.26.0
RUN curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

USER jenkins
