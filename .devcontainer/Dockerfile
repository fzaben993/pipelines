# Build stage
FROM mcr.microsoft.com/devcontainers/base:noble AS build

# Update package list and install necessary packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends ansible yamllint wget software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "Installing Terraform" && \
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
    apt update -y && apt install terraform -y
RUN echo "Download and Install AWS CLI" && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf awscliv2.zip && \
    rm -rf aws

#RUN echo "Installing AWS CLI" && \
#    apt install awscli -y


# # Install Zsh plugins
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/install.zsh)"

# # Install Prettier (via npm)
# RUN npm install -g prettier

# Final stage
FROM mcr.microsoft.com/devcontainers/base:noble
# Copy essential files from build stage
COPY --from=build /usr/bin/ /usr/bin/
COPY --from=build /usr/local/bin/ /usr/local/bin/

# Switch to the vscode user
USER root 

# Healthcheck to ensure container is healthy
# HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "pgrep", "zsh" ]
