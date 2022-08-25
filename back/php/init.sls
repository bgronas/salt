######################################################
# Name: php.sls
#
# Description: install PHP5
#
# verified OS: Ubuntu 14.04, CentOS 6.5, 7, openSUSE Leap 42
#
# usage:
# salt <target> state.sls php
#
######################################################
install_php:
  pkg.installed:
    - pkgs:
    {% if grains['os_family'] == 'RedHat' %}
      - php
      - php-mysql
    {% elif grains['os_family'] == 'Debian' %}
      - php5
      - php5-mysql
    {% elif grains['os_family'] == 'Suse' %}
      - php5
      - php5-mysql
      - apache2-mod_php5
    {% endif %}