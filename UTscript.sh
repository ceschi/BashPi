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

# sudo rm -r Plots/
# sudo rm -r Processed\ data/
# sudo rm -r Downloaded\ files/

exit