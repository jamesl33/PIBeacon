PIBeacon
--------
PIBeacon is a simple command line script to setup a Raspberry PI as an IBeacon.

Usage
-----
Run PIBeacon as root with three commandline arguments:
- ProximityUUID (A unique id that distinguishes your beacon from another)
- Major (Used to group related sets of beacons)
- Minor (Used to identify a beacon within a group)

```sh
# ./PIBeacon.sh DCEF54A2-31EB-467F-AF8E-350FB641C97D 99 0
```

The changes PIBeacon makes are not permanent, the script will need to be run
at boot using either cron or systemd.

Installation
------------
Before installing PIBeacon edit the service file and replace UUID, MAJOR and
MINOR with your chosen settings.

To install and enable PIBeacon at boot run

```sh
sudo make install
```
