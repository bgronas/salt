# configure firewalld ports

public:
  firewalld.present:
    - name: public
    - ports:
      - 8080/tcp
    - prune_ports: True