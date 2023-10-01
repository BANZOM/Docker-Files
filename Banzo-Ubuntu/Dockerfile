# Use the official Ubuntu 22.04 image as the base image
FROM ubuntu:22.04

# Set environment variables
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}

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

# Set the root password (replace 'your_root_password' with your desired password)
ARG ROOT_PASSWORD
RUN echo 'root:${ROOT_PASSWORD}' | chpasswd

# Create User1 with no permissions and echo message for sudo
ARG USER1
RUN useradd -m -s /bin/bash ${USER1} && \
    passwd -d ${USER1} && \
    echo "${USER1} ALL=(ALL) NOPASSWD: /bin/echo" > /etc/sudoers.d/${USER1}

# Create User2 with password protection and permissions
ARG USER2
ARG USER2_PASSWORD
RUN useradd -m -s /bin/bash ${USER2} && \
    echo '${USER2}:${USER2_PASSWORD}' | chpasswd && \
    usermod -aG sudo ${USER2}

# Expose ports (e.g., for Jupyter Notebook)
EXPOSE 8888

# Set the working directory
WORKDIR /home/${USER1}

# Entry point to start the container as User1
USER ${USER1}
CMD ["bash"]


# docker build command to build the image 
# docker build -t my-image --build-arg ROOT_PASSWORD=myrootpassword --build-arg USER1=user1 --build-arg USER2=user2 --build-arg USER2_PASSWORD=user2password .