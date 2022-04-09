FROM debian:latest

LABEL maintainer="Tyler Staut"

# Hashcat Versions
ENV HASHCAT_VERSION        v6.2.5
ENV HASHCAT_UTILS_VERSION  v1.9

# Update & Install Packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    make \
    clinfo \
    build-essential \
    git \
    libcurl4-openssl-dev \
    libssl-dev zlib1g-dev \
    libcurl4-openssl-dev \
    libssl-dev

# Set Working Directory
WORKDIR /root

# Download Hashcat & Hashcat Utils
RUN git clone https://github.com/hashcat/hashcat.git && cd hashcat && git checkout ${HASHCAT_VERSION} && make install -j4
RUN git clone https://github.com/hashcat/hashcat-utils.git && cd hashcat-utils/src && git checkout ${HASHCAT_UTILS_VERSION} && make
