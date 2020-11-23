#!/usr/bin/env bash

set -e;
packagesNamesFile=$1;

if [ -f "$packagesNamesFile" ]; then
	for envVar in ${!ACTION_*};
	do
		unset $envVar;
	done

	for envVar in ${!GITHUB_*};
	do
		unset $envVar;
	done

	for envVar in ${!INPUT_*};
	do
		unset $envVar;
	done

	echo "##[group] Installing apt package $(cat $packagesNamesFile)";
	xargs sudo apt-get install -y  < ${packagesNamesFile};
	echo "##[endgroup]";
else
	echo "$packagesNamesFile is not present. Nothing to do."
fi;
