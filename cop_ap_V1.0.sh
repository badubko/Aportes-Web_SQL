# !/bin/bash

HOST=$(hostname)
if [ ${HOST} != "badubko-Ub160403GN" ]
then
 echo "Estas en el host equivocado!: ${HOST}"
 exit
fi
 
 echo
#cp -v -u index_ap_V1.0.php  /var/www/html
#cp -v -u create_ap_V1.0.php  /var/www/html
#cp -v -u read_ap_V1.0.php /var/www/html

#cp -v -u common_ap_V1.0.php config_ap_V1.0.php  /var/www/html


cp -v -u *.php *.sh /var/www/html

cp -v -u ./data/* /var/www/html/data
cp -v -u ./css/* /var/www/html/css
cp -v -u ./templates/* /var/www/html/templates
echo
