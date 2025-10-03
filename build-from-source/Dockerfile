# syntax=docker/dockerfile:1
FROM ubuntu:25.04

RUN apt-get update
RUN apt-get -y install git build-essential cmake ninja-build python3 patchelf autoconf gawk bison ruby clang

WORKDIR /root
RUN git clone --depth 1 --branch support_root_user_in_test https://github.com/hnakamur/fil-c.git
WORKDIR /root/fil-c
RUN ./build_all_fast_glibc.sh

COPY hello.c hello.cpp /root
WORKDIR /root
RUN ./fil-c/build/bin/clang -O2 -g -o hello hello.c
RUN ./fil-c/build/bin/clang++ -O2 -g -o hello-cpp hello.cpp
