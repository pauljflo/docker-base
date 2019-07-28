FROM centos:7

RUN yum -y install epel-release http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php72 && \
    yum install -y \
      git \
      wget \
      bzip2 \
      nginx \
      sudo \
      glib2-devel \
      php-fpm \
      php \
      php-devel \
      php-common \
      php-soap \
      php-pear \
      php-phar \
      php-json \
      php-curl \
      php-intl \
      php-json \
      php-mbstring \
      php-mcrypt \
      php-openssl \
      php-xml \
      php-mysql \
      python-setuptools && \
    easy_install pip && \
    pip install supervisor && \
    pip install awscli && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    ln -sf /proc/self/fd/1 /var/log/nginx/access.log && \
    ln -sf /proc/self/fd/2 /var/log/nginx/error.log && \
    ln -sf /proc/self/fd/2 /var/log/php-fpm/error.log && \
    ln -sf /proc/self/fd/2 /var/log/php-fpm/www-error.log && \
    chown -R nginx:nginx /var/log/php-fpm && \
    mkdir /run/php-fpm