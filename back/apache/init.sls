{% import_yaml 'apache/map.yaml' as osmap %}
{% set apache = salt['grains.filter_by'](osmap) %}

install_apache: 
  pkg.installed:
    - name: {{ apache.name }}

configure_apache: 
  file.managed:
    - name: {{ apache.httpfile }}
    - source: {{ apache.source_httpfile }}
    - template: jinja
    - require:
      - pkg: install_apache
    - defaults:
        admin_email: {{ apache.admin_email }}
        group: {{ apache.group }}
        http_port: {{ apache.http_port }}
        user: {{ apache.user }}

public:
  firewalld.present:
    - name: public
    - ports:
      - {{ apache.http_port }}/tcp

start_apache:
  service.running:
    - name: {{ apache.name }}
    - enable: True
    - watch:
      - file: configure_apache