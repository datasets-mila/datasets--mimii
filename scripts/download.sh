#!/bin/bash

# This script is meant to be used with the command 'datalad run'

for file_url in "https://zenodo.org/record/3384388/files/-6_dB_fan.zip?download=1 -6_dB_fan.zip" \
                "https://zenodo.org/record/3384388/files/-6_dB_pump.zip?download=1 -6_dB_pump.zip" \
                "https://zenodo.org/record/3384388/files/-6_dB_slider.zip?download=1 -6_dB_slider.zip" \
                "https://zenodo.org/record/3384388/files/-6_dB_valve.zip?download=1 -6_dB_valve.zip" \
                "https://zenodo.org/record/3384388/files/0_dB_fan.zip?download=1 0_dB_fan.zip" \
                "https://zenodo.org/record/3384388/files/0_dB_pump.zip?download=1 0_dB_pump.zip" \
                "https://zenodo.org/record/3384388/files/0_dB_slider.zip?download=1 0_dB_slider.zip" \
                "https://zenodo.org/record/3384388/files/0_dB_valve.zip?download=1 0_dB_valve.zip" \
                "https://zenodo.org/record/3384388/files/6_dB_fan.zip?download=1 6_dB_fan.zip" \
                "https://zenodo.org/record/3384388/files/6_dB_pump.zip?download=1 6_dB_pump.zip" \
                "https://zenodo.org/record/3384388/files/6_dB_slider.zip?download=1 6_dB_slider.zip" \
                "https://zenodo.org/record/3384388/files/6_dB_valve.zip?download=1 6_dB_valve.zip"
do
	echo ${file_url} | git-annex addurl --raw --batch --with-files
done

md5sum -c md5sums
