#! /usr/bin/env ash
set -e

apk update 
apk upgrade   
apk add autoconf automake gettext-dev g++ make openssl-dev pkgconfig zlib-dev git gdb

# Prepare building
mkdir -p /tmp/inspircd

# Download, compile and install ZNC.
cd /tmp/inspircd
curl https://codeload.github.com/inspircd/inspircd/tar.gz/v2.0.25 | tar -zx; cd inspircd-2.0.25
./configure --enable-extras="m_ssl_gnutls.cpp"
./configure --prefix=/opt/inspircd  --enable-openssl --uid ircd 
make
make install

#clean up 
apk del  autoconf automake pkgconfig 
rm  -rf /tmp/inspircd /var/cache/apk/*
