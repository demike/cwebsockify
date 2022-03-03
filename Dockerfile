FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install build-essential gcc-multilib git cmake libssl-dev libssl-dev:i386 && apt-get clean && apt-get autoclean



ADD . /cwebsockify
WORKDIR /cwebsockify

# ======= build cwebsockify ========

RUN cmake .
RUN make


# ======= build debian package ( TODO ) =======
# RUN chmod -R 775 ./packaging
# RUN cp ./bin/websockify ./packaging/usr/local/bin
# RUN dpkg-deb -b ./packaging websockify.deb


# =======howto build and package =======
# docker build -t websockify .
# docker run --rm websockify cat /cwebsockify/bin/websockify > websockify

## debian packaging (disabled for now)
# docker run --rm websockify cat /cwebsockify/websockify.deb > websockify.deb
