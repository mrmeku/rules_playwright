FROM mcr.microsoft.com/playwright:v1.50.1-noble

# Download bazelisk and place it in $PATH
RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.18.0/bazelisk-linux-arm64
RUN chmod +x bazelisk-linux-arm64
RUN mv bazelisk-linux-arm64 /usr/local/bin/bazel