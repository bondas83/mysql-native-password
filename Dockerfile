# Derived from official mysql image (our base image)
FROM mysql

# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./scripts/ /docker-entrypoint-initdb.d/

RUN sed -i '/^\[mysqld\]$/a\default-authentication-plugin=mysql_native_password' /etc/mysql/my.cnf

CMD ["mysqld"]