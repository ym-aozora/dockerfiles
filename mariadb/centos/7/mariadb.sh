#!/bin/sh

# TODO: 外から受け付けられるようにしたい...
PW_ROOT='any root password'
PW_USER='any user password'

mysqld_safe &

cat /var/log/mariadb/mariadb.log

mysqladmin --silent --wait=30 ping || exit 1

mysql -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$PW_ROOT');"
mysql -u root -p$PW_ROOT -e "SET PASSWORD FOR 'root'@'127.0.0.1'=PASSWORD('$PW_ROOT');"
mysql -u root -p$PW_ROOT -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -p$PW_ROOT -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
mysql -u root -p$PW_ROOT -e "DROP DATABASE test;"
mysql -u root -p$PW_ROOT -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
mysql -u root -p$PW_ROOT -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PW_USER';"
mysql -u root -p$PW_ROOT -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY '$PW_USER';"
mysql -u root -p$PW_ROOT -e "FLUSH PRIVILEGES;"
