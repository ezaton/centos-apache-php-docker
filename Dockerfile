FROM centos:centos5

RUN rm -f /etc/yum.repos.d/*
COPY vault.repo /etc/yum.repos.d/
RUN yum update -y && \
     yum install -y httpd php php-bcmath php-gd php-mbstring php-mysql php-odbc php-pdo \
     php-pear php-pear-Mail php-xml php-mssql php-soap php-pear-DB php-pear-MDB2-Driver-mysql \
     php-mcrypt php-dba php-pear-Net-URL php-pear-File php-tidy php-mhash php-pecl-Fileinfo \
     php-pear-Auth-SASL php-pear-HTTP-Request php-pear-Net-Sieve php-devel php-pear php-imap \
     php-imap php-readline php-ldap php-xmlrpc php-ncurses php-pear-Net-Socket php-pear-Net-SMTP \
     php-pear-Mail php-pecl-memcache php-pear-MDB2 php-pear-Date php-pear-Log php-gd \
     php-pear-Mail-Mime php-snmp
# Add cron
RUN yum install -y vixie-cron

# Custom config, with ErrorLog and CustomLog directed at stderr and stdout
COPY httpd.conf /etc/httpd/conf/

# Expose port 80
EXPOSE 80

# Start Apache with PHP
CMD ["apachectl", "-D", "FOREGROUND"]
