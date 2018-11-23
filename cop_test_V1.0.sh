# !/bin/bash
echo
cp -v -u index.php  /var/www/html
cp -v -u create.php  /var/www/html
cp -v -u read.php /var/www/html

cp -v -u common.php config.php  /var/www/html
cp -v -u ./css/* /var/www/html/css
cp -v -u ./templates/* /var/www/html/templates
echo
