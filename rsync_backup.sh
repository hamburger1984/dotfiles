#!/bin/sh

set -e

DATE=$(/bin/date +%Y-%m-%d-%H:%M:%S)
PREFIX='/run/media/andreas/'

if [ -d "${PREFIX}2017-11" ]; then
    BASE="${PREFIX}2017-11"
    TARGET=$BASE/Backups
    RSYNC=$(which /usr/bin/rsync)

    echo "Will backup to ${TARGET}/${DATE} using ${RSYNC}"

    if [ ! -d $TARGET ]; then
        echo "Missing target directory -- creating ${TARGET}"
        sudo mkdir $TARGET
        sudo chown andreas:andreas $TARGET
        ln -s $TARGET $TARGET/latest
    fi

    if [ ! -e $HOME/.rsync.exclude ]; then
        echo "Missing exclude file."
        exit 1
    fi

    # -a  group all this options -rlptgoD recursive, links, perms,
    #     times, group, owner, devices
    # -H  preserve hard links
    # -A  preserve ACLs
    # -X  preserve extended attributes
    # -S  handle sparse files efficiently
    $RSYNC -aHAXS --info=progress2 \
        --exclude $TARGET \
        --exclude-from=$HOME/.rsync.exclude \
        --link-dest=$TARGET/latest/ $HOME/ $TARGET/$DATE/
    touch $TARGET/$DATE/
    rm $TARGET/latest
    ln -s $TARGET/$DATE $TARGET/latest
fi
