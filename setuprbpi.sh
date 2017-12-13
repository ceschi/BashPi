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

wget http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-arm32-vfp-hflt.tar.gz

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

apt-get install libnlopt-dev r-base octave dynare gnuplot ssmtp r-cran-rjava sharutils libxml2-dev r-cran-nloptr libssh2-1-dev r-cran-lme4 r-cran-pbkrtest r-cran-car libssl-dev r-cran-dynlm r-cran-curl r-cran-rcurl r-base-dev r-cran-httr r-cran-r.utils -y

# set up cran cloud mirror in R

echo '
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org//"
  options(repos = r)
}' >> /etc/R/Rprofile.site

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