# Install Tomcat on RHEL/CentOS 7

install_tomcat:
  pkg.installed:
    - pkgs: 
      - tomcat
      - tomcat-webapps 
      - tomcat-admin-webapps 
      - tomcat-docs-webapp 
      - tomcat-javadoc
      
configure_users_tomcat:
  file.managed:
    - name: /usr/share/tomcat/conf/tomcat-users.xml
    - source: salt://tomcat/files/tomcat-users.xml
    - require:
      - pkg: install_tomcat

start_tomcat:
  service.running:
    - name: tomcat
    - enable: True
    - requires:
      - install_tomcat