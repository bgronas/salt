export DEBIAN_FRONTEND=noninteractive
USER=demouser
PASS=VMware1!
echo $USER:$PASS | /usr/sbin/chpasswd
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service ssh reload
git clone https://github.com/larols/opencart-demo.git /tmp/opencart
echo "demouser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "mysql-server-5.7 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | sudo debconf-set-selections
echo "[client]" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "user=root" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "password=root" >> /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i 's/#slow/slow/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i 's/#long_query_time/long_query_time/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i 's/bind-address/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql
mysql -u root -e "GRANT ALL ON *.* TO '$USER'@'%' IDENTIFIED BY '$PASS'"
mysql -u root -e 'CREATE DATABASE opencart'
mysql -u root -e 'USE opencart'
mysql -u root -e 'flush privileges'
mysql -u root -e 'source /tmp/opencart/install/opencart.sql'
mysql -u root -e "INSERT INTO oc_user (user_id,user_group_id,username,password,salt,firstname,lastname,email,image,code,ip,status,date_added) VALUES (1,1,'admin','5feaa046f6927df3d744007ec1491dba838f672e','c4wnfrq9J','demo','user','admin@admin.com','none','none','none',1,'2019-01-31 06:29:09')" opencart