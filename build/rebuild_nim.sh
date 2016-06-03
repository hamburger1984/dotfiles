#!/bin/sh

set -e

if [ -d "./nimble0" ]; then
    rm -rf "./nimble0"
fi

pushd csources > /dev/null && \
    git pull && \
    sh build.sh && \
    popd > /dev/null

bin/nim c koch

./koch boot -d:release
