FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install build-essential git cmake libssl-dev && apt-get clean && apt-get autoclean

ADD . /cwebsockify
WORKDIR /cwebsockify

# ======= build cwebsockify ========

# RUN cmake
# RUN make configure
# RUN make 


# ======= build debian package =======
RUN dpkg-deb -b ./packaging websockify.deb


# howto build and package
# docker build -t websockify
##  docker run -d websockify
# docker run --rm websockify cat /cwebsockify/websockify.deb > websockify.deb
