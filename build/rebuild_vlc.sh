#!/bin/sh

# required on first run..
if [ ! -f ./configure ]; then
    ./bootstrap
fi

./configure --prefix=$HOME/opt --exec-prefix=$HOME/opt \
    --with-x --enable-vdpau --enable-wayland \
    --enable-xvideo --enable-sdl \
    --enable-mad --enable-a52 --enable-dca \
    --enable-libmpeg2 --enable-dvdnav --enable-faad \
    --enable-vorbis --enable-ogg --enable-theora \
    --enable-mkv --enable-freetype --enable-fribidi \
    --enable-speex --enable-flac --enable-avcodec \
    --enable-merge-ffmpeg \
    --enable-caca --disable-swscale \
    --disable-skins2 --enable-alsa --enable-pulse \
    --without-kde-solid \
    --enable-qt --enable-ncurses --enable-chromaprint

./compile -j -l 6

make install
