#!/usr/bin/env bash
cd

cd /home/pi/Desktop/R/us_macro_data/

sudo rm -r ./Plots/*.*

sudo git pull 

sudo Rscript main.R

sudo cp ~/Desktop/R/us_macro_data/Plots/*.pdf	~/Desktop/tex/us_plot/

sudo zip /var/www/html/files/us_macro_data.zip ./Processed\ data/*.txt -j

cd ~/Desktop/tex/us_plot/

texliveonfly plots.tex

sudo mv /home/pi/Desktop/tex/us_plot/plots.pdf /var/www/html/files/us_plots.pdf

echo ' ' | mailx -s 'TR database and estimates updated' -A ~/Desktop/R/tex/us_plot/plots.pdf emanuele.franceschi@gmail.com

echo 'Script executed - mail received?' > ~/Desktop/db_script.log