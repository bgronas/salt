base:
  '*':
    - /config/users
  'G@os:CentOS and G@application:apache':
    - match: compound
    - /applications/apache
  'G@os:CentOS and G@application:nginx':
    - match: compound
    - /applications/nginx
  'G@os:CentOS and G@application:mysql':
    - match: compound
    - /applications/mysql
  'G@os:CentOS and G@application:mongodb':
    - match: compound
    - /applications/mongodb