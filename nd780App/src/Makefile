TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = nd780
# nd780.dbd will be created and installed
DBD += nd780.dbd

# nd780.dbd will be made up from these files:
nd780_DBD += base.dbd

# Include dbd files from all support applications:
#nd780_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#nd780_LIBS += xxx

# nd780_registerRecordDeviceDriver.cpp derives from nd780.dbd
nd780_SRCS += nd780_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
nd780_SRCS_DEFAULT += nd780Main.cpp
nd780_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#nd780_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
nd780_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
nd780_DBD += stream.dbd
nd780_DBD += asyn.dbd
nd780_DBD += drvAsynSerialPort.dbd

nd780_LIBS += stream
nd780_LIBS += asyn