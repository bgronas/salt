#This state file reverse the defaults/init.sls

# Ensure default directory is NOT there
delete_standard_directory:
 file.absent:
   - name: {{ pillar['path'] }}