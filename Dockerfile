# Use Debian as the base image
FROM ubuntu:latest

ARG ZEPHYR_SDK_VERSION=0.17.0
ARG ZEPHYR_SDK_INSTALL_DIR=/opt/toolchains/zephyr-sdk-${ZEPHYR_SDK_VERSION}
ARG ZEPHYR_SDK_TOOLCHAINS="-t arm-zephyr-eabi"

# OS dependencies and packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake \
    device-tree-compiler \
    git \
    ninja-build \
    wget \
    xz-utils \
    build-essential \
    gcc \
    g++ \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    libc6-dev \
    libnewlib-dev \
    g++-multilib \
    qemu-utils qemu-system-x86 qemu-system \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create the 'gha' user before using it
RUN useradd -m gha

# Set up Python virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV && \
    $VIRTUAL_ENV/bin/pip install --no-cache-dir wheel west

# Set the correct permissions for the virtual environment
RUN chown -R gha:gha /opt/venv

# Zephyr SDK
RUN export sdk_file_name="zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-$(uname -m)_minimal.tar.xz" \
  && wget -q "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/${sdk_file_name}" \
  && mkdir -p ${ZEPHYR_SDK_INSTALL_DIR} \
  && tar -xvf ${sdk_file_name} -C ${ZEPHYR_SDK_INSTALL_DIR} --strip-components=1 \
  && ${ZEPHYR_SDK_INSTALL_DIR}/setup.sh -c ${ZEPHYR_SDK_TOOLCHAINS} \
  && rm ${sdk_file_name}

# Set Zephyr SDK path
ENV ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ENV ZEPHYR_SDK_INSTALL_DIR=/opt/toolchains/zephyr-sdk-${ZEPHYR_SDK_VERSION}
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

# Set up GitHub Actions Runner
RUN mkdir /actions-runner && cd /actions-runner \
  && curl -O -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz \
  && tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz \
  && rm actions-runner-linux-x64-2.323.0.tar.gz

# Ensure the user has permissions to access necessary directories
RUN chown -R gha:gha /usr/src /actions-runner

# Copy the entrypoint script to the root (still as root)
COPY ./entrypoint.sh /entrypoint.sh

# Change permissions while still root
RUN chmod +x /entrypoint.sh

# Switch to the 'gha' user
USER gha

# Set working directory to the user's home directory for the runner
WORKDIR /actions-runner

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

