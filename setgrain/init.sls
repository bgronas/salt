{% set key_1 = salt.pillar.get('key1','') %}
{% set value_1 = salt.pillar.get('value1','') %}
{% set key_2 = salt.pillar.get('key2','') %}
{% set value_2 = salt.pillar.get('value2','') %}
{% set key_3 = salt.pillar.get('key3','') %}
{% set value_3 = salt.pillar.get('value3','') %}
{% set key_4 = salt.pillar.get('key4','') %}
{% set value_4 = salt.pillar.get('value4','') %}
{% set key_5 = salt.pillar.get('key5','') %}
{% set value_5 = salt.pillar.get('value5','') %}
{% set key_6 = salt.pillar.get('key6','') %}
{% set value_6 = salt.pillar.get('value6','') %}
{% set key_7 = salt.pillar.get('key7','') %}
{% set value_7 = salt.pillar.get('value7','') %}
{% set key_8 = salt.pillar.get('key8','') %}
{% set value_8 = salt.pillar.get('value8','') %}
{% set key_9 = salt.pillar.get('key9','') %}
{% set value_9 = salt.pillar.get('value9','') %}
{% set key_10 = salt.pillar.get('key10','') %}
{% set value_10 = salt.pillar.get('value10','') %}


{% set custom_grains =({key_1:value_1,key_2:value_2,key_3:value_3,key_4:value_4,key_5:value_5,key_6:value_6,key_7:value_7,key_8:value_8,key_9:value_9,key_10:value_10}) %}

{% for key, value in custom_grains.items() %}
{% if key|length %}
append_grains_{{key}}:
   grains.present:
     - name: {{key}}
     - value: {{value}}
{% endif %}
{% endfor %}


high:
  module.run:
    - name: state.apply
    - require:
      {% for key, value in custom_grains.items() %}
      {% if key|length %}
        - append_grains_{{key}}
      {% endif %}
      {% endfor %}