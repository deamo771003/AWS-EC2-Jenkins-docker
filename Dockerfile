FROM jenkins/jenkins:lts
USER root
# Docker io
RUN apt-get update && apt-get install -y docker.io

RUN curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose
USER jenkins
