# Install NGINX on CentOS/RHEL

install_epel_release:
  pkg.installed:
    - name: epel-release

install_nginx:
  pkg.installed:
    - name: nginx
    - requres:
      - install_epel_release

start_nginx:
  service.running:
    - name: nginx
    - enable: True
    - requires:
      - install_nginx
