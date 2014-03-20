#!/bin/sh

for medium in data1 bay ; do
    if [ -d "/run/media/andreas/${medium}" ]; then
        echo "--- ${medium} ---"
    else
        echo "xxx ${medium} not mounted xxx"
    fi

    if [ -d "/run/media/andreas/${medium}/Backups" ]; then
        echo "Backing up to: /run/media/andreas/${medium}/Backups"
        CONF="$HOME/.obnam-${medium}.conf"
        obnam --config=$CONF force-lock
        echo " << Generations >>"; obnam --config=$CONF generations && echo " << Backup >>"; obnam --config=$CONF backup && echo " << Forgetting >>"; obnam --config=$CONF forget && echo " << Generations >>"; obnam --config=$CONF generations
        echo "-----------"
    fi

    if [ -d "/run/media/andreas/${medium}/Archive" ]; then
        echo "Archiving to: /run/media/andreas/${medium}/Archive"
        rsync -a /home/andreas/Pictures /run/media/andreas/${medium}/Archive/Pictures
        echo "-----------"
    fi
done
