FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y curl xz-utils patchelf binutils libgcc-13-dev

ARG FILC_VERSION=0.671

RUN curl -sSL https://github.com/pizlonator/fil-c/releases/download/v${FILC_VERSION}/filc-${FILC_VERSION}-linux-x86_64.tar.xz | tar Jx -C /root
WORKDIR /root/filc-${FILC_VERSION}-linux-x86_64
RUN ./setup.sh

COPY hello.c hello.cpp /root/filc-${FILC_VERSION}-linux-x86_64
RUN build/bin/clang -O2 -g -o hello hello.c
RUN build/bin/clang++ -O2 -g -o hello-cpp hello.cpp
