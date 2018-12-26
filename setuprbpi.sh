sudo apt-get update && sudo apt-get upgrade -y



# setup ntp for PSE

sudo apt-get install ntp -y

sudo service ntp stop

sudo ntpd -gq

sudo sed -n 'H;${x;s/^\n//;s/#server .*$/server ntp.ens.fr\n&/;p}' /etc/ntp.conf 

sudo timedatectl set-timezone Europe/Paris

sudo service ntp start

cd /home/pi/Desktop

# java fixing stuff

sudo apt-get install openjdk-8-jre:armhf -y

echo '





===========================================================================
				errors produced but it is ok
===========================================================================





'

wget https://www.dropbox.com/s/ofv5rnh2hssgycu/jdk-8u152-linux-arm32-vfp-hflt.tar.gz

sudo tar zxvf jdk-8u152-linux-arm32-vfp-hflt.tar.gz -C /home/pi/Desktop

sudo mkdir /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

sudo cp /home/pi/Desktop/jdk1.8.0_152/jre/lib/arm/server/libjvm.so /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

# download and install Teamviewer

wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb

# installation must be performed manually!
sudo dpkg --install teamviewer-host_armhf.deb

sudo rm teamviewer-host_armhf.deb

# installing plenty of stuff

sudo apt --fix-broken install

cd

sudo apt-get install libnlopt-dev ssmtp r-base octave dynare gnuplot r-cran-rjava sharutils libxml2-dev r-cran-nloptr libssh2-1-dev r-cran-lme4 r-cran-pbkrtest r-cran-car libssl-dev r-cran-dynlm r-cran-curl r-cran-rcurl r-base-dev r-cran-httr build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev r-cran-r.utils mailutils -y

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

# install devtools

sudo R -q -e "install.packages("devtools")"

# get certificates from Philly FED
sudo mkdir /usr/share/ca-certificates/local

cd /usr/share/ca-certificates/local

wget https://entrust.com/root-certificates/entrust_l1k.cer

sudo openssl x509 -inform PEM  -in entrust_l1k.cer -outform PEM -out entrust_l1k.crt

sudo dpkg-reconfigure ca-certificates

# setting up email account in clear

sudo sed -n -i.backup -e '/mailhub/d' /etc/ssmtp/ssmtp.conf

# add a way to ask address and pwd so to make code safe

read -p 'Mail username: ' uservar
read -p 'Mail password: ' userpwd

sudo echo "
AuthUser= $uservar
AuthPass= $userpwd
FromLineOverride=YES
mailhub=smtp.gmail.com:465
UseSTARTTLS=YES
">> /etc/ssmtp/ssmtp.conf

# setup folders and repositories

cd

cd Desktop/

mkdir R && mkdir OctDyn

cd R/

git init

sudo git clone https://github.com/ceschi/UnemplTaylor/

cd UnemplTaylor/

sudo git pull origin master

cd .. && cd OctDyn

git init 

sudo git clone https://github.com/ceschi/DTC/

sudo git clone https://github.com/JohannesPfeifer/DSGE_mod

sudo apt-get update && sudo apt-get upgrade -y

echo ' 
====================================================================
						process terminated!
====================================================================

'

exit
