#!/bin/bash

# Install packages needed
 
apt update > /dev/null 2>&1 && apt install -y curl libflac-dev > /dev/null 2>&1

# Remove packages that can cause issues

apt -y purge opus* > /dev/null 2>&1 && apt -y purge libopus-dev > /dev/null 2>&1

# Download necessary files

TEMP_FOLDER="$(mktemp -d)"

# Opusfile
curl -Ls https://downloads.xiph.org/releases/opus/opusfile-0.12.tar.gz | tar xz -C "$TEMP_FOLDER"

# Opus
curl -Ls https://downloads.xiph.org/releases/opus/opus-1.5.2.tar.gz | tar xz -C "$TEMP_FOLDER"

# Libopusenc
curl -Ls https://downloads.xiph.org/releases/opus/libopusenc-0.2.1.tar.gz | tar xz -C "$TEMP_FOLDER"

# Opus Tools
curl -Ls https://downloads.xiph.org/releases/opus/opus-tools-0.2.tar.gz | tar xz -C "$TEMP_FOLDER"

# Compile

cd "$TEMP_FOLDER"/opus-1.5.2 || exit

./configure
make && make install

cd "$TEMP_FOLDER"/opusfile-0.12 || exit

./configure
make && make install

cd "$TEMP_FOLDER"/libopusenc-0.2.1 || exit

./configure
make && make install

cd "$TEMP_FOLDER"/opus-tools-0.2 || exit
./configure
make
make install
ldconfig

# Cleanup

rm -rf "$TEMP_FOLDER"
