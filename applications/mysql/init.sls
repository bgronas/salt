# installs mysql server and ensures it's started on RHEL/CentOS
mysql_server_install:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - MySQL-python
  service.running:
    - require:
      - pkg: mysql_server_install 
    - names:
      - mariadb

# create a user -- test it using  mysql -h localhost -u paolo -pVMware1!
create_user_and_grant:
  mysql_user.present:
    - name: paolo
    - host: localhost
    - password: VMware1!
    - requires:
      - mysql_server_install
