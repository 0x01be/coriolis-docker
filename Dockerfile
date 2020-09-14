FROM 0x01be/yosys as yosys

FROM alpine as builder

RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.4/main > /etc/apk/repositories

RUN apk add --no-cache --virtual build-dependencies \
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
    qt-dev

RUN apk add --no-cache --virtual additional-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    rapidjson-dev \
    libexecinfo-dev

RUN mkdir -p /root/coriolis-2.x/src/support
ENV REVISION devel
RUN git clone --depth 1 --branch ${REVISION} https://gitlab.lip6.fr/vlsi-eda/coriolis.git /root/coriolis-2.x/src/coriolis

WORKDIR /root/coriolis-2.x/src/coriolis/

RUN make install

