#!/bin/sh

set -e

if [ -d "./nimble0" ]; then
    rm -rf "./nimble0"
fi

echo "-- building csources --"
pushd csources > /dev/null && \
    git pull && \
    sh build.sh && \
    popd > /dev/null

echo "-- compiling koch --"
nim c koch
./koch boot
./koch boot -d:release

echo "-- installing nimble --"
./koch nimble
nimble update
