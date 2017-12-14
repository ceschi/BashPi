#!/usr/bin/env bash
cd

cd /home/pi/Desktop/R/UnemplTaylor/

sudo git pull 

sudo Rscript mainTaylor.R

cd Plots/

sudo zip -r results.zip ~/Desktop/R/UnemplTaylor/Plots 

echo 'The results from last run of the TR study' | mailx -s 'Monthly estimates' -A results.zip emanuele.franceschi@gmail.com

cd ..

sudo rm -r Plots/
sudo rm -r Processed\ data/
sudo rm -r Downloaded\ files/

exit