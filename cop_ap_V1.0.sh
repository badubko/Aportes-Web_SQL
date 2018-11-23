# !/bin/bash
echo
cp -v -u index_ap_V1.0.php  /var/www/html
cp -v -u create_ap_V1.0.php  /var/www/html
cp -v -u read.php /var/www/html

cp -v -u common_ap_V1.0.php config_ap_V1.0.php  /var/www/html
cp -v -u ./css/* /var/www/html/css
cp -v -u ./templates/* /var/www/html/templates
echo
