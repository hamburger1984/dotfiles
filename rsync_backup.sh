#!/bin/sh

set -e

DATE=$(/bin/date +%Y-%m-%d-%H:%M:%S)

for medium in /run/media/andreas/*/; do
    medium=${medium%*/}
    if [[ ! -d $medium ]]; then
        echo "$medium is a not folder, skip"
        continue
    fi

    read -p "Backup to $medium? y|N" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        BASE="${medium}"
        if [ -d $BASE ]; then
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
            # -x  don't include other mounted filesystems
            # -S  handle sparse files efficiently
            $RSYNC -aHAXxS --info=progress2 \
                --delete-delay --delete-excluded \
                --exclude $TARGET \
                --exclude-from=$HOME/.rsync.exclude \
                --link-dest=$TARGET/latest/ $HOME/ $TARGET/$DATE/
            touch $TARGET/$DATE/
            rm $TARGET/latest
            ln -s $TARGET/$DATE $TARGET/latest
        fi
    fi
done
