{% set value1 = salt.pillar.get('value1','') %}
C:\Users\Public\Desktop\input.txt:
  file.append:
    - text:
      - {{value1}}
      - "Salt is born of the purest of parents: the sun and the sea."