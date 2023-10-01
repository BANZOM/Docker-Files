# Use the official Ubuntu 22.04 image as the base image
FROM ubuntu:____

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

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
    neofetch \
    && rm -rf /var/lib/apt/lists/*

# Set the root password 
RUN echo '____:____' | chpasswd

# Create a non-root user and set credentials
ARG USERNAME=____
ARG PASSWORD=____

RUN useradd -m -s /bin/bash -G sudo ${USERNAME} && \
    echo "${USERNAME}:${PASSWORD}" | chpasswd

# Expose ports (e.g., for Jupyter Notebook)
EXPOSE ____

# Set the working directory
WORKDIR /home/${USERNAME}

# Entry point to ask for a password
CMD ["bash", "-c", "echo 'Enter password:' && sudo -S -u ${USERNAME} /bin/bash"]
