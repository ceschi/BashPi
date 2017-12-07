sudo apt-get update && sudo apt-get upgrade

cd /home/pi/Desktop

# java fixing stuff

wget http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-arm32-vfp-hflt.tar.gz

sudo tar zxvf jdk-8u152-linux-arm32-vfp-hflt.tar.gz -C /home/pi/Desktop

sudo mkdir /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

sudo cp /home/pi/Desktop/jdk1.8.0_152/jre/lib/arm/server/libjvm.so /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/

# download and install Teamviewer

wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb

sudo dpkg teamviewer-host_armhf.deb

sudo rm teamviewer-host_armhf.deb

cd

sudo apt-get install libnlopt-dev r-base octave dynare gnuplot ssmtp r-cran-rjava sharutils libxml2-dev r-cran-nloptr libssh2-1-dev r-cran-lme4 r-cran-pbkrtest r-cran-car libssl-dev r-cran-dynlm r-cran-curl r-cran-rcurl r-base-dev r-cran-httr r-cran-r.utils -y

# set up cran cloud mirror in R

# fixing the time in ntp

cd

cd Desktop/

sudo mkdir R && sudo mkdir OctDyn

cd /R/

sudo git init

sudo git clone https://github.com/ceschi/UnemplTaylor/

cd UnemplTaylor/

sudo git pull origin master

cd .. && cd OctDyn

sudo git init 

sudo git clone https://github.com/ceschi/DTC/

sudo git clone https://github.com/JohannesPfeifer/DSGE_mod