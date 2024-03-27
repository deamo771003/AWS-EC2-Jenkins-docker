FROM jenkins/jenkins:lts
USER root
# Docker io
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

RUN curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose
USER jenkins
