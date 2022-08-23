# Knowledge from https://www.postgresql.org/download/linux/redhat/
# RHEL/CentOS 6, 7 and 8 include PostgreSQL by default 
# RHEL/Rocky Linux/OL 8     -> 13, 12, 10 and 9.6 via modules
# RHEL/CentOS/SL/OL 7       -> 9.2
# RHEL/CentOS/SL/OL 6       -> 8.4

# after installation SSH into the machine and run the following to list all databases
# 1) su - postgres 
# 2) psql 
# 3) \l -- this list all databases
# 4) \q -- this to uit from psql cli

install_postgresql:
  pkg.installed:
    - pkgs: 
      - postgresql-server

first_run_postgresql:
  cmd.run:
    - name: postgresql-setup initdb
    - requires: install_postgresql

start_postgresql:
  service.running:
    - name: postgresql.service
    - enable: True
    - requires:
      - first_run_postgresql