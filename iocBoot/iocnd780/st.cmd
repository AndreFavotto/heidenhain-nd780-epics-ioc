#!../../bin/linux-x86_64/nd780

#- You may have to change nd780 to something else
#- everywhere it appears in this file

< envPaths
epicsEnvSet ("STREAM_PROTOCOL_PATH","$(TOP)/nd780App/Db")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/nd780.dbd"
nd780_registerRecordDeviceDriver pdbbase

# connect to the device serially
drvAsynSerialPortConfigure("nd780","/dev/ttyUSB1")
asynSetOption ("nd780", 0, "baud", "115200")
asynSetOption ("nd780", 0, "parity", "even")
asynSetOption ("nd780", 0, "stop", "2")

## Load record instances
dbLoadRecords "nd780App/Db/nd780.db", "user=andrefavotto"



## Load record instances
#- Set this to see messages from mySub
#var mySubDebug 1

#- Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=andrefavoto"
