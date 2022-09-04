base:
  '*':
    - presence
    
  '( G@os:Ubuntu and G@webserver:apache ) or ( G@os:CentOS and G@webserver:apache )':
    - match: compound
    - apache
    
  '( G@os:Ubuntu and G@webserver:apache ) or ( G@os:CentOS and G@webserver:nginx )':
    - match: compound
    - nginx