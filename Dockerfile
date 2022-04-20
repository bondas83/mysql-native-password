# Derived from official mysql image (our base image)
FROM mysql:8.0.24

RUN sed -i '/^\[mysqld\]$/a\default-authentication-plugin=mysql_native_password' /etc/mysql/my.cnf

WORKDIR /var/www/html/
COPY waitForMySQL.sh /var/www/html/
RUN chmod +rwx waitForMySQL.sh

CMD ["mysqld"]