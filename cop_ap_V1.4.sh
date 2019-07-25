# !/bin/bash

HOST=$(hostname)
if [ ${HOST} != "badubko-Ub160403GN"  ||  ${HOST} != "deb9-s10" ]
then
 echo "Estas en el host equivocado!: ${HOST}"
 exit
fi


VERS="V1.4"
 echo
#cp -v -u index_ap_V1.0.php  /var/www/html
#cp -v -u create_ap_V1.0.php  /var/www/html
#cp -v -u read_ap_V1.0.php /var/www/html

#cp -v -u common_ap_V1.0.php config_ap_V1.0.php  /var/www/html


cp -v -u *${VERS}.php *${VERS}.sh /var/www/html
cp -v -u ./VOLs/*${VERS}.php  /var/www/html/VOLs
cp -v -u ./OSCs/*${VERS}.php  /var/www/html/OSCs
cp -v -u ./PROY/*${VERS}.php  /var/www/html/PROY

cp -v -u ./data/* /var/www/html/data
cp -v -u ./css/* /var/www/html/css
cp -v -u ./templates/* /var/www/html/templates
echo
