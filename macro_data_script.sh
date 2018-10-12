#!/usr/bin/env bash
cd

cd /home/pi/Desktop/R/us_macro_data/

sudo rm -r ./Plots/*.*

sudo git pull 

sudo Rscript main.R

texliveonly -c ~/Desktop/tex/us_plot/plots.tex

echo ' ' | mailx -s 'TR database and estimates updated' -A ~/Desktop/R/tex/us_plot/plots.pdf emanuele.franceschi@gmail.com

sudo zip /var/www/html/files/us_macro_data.zip ./Processed\ data/*.txt -j