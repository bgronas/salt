export DEBIAN_FRONTEND=noninteractive
USER=demouser
PASS=VMware1!
echo $USER:$PASS | /usr/sbin/chpasswd
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service ssh reload
git clone https://github.com/larols/opencart-demo.git /tmp/opencart
sleep 10
mv /tmp/opencart /var/www/
chown -R www-data.www-data /var/www/opencart
chmod -R 775 /var/www/opencart
tee /etc/apache2/sites-available/opencart.conf > /dev/null << EOF
<VirtualHost *:80>
  ServerName www.opencart.cmbu.local
  DocumentRoot /var/www/opencart
  <Directory /var/www/opencart/>
    AllowOverride All
    allow from all
  </Directory>
</VirtualHost>
EOF
cd /etc/apache2/sites-available/
a2ensite opencart.conf
a2dissite 000-default.conf
systemctl reload apache2
systemctl restart apache2
export ip4=$(hostname -I)
export dbip=$(cat /tmp/dbip.txt)
sed -i "s/frontendiphere/$ip4/g" /var/www/opencart/config.php
sed -i "s/dbiphere/$dbip/g" /var/www/opencart/config.php
sed -i "s/usernamehere/$USER/g" /var/www/opencart/config.php
sed -i "s/passwordhere/$PASS/g" /var/www/opencart/config.php
sed -i "s/frontendiphere/$ip4/g" /var/www/opencart/admin/config.php
sed -i "s/dbiphere/$dbip/g" /var/www/opencart/admin/config.php