# installs postgres db server and ensures it's started on RHEL/CentOS

#install required repos
install_epel_release:
  pkg.installed:
    - name: epel-release

install_postgres_repo:
  pkgrepo.managed:
    - humanname: Postgres Repository
    - baseurl: https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
    - enabled: True
    - gpgcheck: 0
    - gpgkey: https://apt.postgresql.org/pub/repos/yum/RPM-GPG-KEY-PGDG-14

#install postgres 14
install_postgres:
  pkg.installed:
    - name: postgresql14-server
    - requres:
      - install_epel_release
      - install_postgres_repo

#start postgres
start_postgres:
  service.running:
    - name: postgresql-14
    - enable: True
    - requires:
      - install_postgres