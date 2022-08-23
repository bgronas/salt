#/2-tier-opencart/update.sls
ubuntu_update:
  cmd.run:
    - name: sudo -H apt-get update -y