# Set Hostname
set_hostname:
  system.computer_name:
    # This Jinja control structure pulls the id value from the grain of the minion
    - name: {{ grains['id']  }}

join_to_domain:
  system.join_domain:
    - name: vmlab.se
    # This Jinja control structure retrieves the named data objects from the pillar called "ad-join"
    - username: svc-ssc-ad@vmlab.se
    - password: VMware1!
    - restart: True
    - account_ou: OU=ssc,DC=vmlab,DC=se
    # The require statement builds a dependency that prevents a state from executing until all required states execute successfully
    - require: 
      - set_hostname