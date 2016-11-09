# Installs apt-transport-https for Debian systems
# that do not currently support apt-get over HTTPS
# This is just a precaution

apt-transport-https:
  pkg.installed:
    - require_in: add-agent-repo-debian


# Adds the Netuitive Agent repo into the sources.list.d
# and adds the GPG key for the installation

add-agent-repo-deb:
  pkgrepo.managed:
    - humanname: Netuitive Agent Debian
    - name: deb http://repos.app.netuitive.com/deb/ stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/netuitive.list
    - gpgcheck: 1
    - key_url: http://repos.app.netuitive.com/netuitive.gpg
    - require_in: netuitive-agent

# Installs the Netuitive Agent

netuitive-agent:
  pkg.installed