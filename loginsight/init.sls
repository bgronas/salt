{% set allready_installed = salt['grains.get']('loginsight_installed', False) %}
{% if allready_installed == False %}

loginsight_agent_install:
  file.managed:
    {% if grains['os_family'] == 'Debian' %}
    - source: salt://loginsight/agents/VMware-Log-Insight-Agent.deb
    - name: /tmp/liagent-current.deb
    - skip_verify: True
    {% elif grains['os_family'] == 'VMware Photon OS' %}
    - source: salt://loginsight/agents/VMware-Log-Insight-Agent.rpm
    - name: /tmp/liagent-current.rpm
    - skip_verify: True
    {% elif grains['os_family'] == 'Windows' %}
    - source: salt://loginsight/agents/VMware-Log-Insight-Agent.msi
    - name: 'c:\windows\temp\liagent-current.msi'
    - skip_verify: True
    {% endif %}

  cmd.run:
    - names:
      {% if grains['os_family'] == 'Debian' %}
      - dpkg -i /tmp/liagent-current.deb

      {% elif grains['os_family'] == 'VMware Photon OS' %}
      - rpm -q VMware-Log-Insight-Agent || rpm -i /tmp/liagent-current.rpm

      {% elif grains['os_family'] == 'Windows' %}
      - 'c:\windows\temp\liagent-current.msi /quiet'

      {% endif %}

loginsight_agent_configure:
  file.managed:
    {% if grains['os_family'] == 'Windows' %}
    - source: salt://loginsight/liagent.ini
    - name: 'c:\ProgramData\VMware\Log Insight Agent\liagent.ini'
    {% else %}
    - source: salt://loginsight/liagent.ini
    - name: /etc/liagent.ini
    {% endif %}  

set_loginsight:
  grains.present:
    - name: loginsight_installed
    - value: True
    - require:
      - loginsight_agent_configure

{% else %}




loginsight_allready_configured:
  test.configurable_test_state:
    - name: loginsight_installed
    - changes: False
    - result: True
    - comment: Loginsight allready installed

{% endif %}

loginsight_agent_start_service:
  service.running:
    - names:
      {% if grains['os_family'] == 'Windows' %}
      - LogInsightAgentService
      {% else %}
      - liagentd
      {% endif %}