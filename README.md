# EPICS IOC for Heidenhain nd780 Display

## Build IOC
This IOC can be built following standard EPICS build procedure for IOCs.

To build and run this IOC, the following EPICS modules are required:

- Asyn
- StreamDevice
- Calc

Then, the path to these modules must be set at `configure/RELEASE`:

```
....
MODULES = /<path>/<to>/<modules>
ASYN = $(MODULES)/<path>/<to>/<asyn>
STREAM = $(MODULES)//<path>/<to>/<StreamDevice>
CALC = $(MODULES)//<path>/<to>/<calc>
....
EPICS_BASE = /<path>/<to>/<epics>/<base>
....
```
After this, run `make install` from IOCs main directory.

## Run IOC

To execute the IOC, run:

```
cd /iocBoot/iocnd780
./run-nd780.sh -p PORT -P PREFIX1 -R PREFIX2
```

Where:
- `-p PORT`  : serial port to connect to nd780
- `-P PREFIX`: the value of the EPICS `$(P)` macro used to prefix the PV names
- `-R PREFIX`: the value of the EPICS `$(R)` macro used to prefix the PV names

## Run graphical interface

To run the IOC's interface, pydm and it's dependancies must be installed running:

`pip install pydm`

Then, one can run:

`pydm -m 'P=<PREFIX1>, R=<PREFIX2>' nd780.ui`

 Where:
- `-P PREFIX1`: the value of the EPICS `$(P)` macro used to prefix the PV names
- `-R PREFIX2`: the value of the EPICS `$(R)` macro used to prefix the PV names

For now, IOC runs locally, and it is yet to be containerized.
