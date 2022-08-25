# This State file ensure all systems have default directory according to company policy

# Ensure default directory is there
create_standard_directory:
 file.directory:
   - name: {{ pillar['path'] }}
   - user: {{ pillar['user'] }}
   - group: {{ pillar['group'] }}
   - mode: {{ pillar['mode'] }}