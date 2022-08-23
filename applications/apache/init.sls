# Install and configure Apache HTTPD on CentOS/RHEL
# Deploy Beacon with prerequisites to monitor file /var/www/html/index.php

# Prerequisites for Beacons

install_epel_pip:
  pkg.installed:
    - pkgs: 
      - epel-release
      - python2-pip
    - reload_modules: True

install_inotify:
  pip.installed:
    - name: pyinotify
    - bin_env: /usr/bin/python
    - require:
      - pkg: install_epel_pip

# Install and configure Apache HTTPD

install_apache:
  pkg.installed:
    - pkgs:
      - httpd
      - php

configure_apache:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://applications/apache/files/httpd.conf
    - template: jinja
    - require:
      - pkg: install_apache
    - defaults:
        admin_email: user@host.org
        group: apache
        user: apache
        http_port: 80

# Deploy sample web page

configure_web_page:
  file.managed:
    - name: /var/www/html/index.php
    - source: salt://applications/apache/files/index.php
    - require:
      - pkg: install_apache

# Deploy Beacons

deploy_beacons_file:
  file.managed:
    - name: /etc/salt/minion.d/beacons.conf
    - source: salt://applications/apache/files/beacons.conf
    - makedirs: True

# Restart Apache HTTPD and Salt Minion processes upon respective config files are updated

restart_salt-minion:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - deploy_beacons_file

start_apache:
  service.running:
    - name: httpd
    - enable: True
    - watch:
      - file: configure_apache
