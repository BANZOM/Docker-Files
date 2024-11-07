# Start with the official Ubuntu image
FROM ubuntu:latest

# Set the environment variable to prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

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
    git \
    webhook \
    ca-certificates \
    bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Copy startup script
COPY ./startup.sh /home/ubuntu/

# Change ownership and permissions
RUN chmod +x /home/ubuntu/startup.sh

# Set working directory
WORKDIR /home/ubuntu

# Run startup script on container start
CMD ["./startup.sh"]
