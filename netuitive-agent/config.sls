# -*- coding: utf-8 -*-
# vim: ft=sls

{% set netuitive_agent = salt['pillar.get'] %}


# Set up the collectors

{%- set collectors = [] %}
{%- for k, v in pillar['netuitive_agent']['collectors'].iteritems() %}
# Create the file name based on the pillar key file
/opt/netuitive-agent/conf/collectors/{{k}}.conf:
  file.managed:
    - user: root
    - group: root
    - template: jinja
    - mode: 600
    # Loop through each of the values in the pillar for each collector, write them correctly to file
    - contents: |
        {{pillar['netuitive_agent']['file_warning']}}
        {%- for ck, cv in v.iteritems()|sort %}
        {{ ck }} = {{ cv }}
        {%- endfor %}
{%- endfor %}

# Set up the nested collectors

{% if pillar['netuitive_agent']['nestedcollectors'] is defined %}
{%- set nestedcollectors = [] %}
{%- for k, v in pillar['netuitive_agent']['nestedcollectors'].iteritems() %}
# Create the file name based on the pillar key file
/opt/netuitive-agent/conf/collectors/{{k}}.conf:
  file.managed:
    - user: root
    - group: root
    - template: jinja
    - mode: 600
    # This is a special handler for the nesting, to which newlines must be minimized
    - contents: |
        {{pillar['netuitive_agent']['file_warning']}}{%- for ck, cv in v.iteritems() %}
        {{ ck }}{% if k == "ProcessResourcesCollector" %}{%- for wk, wv in cv.iteritems() %}
        {{ wk }} = {{ wv }}{%- endfor %}{% else %}{%- for wk, wv in cv.iteritems() %}
        {{ wk }}{%- for xk, xv in wv.iteritems()|sort %}
        {{ xk }} = {{ xv }}{%- endfor %}{%- endfor %}{% endif %}{%- endfor %}
{%- endfor %}
{% endif %}

# Set the API key

netuitive-api-key:
  file.replace:
    - name: /opt/netuitive-agent/conf/netuitive-agent.conf
    - pattern: "api_key = .*"
    - repl: "api_key = {{ pillar['netuitive_agent']['api_key'] }}"
    - count: 1
    - watch:
      - pkg: netuitive-agent