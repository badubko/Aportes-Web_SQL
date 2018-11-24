# !/bin/bash
echo
cp -v -u index.php  /var/www/html
cp -v -u create.php  /var/www/html
cp -v -u read.php /var/www/html
cp -v -u install.php /var/www/html
cp -v -u ej2_V1.0.php /var/www/html

cp -v -u common.php config.php  /var/www/html
cp -v -u ./css/* /var/www/html/css
cp -v -u ./templates/* /var/www/html/templates
cp -v -u ./data/* /var/www/html/data

echo
