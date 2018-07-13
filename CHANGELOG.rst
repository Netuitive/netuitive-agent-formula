netuitive-agent formula
================

0.1.4 (2018-07-13)

- Fix for Heartbeat Collector config

0.1.3 (2017-01-26)

- Sync collector conf files with main Netuitive Agent

0.1.3 (2016-11-07)

- Fixed nested collector script to avoid nesting errors
- If no nested collector tree is found, it will skip it

0.1.2 (2016-11-02)

- Added killswitch for missing api_key, or if we cannot detect the netuitive-agent pillar

0.1.1 (2016-10-28)

- Added support for Redhat, CentOS, and Fedora
- Added support for SNMPCollector, SNMPInterfaceCollector, and ProcessResourcesCollector

0.1.0 (2016-10-28)

- Initial version
- The following collectors are not functional yet due to nesting issues: SNMPCollector, SNMPInterfaceCollector, and ProcessResourcesCollector
