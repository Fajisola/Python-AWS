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

