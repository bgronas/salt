# Name: nginx.sls
# Description: install nginx server on CentOS and Ubuntu
# installs nginx and ensures it's started

nginx_install:
  pkg.installed:
   - name: nginx

nginx_restart_service:
  service.running:
    - name: nginx
    - require:
      - pkg: nginx_install