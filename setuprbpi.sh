#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y

# setup ntp for PSE

sudo apt-get install ntp -y

sudo service ntp stop

sudo sed -i -n 'H;${x;s/^\n//;s/#server .*$/server ntp.ens.fr\n&/;p}' /etc/ntp.conf

sudo ntpd -gq

sudo timedatectl set-timezone Europe/Paris

sudo service ntp start

cd /home/pi/Desktop

# java fixing stuff

sudo apt-get install openjdk-8-jre:armhf -y

# for R consider downloading source codes from https://stat.ethz.ch/R/daily/R-patched.tar.gz and then
# compile the code locally on the RPi : check https://www.raspberrypi.org/forums/viewtopic.php?t=221861
# https://github.com/r-lib/fs/issues/128	https://github.com/r-lib/fs/issues/128#issuecomment-435552967

wget https://www.dropbox.com/s/ofv5rnh2hssgycu/jdk-8u152-linux-arm32-vfp-hflt.tar.gz

sudo tar zxvf jdk-8u152-linux-arm32-vfp-hflt.tar.gz -C /home/pi/Desktop

sudo mkdir /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

sudo cp /home/pi/Desktop/jdk1.8.0_152/jre/lib/arm/server/libjvm.so /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

# download and install Teamviewer

wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb

sudo apt --fix-broken install -y

# installation must be performed manually!
sudo dpkg --install teamviewer-host_armhf.deb

sudo rm teamviewer-host_armhf.deb

sudo apt --fix-broken install -y

# installing plenty of stuff

cd ~/Desktop/

sudo apt-get install -y libnlopt-dev ssmtp r-base octave dynare gnuplot r-cran-rjava sharutils libxml2-dev r-cran-nloptr libssh2-1-dev r-cran-lme4 r-cran-pbkrtest r-cran-car libssl-dev r-cran-dynlm r-cran-curl r-cran-rcurl r-base-dev r-cran-httr build-essential libcurl4-openssl-dev libxml2-dev libssl-dev r-cran-r.utils mailutils libcairo-script-interpreter2 libcairo2-dev libfontconfig1-dev libpixman-1-dev libxcb-shm0-dev libxrender-dev libzstd-dev libzstd1 screen x11proto-render-dev xvfb #  libcurl4-gnutls-dev

# set up cran cloud mirror in R

sudo echo '
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org//"
  options(repos = r)
})' >> /etc/R/Rprofile.site

# switch to gnuplot for Octave

sudo echo '
graphics_toolkit("gnuplot")
' > ~/.octaverc

# install fixed fs, fix Makevars file, install it and then devtools

sudo wget https://cran-r.c3sl.ufpr.br/src/contrib/fs_1.2.6.tar.gz

sudo tar xzvf fs_1.2.6.tar.gz

sudo sed -i '/ifeq ($(UNAME), Linux)/aPKG_LIBS += -pthread' /home/pi/Desktop/fs/src/Makevars

sudo R -q -e "install.packages('/home/pi/Desktop/fs', type = 'source', repos = NULL)"

sudo R -q -e "install.packages('devtools')"

sudo R -q -e "source('/homi/pi/Desktop/BashPi/pkg_utils.R); old_pax(dir = '/home/pi/Desktop/BashPi/R_installation.txt')"





# get certificates from Philly FED
sudo mkdir /usr/share/ca-certificates/local

cd /usr/share/ca-certificates/local

sudo wget https://entrust.com/root-certificates/entrust_l1k.cer

sudo openssl x509 -inform PEM  -in entrust_l1k.cer -outform PEM -out entrust_l1k.crt

sudo dpkg-reconfigure ca-certificates

# setting up email account in clear

sudo sed -n -i.backup -e '/mailhub/d' /etc/ssmtp/ssmtp.conf

# add a way to ask address and pwd so to make code safe

read -p 'Mail address (full): ' uservar
read -p 'Mail password: ' userpwd

sudo echo "
AuthUser= $uservar
AuthPass= $userpwd
FromLineOverride=YES
mailhub=smtp.gmail.com:465
UseSTARTTLS=YES
">> /etc/ssmtp/ssmtp.conf

# setup folders and repositories

cd ~/Desktop/

mkdir R && mkdir OctDyn

cd R/

sudo git clone https://github.com/ceschi/us_macro_data

sudo git clone https://github.com/stablemarkets/BayesianTutorials

cd ../OctDyn/

git init

sudo git clone https://github.com/ceschi/DTC/

sudo git clone https://github.com/JohannesPfeifer/DSGE_mod

# crontab scheduler

sudo echo '# m h  dom mon dow   command
MAILTO = ""
00 4 28 * * sudo bash /home/pi/Desktop/BashPi/macro_data_script.sh
0 1 * * * cd /home/pi/Desktop/BashPi/ && sudo git pull
0 7 * * * sudo bash /home/pi/Desktop/BashPi/cv_up.sh' | sudo crontab -e

mkdir /home/pi/Desktop/tex
mkdir /home/pi/Desktop/tex/cv
cd /home/pi/Desktop/tex/cv
wget https://1drv.ms/u/s!Ag80lJ_0I81cgaB4Ih-p9vL4AOQ3vA
wget https://1drv.ms/u/s!Ag80lJ_0I81cgvhrV5qCdHhOvlV3hQ


sudo apt update && sudo apt upgrade -y

sudo apt autoremove && sudo apt autoclean

echo '
================================================================
                     end of the game
================================================================'


# housekeeping
sudo rm -r /home/pi/Desktop/fs
sudo rm -r /home/pi/Desktop/jdk1.8.0_152
sudo rm /home/pi/Desktop/teamviewer-host_armhf.deb
sudo rm /home/pi/Desktop/fs_1.2.6.tar.gz
sudo rm /home/pi/Desktop/jdk-8u152-linux-arm32-vfp-hflt.tar.gz


exit
