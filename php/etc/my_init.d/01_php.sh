#!/bin/bash
PHP_VERSION="${PHP_VERSION:-}"

set -e

/usr/sbin/service php${PHP_VERSION}-fpm start
