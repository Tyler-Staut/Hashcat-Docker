FROM tylerstaut/hashcat-docker

ENV DRIVER_REPO http://repo.radeon.com/amdgpu-install/latest/ubuntu/focal
ENV DRIVER_VERSION amdgpu-install_22.10.50100-1_all.deb  

ARG DEBIAN_FRONTEND=noninteractive
ENV TERM xterm
ENV TZ America/New_York
RUN apt-get install -y tzdata

# Download amdgpu drivers
RUN wget ${DRIVER_REPO}/${DRIVER_VERSION} -O amdgpu-install.deb

# Install amdgpu drivers
RUN dpkg --add-architecture i386 
RUN apt-get install -y ./amdgpu-install.deb  && apt-get -y update
RUN amdgpu-install -y --usecase=rocm --no-dkms