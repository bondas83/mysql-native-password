FROM mysql

RUN sed -i '/^\[mysqld\]$/a\default-authentication-plugin=mysql_native_password' /etc/my.cnf