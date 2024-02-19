# Use a base image with a minimal Linux distribution
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 \
    xterm \
    x11vnc \
    openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up a password for the VNC server
RUN mkdir ~/.vnc && x11vnc -storepasswd your_password ~/.vnc/passwd

# Set up SSH server
RUN mkdir /var/run/sshd

# Expose VNC and SSH ports
EXPOSE 5900 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

