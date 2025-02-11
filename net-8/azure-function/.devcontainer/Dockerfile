FROM mcr.microsoft.com/devcontainers/dotnet:8.0-bookworm

# Setup and Install Azure Functions Core Tools
RUN apt-get update && apt-get install gpg wget  -y
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /usr/share/keyrings/microsoft-prod.gpg
RUN wget -q https://packages.microsoft.com/config/debian/12/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /usr/share/keyrings/microsoft-prod.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list
RUN apt-get update && apt-get install azure-functions-core-tools-4=4.0.6610-1 -y
RUN apt-get update && apt-get install libicu-dev  -y
RUN sudo chmod +x /usr/lib/azure-functions-core-tools-4/in-proc8/func

# Set the working directory
WORKDIR /workspace