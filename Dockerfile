# Derived from official mysql image (our base image)
FROM mysql

RUN sed -i '/^\[mysqld\]$/a\default-authentication-plugin=mysql_native_password' /etc/mysql/my.cnf

CMD ["mysqld"]