#!/bin/sh

for medium in data1 bay brick ; do
    if [ -d "/run/media/andreas/${medium}" ]; then
        echo "--- ${medium} ---"
    else
        echo "xxx ${medium} not mounted xxx"
    fi

    if [ -d "/run/media/andreas/${medium}/Backups" ]; then
        echo "Backing up to: /run/media/andreas/${medium}/Backups"
        CONF="$HOME/.obnam-${medium}.conf"
        obnam --config=$CONF force-lock
        echo " << Generations >>"; obnam --config=$CONF generations && \
            echo " << Backup >>"; obnam --config=$CONF backup && \
            echo " << Forgetting >>"; obnam --config=$CONF forget && \
            echo " << Generations >>"; obnam --config=$CONF generations
        echo "-----------"
    fi

    if [ -d "/run/media/andreas/${medium}/Archive" ]; then
        echo "Archiving to: /run/media/andreas/${medium}/Archive"
        echo " << Pictures >>"; rsync -a -h --info=progress2 --stats /home/andreas/Pictures/ /run/media/andreas/${medium}/Archive/Pictures
        echo " << pwsafe >>"; rsync -a -h --info=progress2 --stats /home/andreas/.pwsafe.dat /run/media/andreas/${medium}/Archive
        echo "-----------"
    fi
done

