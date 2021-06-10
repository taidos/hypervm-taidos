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
yum -y install which wget zip unzip git >> $LOG
cd ~/
git clone https://github.com/taidos/hypervm-taidos >> $LOG;
rpm -Uvh ~/hypervm-taidos/files/rpm/libdb4-4.8.30-13.el7.x86_64.rpm >> $LOG;
rpm -Uvh ~/hypervm-taidos/files/rpm/libmcrypt-2.5.8-13.el7.x86_64.rpm >> $LOG;
rpm -Uvh ~/hypervm-taidos/files/rpm/libc-client-2007f-16.el7.x86_64.rpm >> $LOG;
rpm -Uvh ~/hypervm-taidos/files/rpm/hypervm-core-php-5.5.38-1.el7.x86_64.rpm >> $LOG;
rpm -Uvh ~/hypervm-taidos/files/rpm/hypervm-core-lighttpd-1.4.54-1.el7.src.rpm >> $LOG
cd ~/hypervm-taidos/files/program-install/hypervm-linux
php lxins.php  --install-type=master $*  >> $LOG


