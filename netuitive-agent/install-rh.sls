netuitive-agent-repo:
  pkgrepo.managed:
    - name: netuitive-agent-repo
    - humanname: Packages from Netuitive Repository - $basearch
    - baseurl: https://repos.app.netuitive.com/rpm/$basearch/
    - gpgkey: https://repos.app.netuitive.com/RPM-GPG-KEY-netuitive
    - gpgcheck: 1
    - disabled: false

# Installs the Netuitive Agent

netuitive-agent:
  pkg.installed