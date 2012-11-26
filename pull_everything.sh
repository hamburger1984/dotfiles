#!/bin/sh
build=0
force=0
while getopts "bf" o
do
	case "$o" in
		"b")
			build=1
			;;
		"f")
			force=1
			;;
	esac
done

for dir in $(find -L . -maxdepth 5 -xtype d -type d -iname .git | sort); do
	echo ${dir%/.git}
	pushd ${dir%/.git} >/dev/null
	otxt=$(git pull origin master)
	ocode=$?
	echo "$otxt"
	if [ $build -eq 1 ] && [ $ocode -eq 0 ] && [ -d "./build" ]; then
		if [ $force -eq 1 ] || [[ ! "$otxt" == *"up-to-date"* ]]; then
			pushd "./build" >/dev/null

			if [ -e "./build.sh" ]; then
				sh ./build.sh
			else
				cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 1.5
			fi

			popd >/dev/null
		fi
	fi
	popd >/dev/null
	echo 
done

for dir in $(find -L . -maxdepth 3 -xtype d -type d -iname .svn | cut -d / -f 2 | sort); do
	echo $dir
	pushd $dir >/dev/null
	otxt=$(svn up .)
	ocode=$?
	echo "$otxt"
	if [ $build -eq 1 ] && [ $ocode -eq 0 ] && [ -d "./build" ]; then
		if [ $force -eq 1 ] || [[ "$otxt" == *"Aktualisiert"* ]]; then
			pushd "./build" >/dev/null

			if [ -e "./build.sh" ]; then
				sh ./build.sh
			else
				cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 1.5
			fi

			popd >/dev/null
		fi
	fi
	popd >/dev/null
	echo
done

#for dir in $(find -L . -maxdepth 2 -xtype d -type d -iname .hg | cut -d / -f 2 | sort); do
#	echo $dir
#	cd $dir
#	hg pull -u
#	cd ..
#	echo
#done

#for dir in $(find -L . -maxdepth 2 -xtype d -type d -iname .bzr | cut -d / -f 2 | sort); do
#	echo $dir
#	cd $dir
#	bzr merge
#	cd ..
#	echo
#done

