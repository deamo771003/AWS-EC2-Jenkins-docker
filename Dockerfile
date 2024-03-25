FROM jenkins/jenkins:lts
USER root
# 安装 Docker 客户端
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# 可选: 只保留 Docker 客户端, 移除 Docker 守护进程等其他组件
RUN apt-get remove -y docker docker-engine docker.io containerd runc
RUN apt-get autoremove -y

RUN curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose
USER jenkins
