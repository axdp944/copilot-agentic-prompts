# Ralph Wiggum AI Agent Development Environment
# Based on Ubuntu LTS for maximum compatibility
FROM ubuntu:24.04

ENV COPILOT_INSTRUCTIONS=/root/.copilot

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Core utilities
    bash \
    coreutils \
    findutils \
    grep \
    sed \
    gawk \
    # Development essentials
    git \
    curl \
    wget \
    ca-certificates \
    openssh-client \
    # Build tools (needed for native Node modules)
    build-essential \
    python3 \
    # Text editors
    vim \
    nano \
    # Process management
    procps \
    htop \
    # Networking tools
    dnsutils \
    iputils-ping \
    net-tools \
    # Archive utilities
    tar \
    gzip \
    unzip \
    zip \
    # JSON processing
    jq \
    # Additional useful tools
    less \
    tree \
    file \
    sudo \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Set up locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set bash as default shell
SHELL ["/bin/bash", "-c"]

# Set up environment variables for NVM
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=22

# Install NVM and Node.js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Add NVM to bash profile for interactive shells
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> /root/.bashrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /root/.bashrc \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> /root/.bashrc

# Set PATH to include node (find the actual installed version)
RUN ln -s $(find /root/.nvm/versions/node -maxdepth 1 -type d -name "v*" | head -1)/bin/node /usr/local/bin/node \
    && ln -s $(find /root/.nvm/versions/node -maxdepth 1 -type d -name "v*" | head -1)/bin/npm /usr/local/bin/npm \
    && ln -s $(find /root/.nvm/versions/node -maxdepth 1 -type d -name "v*" | head -1)/bin/npx /usr/local/bin/npx

# Verify Node.js installation
RUN node --version && npm --version

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code \
    && ln -s $(find /root/.nvm/versions/node -maxdepth 1 -type d -name "v*" | head -1)/bin/claude /usr/local/bin/claude

# Verify Claude installation
RUN claude --version

# Install GitHub Copilot CLI
RUN npm install -g @github/copilot \
    && ln -s $(find /root/.nvm/versions/node -maxdepth 1 -type d -name "v*" | head -1)/bin/copilot /usr/local/bin/copilot

# Verify Copilot CLI installation
RUN copilot --version

# Create workspace directory
WORKDIR /workspace

# Default command - keeps container running
CMD ["bash"]
