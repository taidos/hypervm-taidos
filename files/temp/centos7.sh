#!/bin/sh

if ! [ -f /usr/bin/yum ] ; then
      echo You at least need yum installed for this to work...
	  echo Please contact our support personnel Or visit the forum at http://github.com/taidos
	  echo "                                "
	  exit
fi

if [ -f /usr/bin/yum ] ; then
	yum -y install php wget zip unzip 
else 
	up2date --nox --nosig php wget zip unzip
fi

if ! [ -f /usr/bin/php ] ; then
	echo installing php failed. Please fix yum/up2date.
	exit
fi

rm -f program-install.zip
wget https://github.com/taidos/hypervm-taidos/raw/main/files/temp/program-install.zip
rpm -Uvh https://github.com/taidos/hypervm-taidos/raw/main/files/rpm/libc-client-2007f-16.el7.x86_64.rpm
rpm -Uvh https://github.com/taidos/hypervm-taidos/raw/main/files/rpm/libdb4-4.8.30-13.el7.x86_64.rpm
rpm -Uvh https://github.com/taidos/hypervm-taidos/raw/main/files/rpm/libmcrypt-2.5.8-13.el7.x86_64.rpm
rpm -Uvh https://github.com/taidos/hypervm-taidos/raw/main/files/rpm/hypervm-core-lighttpd-1.4.54-1.el7.x86_64.rpm

export PATH=/usr/sbin:/sbin:$PATH
unzip -oq program-install.zip
cd program-install/hypervm-linux
php ~/program-install/lxins.php --install-type=master $* | tee hypervm_install.log
