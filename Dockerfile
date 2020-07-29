FROM 0x01be/yosys as yosys

FROM alpine:3.12.0 as builder

RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.4/main > /etc/apk/repositories

RUN apk add --no-cache --virtual build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    git \
    build-base \
    binutils-dev \
    cmake \
    bison \
    flex \
    zlib-dev \
    libxml2-dev \
    bzip2-dev  \
    autoconf \
    libxt-dev \
    libxpm-dev \
    tcl-dev \
    python-dev \
    boost-dev \
    libffi-dev \
    readline-dev \
    qt-dev \
    rapidjson-dev \
    libexecinfo-dev

RUN git clone --depth 1 https://gitlab.lip6.fr/vlsi-eda/coriolis.git /coriolis

WORKDIR /

RUN make -f /coriolis/bootstrap/Makefile.package build

