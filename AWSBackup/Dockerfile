FROM zapp88/graalvm-multiarch:arm64-java11-graalvm22.3.0
MAINTAINER Veronica Ajisola <veronica.ajisola@getluckyvr.com>
LABEL component=remediate-vulnerability
RUN apt update && apt install --only-upgrade libksba8 libgssapi3-heimdal libhx509-5-heimdal libkrb5-26-heimdal libasn1-8-heimdal



FROM arm64v8/openjdk:11-jre-slim-buster

RUN apt-get update && apt-get install -y unzip && apt-get clean

ENV GRAAL_VERSION=22.3.0

# Download GraalVM
RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-$GRAAL_VERSION/graalvm-ce-java11-linux-aarch64-$GRAAL_VERSION.tar.gz

# Unpack GraalVM
RUN tar -xzf graalvm-ce-java11-linux-aarch64-$GRAAL_VERSION.tar.gz

# Set GraalVM home
ENV GRAALVM_HOME=/graalvm-ce-java11-linux-aarch64-$GRAAL_VERSION

# Add GraalVM to the PATH
ENV PATH=$GRAALVM_HOME/bin:$PATH

# Install the native-image component
RUN gu install native-image

# update the base image with polyglot capabilities
RUN gu install python R ruby




FROM debian:stable-slim




FROM arm64v8/debian:stable-slim

# Set environment variables
ENV GRAAL_VERSION 22.3.0

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install GraalVM
RUN curl -fsSL https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-$GRAAL_VERSION/graalvm-ce-java11-linux-aarch64-$GRAAL_VERSION.tar.gz | tar -zxC /opt && \
    ln -s /opt/graalvm-ce-java11-linux-aarch64-$GRAAL_VERSION /opt/graalvm

# Set the GraalVM path
ENV PATH /opt/graalvm/bin:$PATH

# Install the GraalJS component
RUN gu install js


ARG GRAAL_VERSION
ARG JDK_VERSION

RUN set -xeu && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates `# stays, not having this is just not useful` \
        curl \
        && \
    mkdir /graalvm && \
    curl -fsSL "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.0/graalvm-ce-java11-linux-aarch64-22.3.0.tar.gz" \
        | tar -zxC /graalvm --strip-components 1 && \
    find /graalvm -name "*src.zip"  -printf "Deleting %p\n" -exec rm {} + && \
    { test ! -d /graalvm/legal || tar czf /graalvm/legal.tgz /graalvm/legal/; } && \
    { test ! -d /graalvm/legal || rm -r /graalvm/legal; } && \
    rm -rf /graalvm/man `# does not exist in java11 package` && \
    echo Cleaning up... && \
    apt-get remove -y \
        curl \
        && \
    apt-get autoremove -y && \
    apt-get clean && rm -r "/var/lib/apt/lists"/* && \
    echo 'PATH="/graalvm/bin:$PATH"' | install --mode 0644 /dev/stdin /etc/profile.d/graal-on-path.sh && \
    echo OK

# This applies to all container processes. However, `bash -l` will source `/etc/profile` and set $PATH on its own. For this reason, we
# *also* set $PATH in /etc/profile.d/*
ENV PATH=/graalvm/bin:$PATH

RUN set -xeu && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        gcc \
        g++ \
        libz-dev \
        && \
    gu install native-image && \
    # Cleanup
    apt-get clean && rm -rf "/var/lib/apt/lists/*" && \
    echo OK

RUN set -xeu && \
    gu install -c org.graalvm.python && \
    gu install -c org.graalvm.ruby && \
    echo OK

RUN set -xeu && \
    gu install js \
    echo Ok
