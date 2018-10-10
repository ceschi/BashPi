#!/usr/bin/env bash

cd /home/pi/Desktop/tex/cv/

texliveonfly -c xelatex cv_acc_EN.tex

texliveonfly -c xelatex cv_acc_FR.tex

sudo cp -f cv_acc_*.pdf /var/www/html/files/
