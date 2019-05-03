FROM slasterix/docker-ubuntu-apache:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y imagemagick graphicsmagick && \
    apt-get install -y libapache2-mod-php7.3 php7.3-bcmath php7.3-bz2 php7.3-cli php7.3-common php7.3-curl php7.3-dba php7.3-gd php7.3-gmp php7.3-imap php7.3-intl php7.3-ldap php7.3-mbstring php7.3-mysql php7.3-odbc php7.3-pgsql php7.3-recode php7.3-snmp php7.3-soap php7.3-sqlite php7.3-tidy php7.3-xml php7.3-xmlrpc php7.3-xsl php7.3-zip php7.3-ssh2 php7.3-redis && \
    apt-get install -y php-gnupg php-imagick php-mongodb php-fxsl && \
    mkdir /tmp/composer/ && \
    cd /tmp/composer && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    cd / && \
    rm -rf /tmp/composer && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apache2ctl -t && \
    mkdir -p /run /var/lib/apache2 /var/lib/php

