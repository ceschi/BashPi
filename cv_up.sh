#!/usr/bin/env bash

cd /home/pi/Desktop/tex/cv/

texliveonfly -c xelatex cv_acc_EN.tex

texliveonfly -c xelatex cv_acc_FR.tex

sudo cp -f cv_acc_*.pdf /var/www/html/files/

sudo rm cv_acc_*.aux cv_acc_*.log  cv_acc_*.out cv_acc_*.synctex.gz