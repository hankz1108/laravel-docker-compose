### Header ################################################################################
# DOC: https://github.com/phusion/baseimage-docker/blob/master/README.md
FROM phusion/baseimage:lastest

## Labels
LABEL maintainer="hankz <hankzhong@june1.com.tw>"

## Build-time Variables
ARG TIMEZONE=UTC

## Environment Variables
ENV PHP_VERSION 8.3

## Working Directory
WORKDIR /var/www

# Set debconf to run non-interactively
# RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

## Set the timezone.
RUN echo "${TIMEZONE}" > /etc/timezone
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

# Replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

### Header ################################################################################

## Upgrade and add repository
RUN apt-get update && \
  apt-get upgrade -y && \
  apt install -y software-properties-common && \
  add-apt-repository ppa:ondrej/php

## install tools：
#  net-tools: 包含ifconfig、netstat等工具
#  iputils-ping: 包含ping指令
#  ntp: 網路時間協定工具
RUN apt-get install -y \
  net-tools \
  iputils-ping \
  ntp \
  unzip

## install php
RUN apt-get install -y \
  php${PHP_VERSION}-fpm \
  php${PHP_VERSION}-common \
  php${PHP_VERSION}-mysql \
  php${PHP_VERSION}-xml \
  php${PHP_VERSION}-xmlrpc \
  php${PHP_VERSION}-curl \
  php${PHP_VERSION}-gd \
  php${PHP_VERSION}-imagick \
  php${PHP_VERSION}-cli \
  php${PHP_VERSION}-dev \
  php${PHP_VERSION}-imap \
  php${PHP_VERSION}-mbstring \
  php${PHP_VERSION}-opcache \
  php${PHP_VERSION}-soap \
  php${PHP_VERSION}-zip

## Install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && rm -rf /var/lib/apt/lists/*

COPY etc /etc

### Footer ################################################################################
# 啟動容器時須執行的腳本，按照腳本名稱順序執行，可以用數字作為腳本開頭做排序
# 注意：腳本預設timeout時間為30秒，可以用KILL_PROCESS_TIMEOUT與KILL_ALL_PROCESSES_TIMEOUT兩個環境變數來修改
RUN chmod +x /etc/my_init.d/*

# clear cache.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# init命令，不能修改
CMD ["/sbin/my_init"]
### Footer ################################################################################


####################################
# Supervisor configuration
####################################
COPY /init/supervisor /etc/supervisor
