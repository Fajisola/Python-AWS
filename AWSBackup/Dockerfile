FROM zapp88/graalvm-multiarch:arm64-java11-graalvm22.3.0
MAINTAINER Veronica Ajisola <veronica.ajisola@getluckyvr.com>
LABEL component=remediate-vulnerability
RUN apt update && apt install --only-upgrade libksba8 libgssapi3-heimdal libhx509-5-heimdal libkrb5-26-heimdal libasn1-8-heimdal
