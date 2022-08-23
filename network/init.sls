linux:
  network:
    enabled: true
    interface:
      eth0:
        enabled: true
        type: eth
        address: 192.168.0.102
        netmask: 255.255.248.0
        gateway: 192.168.0.1
        name_servers:
        - 192.168.6.26
        - 8.8.8.8
        mtu: 1500

