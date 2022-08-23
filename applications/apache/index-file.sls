# State file used to restore the original index.php file

# Need to sleep 20 sec because salt is too fast!!!
sleep_20:
  cmd.run:
    - name: sleep 20

deploy_index_file:
  file.managed:
    - name: /var/www/html/index.php
    - source: salt://applications/apache/files/index.php
    - require:
      - sleep 20

restart_apache:
  service.running:
    - name: httpd
    - enable: True
    - watch:
      - deploy_index_file
