# Start with the official Ubuntu image
FROM ubuntu:latest

# Set the environment variable to prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    curl \
    nano \
    less \
    iproute2 \
    net-tools \
    iputils-ping \
    openssh-client \
    htop \
    gnupg2 \
    ca-certificates \
    bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
    && chmod a+r /etc/apt/keyrings/docker.asc

RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN echo 'ubuntu:ubuntu' | chpasswd && \
    usermod -aG sudo ubuntu

USER ubuntu

WORKDIR /home/ubuntu

CMD ["/bin/bash"]

