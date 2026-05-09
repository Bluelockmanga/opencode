# Use a lightweight base image
FROM ubuntu:latest

# Install essential dependencies
RUN apt-get update && apt-get install -y \
    curl \
        ca-certificates \
            git \
                && rm -rf /var/lib/apt/lists/*

                # Install OpenCode using the official script
                RUN curl -fsSL https://opencode.ai/install | bash

                # Set environment variables for the server
                ENV OPENCODE_SERVER_HOSTNAME=0.0.0.0
                ENV OPENCODE_SERVER_PORT=4096

                # Expose the default OpenCode server port
                EXPOSE 4096

                # Start OpenCode in standalone server mode
                CMD ["opencode", "serve"]