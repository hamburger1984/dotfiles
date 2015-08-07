#!/bin/sh

pushd csources > /dev/null && \
    git pull && \
    sh build.sh && \
    popd > /dev/null

bin/nim c koch

./koch boot -d:release
