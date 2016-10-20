#!/bin/sh

set -e

mount_prefix="/run/media/andreas/"

for medium in data1 bay brick ; do
    if [ -d "${mount_prefix}${medium}" ]; then
        echo "--- ${medium} ---"
    else
        echo "xxx ${medium} not mounted xxx"
    fi

    if [ -d "${mount_prefix}${medium}/Backups" ]; then
        echo "Running backup (obnam)."
        CONF="$HOME/.obnam-${medium}.conf"
        obnam --config=$CONF force-lock
        echo " << Generations >>"; obnam --config=$CONF generations && \
            echo " << Backup >>"; obnam --config=$CONF backup && \
            echo " << Forgetting >>"; obnam --config=$CONF forget && \
            echo " << Generations >>"; obnam --config=$CONF generations
        echo "-----------"
    fi

    if [ -d "${mount_prefix}${medium}/Archive" ]; then
        echo "Running backup (rsync)."
        echo " << Pictures >>"; rsync -a -h --info=progress2 --stats /home/andreas/Pictures/ ${mount_prefix}${medium}/Archive/Pictures
        echo " << pwsafe >>"; rsync -a -h --info=progress2 --stats /home/andreas/.pwsafe.dat ${mount_prefix}${medium}/Archive
        echo "-----------"
    fi
done

