#!/bin/bash

# this script is meant to be used with 'datalad run'

pip install -r scripts/requirements_extract.txt
ERR=$?
if [ $ERR -ne 0 ]; then
   echo "Failed to install requirements: pip install: $ERR"
   exit $ERR
fi

mkdir -p 0dB/
mkdir -p 6dB/
mkdir -p min6dB/

jug status -- scripts/extract.py "./0_dB*.zip*" --output "0dB/"
jug execute -- scripts/extract.py "./0_dB*.zip*" --output "0dB/" &>> extract.out
jug status -- scripts/extract.py "./6_dB*.zip*" --output "6dB/"
jug execute -- scripts/extract.py "./6_dB*.zip*" --output "6dB/" &>> extract.out
jug status -- scripts/extract.py "./-6_dB*.zip*" --output "min6dB/"
jug execute -- scripts/extract.py "./-6_dB*.zip*" --output "min6dB/" &>> extract.out

rm files_count.stats
for dir in 0dB/* 6dB/* min6dB/*
do
	echo $(find $dir -type f | wc -l; echo $dir) >> files_count.stats
done

du -s 0dB/* 6dB/* min6dB/* > disk_usage.stats
