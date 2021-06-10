IFS="$"
LOG="/root/hypervm-install.log"

if ! [ -f /usr/bin/yum ] ; then
          echo "You at least need yum installed for this to work..."
          echo "Please contact our support personnel Or visit the website at http://github.com/taidos"
          exit
fi
echo -e "HyperVM - Taidos Fork"
echo -e "---------------------"
echo -e "First Step - Install needed packages"
echo -e "First Step - Install needed packages" >> $LOG
#rpm -Uvh https://raw.githubusercontent.com/taidos/hypervm-taidos/main/files/rpm/hypervm-core-lighttpd-1.4.54-1.el7.src.rpm >> $LOG
#rpm -Uvh https://raw.githubusercontent.com/taidos/hypervm-taidos/main/files/rpm/hypervm-core-php-5.5.38-1.el7.x86_64.rpm >> $LOG
yum -y install which wget zip unzip git >> $LOG
git clone https://github.com/taidos/hypervm-taidos >> $LOG

