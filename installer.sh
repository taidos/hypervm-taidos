IFS="$"
LOG="/root/hypervm-install.log"

if ! [ -f /usr/bin/yum ] ; then
          echo "You at least need yum installed for this to work..."
          echo "Please support me and go to my website at http://github.com/taidos"
          exit
fi
echo -e "HyperVM - Taidos Fork"
echo -e "---------------------"
echo -e "First Step - Install needed packages"
echo -e "First Step - Install needed packages" >> $LOG
echo -e "---------------------" >> $LOG
yum -y install which wget zip unzip git epel-release php >> $LOG
yum -y install http://rpms.remirepo.net/enterprise/remi-release-8.rpm  >> $LOG
yum -y update >> $LOG
yum -y install libmcrypt.x86_64 libmcrypt-devel.x86_64 libc-client.x86_64 lighttpd-fastcgi.x86_64 lighttpd.x86_64 php56 >> $LOG
cd ~/
git clone https://github.com/taidos/hypervm-taidos -b alpha --single-branch >> $LOG;
cp -R ~/hypervm-taidos/files/patch/vzquota /usr/bin/vzquota >> $LOG;
chmod 777 /usr/bin/vzquota >> $LOG;
#rpm -Uvh ~/hypervm-taidos/files/rpm/libdb4-4.8.30-13.el7.x86_64.rpm >> $LOG;
#rpm -Uvh ~/hypervm-taidos/files/rpm/libmcrypt-2.5.8-13.el7.x86_64.rpm >> $LOG;
#rpm -Uvh ~/hypervm-taidos/files/rpm/libc-client-2007f-16.el7.x86_64.rpm >> $LOG;
#rpm -Uvh ~/hypervm-taidos/files/rpm/hypervm-core-php-5.5.38-1.el7.x86_64.rpm >> $LOG;
#rpm -Uvh ~/hypervm-taidos/files/rpm/hypervm-core-lighttpd-1.4.54-1.el7.src.rpm >> $LOG
echo -e "Second Stage - Install HyperVM"
echo -e "---------------------"
echo -e "Second Stage - Install HyperVM" >> $LOG
echo -e "---------------------" >> $LOG
cd ~/hypervm-taidos/files/program-install/
php lxins.php  --install-type=master $* | tee $LOG
echo -e "I still need to make it more clean but is working"


