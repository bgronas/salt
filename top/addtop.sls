# Copy the top.sls on the master

copy_top:
  file.managed:
    - name: /srv/salt/top.sls
    - source: salt://top/top.sls

restart_master:
  service.running:
    - name: salt-master
    - watch:
      - copy_top