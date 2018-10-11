#!/usr/bin/env bash
cd

cd /home/pi/Desktop/R/us_macro_data/

sudo rm -r ./Plots/*.*

sudo git pull 

sudo Rscript main.R

echo ' ' | mailx -s 'TR database and estimates updated' emanuele.franceschi@gmail.com

cd ~

cd /var/www/html/files/

sudo zip -r US_macro_data.zip /home/pi/Desktop/R/us_macro_data/Processed\ data/*.txt

sudo zip data.zip /home/pi/Desktop/R/us_macro_data/Readme_data.pdf