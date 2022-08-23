# Install MongoDB on CentOS/RHEL

install_mongo_repo:
  pkgrepo.managed:
    - humanname: MongoDB Repository
    - baseurl: https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/
    - enabled: True
    - gpgcheck: 1
    - gpgkey: https://www.mongodb.org/static/pgp/server-4.4.asc

install_mongo:
  pkg.installed:
    - name: mongodb-org
    - requires:
      - install_mongo_repo

start_mongod:
  service.running:
    - name: mongod
    - enable: True
    - requires:
      - install_mongo
