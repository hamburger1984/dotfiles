#!/bin/sh
for dir in $(find -L . -maxdepth 4 -xtype d -type d -iname .git | sort); do
  echo ${dir%/.git}
	cd ${dir%/.git}
#	git pull --rebase origin master
  git pull origin master
	cd - > /dev/null
	echo 
done

for dir in $(find -L . -maxdepth 2 -xtype d -type d -iname .svn | cut -d / -f 2 | sort); do
	echo $dir
	svn up $dir
	echo
done

for dir in $(find -L . -maxdepth 2 -xtype d -type d -iname .hg | cut -d / -f 2 | sort); do
	echo $dir
	cd $dir
	hg pull -u
	cd ..
	echo
done

for dir in $(find -L . -maxdepth 2 -xtype d -type d -iname .bzr | cut -d / -f 2 | sort); do
	echo $dir
	cd $dir
	bzr merge
	cd ..
	echo
done

