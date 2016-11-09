# -*- coding: utf-8 -*-
# vim: ft=sls

{% set netuitive_agent = salt['pillar.get'] %}

service_netuitive_agent:
  service.running:
    - name: netuitive-agent
    - enable: True
    - reload: True