# syntax=docker/dockerfile:1
FROM ubuntu:25.04

RUN apt-get update
RUN apt-get -y install git build-essential cmake ninja-build python3 patchelf autoconf gawk bison ruby clang

ARG BUILD_USER=build
RUN useradd --create-home --user-group ${BUILD_USER}

USER ${BUILD_USER}
WORKDIR /home/${BUILD_USER}
RUN git clone --depth 1 https://github.com/pizlonator/fil-c.git
WORKDIR /home/${BUILD_USER}/fil-c
RUN ./build_all_fast_glibc.sh

COPY --chown=${BUILD_USER}:${BUILD_USER} hello.c hello.cpp /home/${BUILD_USER}
WORKDIR /home/${BUILD_USER}
RUN ./fil-c/build/bin/clang -O2 -g -o hello hello.c
RUN ./fil-c/build/bin/clang++ -O2 -g -o hello-cpp hello.cpp
