#Monitor /usr/share/nginx/html/index.html for changes.
inotify_install:
  pkg.installed:
    - name: inotify-tools

html_beacon:
  beacon.present:
    - name: inotify
    - save: True
    - enable: True
    - disable_during_state_run: True
    - files:
       /usr/share/nginx/html/index.html:
         mask:
           - create
           - delete
           - modify
    - require:
      - pkg: inotify_install