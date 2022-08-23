#/2-tier-opencart-db/update.sls
ubuntu_update:
  cmd.run:
    - name: sudo -H apt-get update -y