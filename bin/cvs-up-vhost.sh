#!/bin/sh

vhosts=$@
basedir=/u
directories="htdocs/uk
	htdocs/canada
	htdocs/templates
	htdocs/webworkplaces
	php-europe
	php"

if [ "$vhosts" = "" ]; then
	echo No vhost name specified
	exit
fi

for vhost in $vhosts; do

	if [ -d "$basedir/$vhost" ]; then
		pushd "$basedir/$vhost" >/dev/null

		for directory in $directories; do
			if [ -d "$basedir/$vhost/$directory" ]; then
				cd "$basedir/$vhost/$directory"
				echo -n "In " && pwd
				cvs -q update -d -P
			else
				echo Directory does not exist: $basedir/$vhost/$directory
			fi
		done

		popd >/dev/null
	else
		echo Base directory does not exist: $basedir/$vhost
	fi

done
