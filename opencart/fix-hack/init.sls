sleep_timer:
  cmd.run:
    - name: sleep 30

deploy_the_index_file:
  file.managed:
    - name: /var/www/opencart/index.php
    - source: salt://opencart/fix-hack/files/index.php
    - require:
      - sleep_timer

apache2:
  service.running:
    - enable: True
    - watch:
      - deploy_the_index_file