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
#yum -y install http://rpms.remirepo.net/enterprise/remi-release-8.rpm  >> $LOG
yum -y update >> $LOG
#yum -y install libmcrypt.x86_64 libmcrypt-devel.x86_64 libc-client.x86_64 lighttpd-fastcgi.x86_64 lighttpd.x86_64 php56 php56-php-mysql >> $LOG
yum -y install lighttpd-fastcgi.x86_64 lighttpd.x86_64;
cd ~/
git clone https://github.com/taidos/hypervm-taidos -b alpha --single-branch >> $LOG;
cp -R ~/hypervm-taidos/files/patch/vzquota /usr/bin/vzquota >> $LOG;
tar xvf ~/hypervm-taidos/files/php/lib64.tar -C /usr/lib64/ >> $LOG;
mkdir -p /usr/local/lxlabs/ext >> $LOG;
tar xvf ~/hypervm-taidos/files/php/php.tar -C /usr/local/lxlabs/ext >> $LOG;
ln -s /usr/local/lxlabs/ext/php/php /usr/bin/php >> $LOG;
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
ln -s /usr/lib/systemd/system/mariadb.service /usr/lib/systemd/system/mysqld.service;
ln -s /usr/lib/systemd/system/mariadb.service /etc/init.d/mysqld;
/usr/local/lxlabs/ext/php/php lxins.php  --install-type=master $* | tee $LOG;
mkdir -p /usr/local/lxlabs/ext/lxlighttpd/sbin/;
ln -s /usr/sbin/lighttpd /usr/local/lxlabs/ext/lxlighttpd/sbin/hypervm.httpd;
cp -R /root/hypervm-taidos/files/hypervm-current/hypervm/httpdocs/htmllib/filecore/program.pem /usr/local/lxlabs/hypervm/etc/program.pem;
cp -R /root/hypervm-taidos/files/hypervm-current/hypervm/httpdocs/htmllib/filecore/program.ca /usr/local/lxlabs/hypervm/etc/program.ca;
service hypervm restart;
echo -e "I still need to make it more clean but is working"


