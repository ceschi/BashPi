#!/usr/bin/env bash

cd ~/Desktop/R/UnemplTaylor/

sudo git pull master origin

sudo Rscript mainTaylor.R

cd Plots/

sudo zip -r results.zip ~/Desktop/R/UnemplTaylor/Plots | uuencode results.zip | ssmtp emanuele.franceschi@gmail.com

cd

exit