# Copy the top.sls pillar on the master /srv/pillar directory

copy_top:
  file.managed:
    - name: /srv/pillar/top.sls
    - source: salt://pillar/top.sls

copy_centosdefaults:
  file.managed:
    - name: /srv/pillar/centosdefaults.sls
    - source: salt://pillar/centosdefaults.sls

copy_ubuntudefaults:
  file.managed:
    - name: /srv/pillar/ubuntudefaults.sls
    - source: salt://pillar/ubuntudefaults.sls

copy_windowsdefaults:
  file.managed:
    - name: /srv/pillar/windowsdefaults.sls
    - source: salt://pillar/windowsdefaults.sls