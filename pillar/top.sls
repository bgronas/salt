base:
  'os:CentOS':
    - match: grain
    - centosdefaults
  'os:Ubuntu':
    - match: grain
    - ubuntudefaults
  'os:Windows':
    - match: grain
    - windowsdefaults