#Disable SSH password authentication on CentOS and Ubuntu
update_sshd_config:
  file.replace:
  - name: /etc/ssh/sshd_config
  - pattern: 'PermitRootLogin yes'
  - repl: 'PermitRootLogin no'

#Restart SSHD  
reload_sshd:
  service.running:
    - name: sshd
    - enable: True
    - reload: True
    - watch:
      - update_sshd_config
