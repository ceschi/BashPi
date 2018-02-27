#!/usr/bin/env bash
cd

cd /home/pi/Desktop/R/UnemplTaylor/

sudo git pull 

sudo Rscript mainTaylor.R

cd Plots/

sudo zip -r results.zip .

echo 'The results from last run of the TR study' | mailx -s 'Monthly estimates' -A results.zip emanuele.franceschi@gmail.com

sudo rm results.zip

cd ..

cd /var/www/html/files/

sudo zip -r US_macro_data.zip /home/pi/Desktop/R/UnemplTaylor/Processed\ data/*.txt

sudo zip data.zip /home/pi/Desktop/R/UnemplTaylor/Readme_data.pdf

# sudo rm -r Plots/
# sudo rm -r Processed\ data/
# sudo rm -r Downloaded\ files/

exit