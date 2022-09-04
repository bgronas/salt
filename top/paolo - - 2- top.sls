#Top file for base environment
'manufacturer:VMware, Inc.':
  - match: grain    # Minions that have a grain set indicating that they are running on VMware vSphere
  - presence   # Apply the state file '/presence/init.sls'

Top file for base environment
'application:mysql':
  - match: grain    # Minions that have a grain set application=opencart
  - mysql   # Apply the state file '/mysql/init.sls'
  
base:
  '*':
    - ssh
    - loginsight
    - user_mgmt
    - rdp
    - patch

role:Docker:
    - match: grain
    - docker

linuxrole:Apache:
    - match: grain
    - apache

linuxrole:PostgreSQL:
    - match: grain
    - PostgreSQL
