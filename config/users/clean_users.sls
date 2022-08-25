#run this state file to clean centos vm after a demo

{% from 'config/users/map.jinja' import users with context %}

{% for user in users %}
delete_user_{{ user.username }}:
  user.absent:
    - name: {{ user.username }}
    - purge: true
    - force: true
{% endfor %}