#!/bin/sh
MakeMenu () {
echo "Select item" ;
echo -e "\t" Install Nginx+php-fpm ;
}
AddNginxRepo () {
file="/etc/yum.repos.d/nginx.repo"
if [ -f "$file" ]
then
	echo " Nginx Repository file found." ;
	echo "Continue..."
else
	touch $file ;
	echo '[Nginx-Official]
name=Official Nginx repository
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1' >> $file ;
	echo "$file Created" ;
	echo "Continue..." ;
fi
}

Ngphp () {
AddNginxRepo ;
yum -y install nginx php-fpm ;
systemctl start nginx;
systemctl enable nginx;
systemctl start  php-fpm
systemctl enable php-fpm
firewall-cmd --zone=public --add-service=http --permanent;
firewall-cmd --zone=public --add-service=https --permanent;
firewall-cmd --reload;
}



while true
do
MakeMenu
read answer
	case $answer in
		0) Ngphp ;;
		*) clear ;;
	esac
done