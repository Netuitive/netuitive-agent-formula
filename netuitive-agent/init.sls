# -*- coding: utf-8 -*-
# vim: ft=sls
#  - netuitive-agent.restart_agent

# Check that the netuitive-agent pillar exists and is accessible

{% if pillar['netuitive_agent'] is defined %}

# Ensure that the API key has been modified:

{% if pillar['netuitive_agent']['api_key'] != 'API-KEY-REQUIRED' %}


# If so, continue:

include:
  {% if grains['os'] in ('RedHat', 'CentOS', 'Fedora', 'Amazon') %}
  - netuitive-agent.install-rh
  {% elif grains['os'] == 'Ubuntu' %}
  - netuitive-agent.install-deb
  {% endif %}
  - netuitive-agent.config
  - netuitive-agent.restart_agent

{% else %}

# Notify that the default api_key was detected

echo "-- ERROR -- DEFAULT (NON-FUNCTIONAL) API_KEY DETECTED IN PILLAR, ABORTING":
  cmd.run

{% endif %}

{% else %}

echo "-- ERROR -- CANNOT FIND NETUITIVE-AGENT PILLAR, ABORTING":
  cmd.run

{% endif %}