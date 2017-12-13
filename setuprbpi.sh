sudo apt-get update && sudo apt-get upgrade

sudo su

# setup ntp for PSE

apt-get install ntp -y

sed -n 'H;${x;s/^\n//;s/#server .*$/server ntp.ens.fr\n&/;p}' /etc/ntp.conf 

timedatectl set-timezone Europe/Paris

service ntp restart

cd /home/pi/Desktop

# java fixing stuff

apt-get install openjdk-8-jre:armhf -y

wget https://www.dropbox.com/s/ofv5rnh2hssgycu/jdk-8u152-linux-arm32-vfp-hflt.tar.gz

tar zxvf jdk-8u152-linux-arm32-vfp-hflt.tar.gz -C /home/pi/Desktop

mkdir /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

cp /home/pi/Desktop/jdk1.8.0_152/jre/lib/arm/server/libjvm.so /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

# download and install Teamviewer

wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb

# installation must be performed manually!
dpkg teamviewer-host_armhf.deb

rm teamviewer-host_armhf.deb

# installing plenty of stuff

cd

apt-get install libnlopt-dev r-base octave dynare gnuplot ssmtp r-cran-rjava sharutils libxml2-dev r-cran-nloptr libssh2-1-dev r-cran-lme4 r-cran-pbkrtest r-cran-car libssl-dev r-cran-dynlm r-cran-curl r-cran-rcurl r-base-dev r-cran-httr build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev r-cran-r.utils libcurl4-openssl-dev -y

# set up cran cloud mirror in R

echo '
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org//"
  options(repos = r)
})' >> /etc/R/Rprofile.site

# install devtools

R -q -e "install.packages("devtools")"

# get certificates from Philly FED
mkdir /usr/share/ca-certificates/local

cd /usr/share/ca-certificates/local

wget https://entrust.com/root-certificates/entrust_l1k.cer

openssl x509 -inform PEM  -in entrust_l1k.cer -outform PEM -out entrust_l1k.crt

dpkg-reconfigure ca-certificates

# setup folders and repositories

cd

cd Desktop/

mkdir R && mkdir OctDyn

cd R/

git init

git clone https://github.com/ceschi/UnemplTaylor/

cd UnemplTaylor/

git pull origin master

cd .. && cd OctDyn

git init 

git clone https://github.com/ceschi/DTC/

git clone https://github.com/JohannesPfeifer/DSGE_mod

exit

sudo apt-get update && sudo apt-get upgrade -y

exit