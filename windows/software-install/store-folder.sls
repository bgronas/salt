{% if not salt['file.directory_exists' ]('C:\store') %}
/home/init_dir:
  file.directory:
    - name:  C:\store\
{% else %}
  cmd.run:
    - name: echo "Directory exists"
{% endif %}