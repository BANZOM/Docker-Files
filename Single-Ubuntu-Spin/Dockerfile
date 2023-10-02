FROM ubuntu:22.04

# Arguments
ARG USERNAME=ubuntu
ARG PASSWORD=ubuntu

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -yq apt-utils >/dev/null 2>&1 

# Set the locale
RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the timezone
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    sudo \
    git \
    nano \
    python3 \
    python3-pip \
    openjdk-11-jdk \
    python3-flask \
    python3-django \
    python3-virtualenv \
    curl \
    htop \
    neofetch

# Create a non-root user with sudo privileges
RUN useradd -m -s /bin/bash ${USERNAME} && \
    echo "${USERNAME}:${PASSWORD}" | sudo chpasswd && \
    usermod -aG sudo ${USERNAME}

# Create a non-root user: guest
RUN useradd -m -s /bin/bash guest && \
    passwd -d guest && \
    echo "guest ALL=(ALL) NOPASSWD: /bin/echo" > /etc/sudoers.d/guest

# Expose ports
EXPOSE 80 443 8080 8888 5000 

# Set the default debian frontend i.e newt
ENV DEBIAN_FRONTEND=newt

# Set the working directory
WORKDIR /home/${USERNAME}/

# Entry point to start the container as User
USER guest