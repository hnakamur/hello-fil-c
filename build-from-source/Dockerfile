FROM ubuntu:25.04

RUN apt-get update
RUN apt-get -y install git build-essential cmake ninja-build python3 patchelf autoconf gawk bison ruby clang

WORKDIR /root
RUN git clone --depth 1 https://github.com/pizlonator/fil-c.git
WORKDIR /root/fil-c
RUN ./build_all_fast_glibc.sh 2>&1 | tee build.log || :
