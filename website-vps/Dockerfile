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
    nginx \
    ca-certificates \
    bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER root

COPY ./startup.sh /home/ubuntu

WORKDIR /home/ubuntu

RUN chmod +x startup.sh

CMD ["bash ./startup.sh"]
