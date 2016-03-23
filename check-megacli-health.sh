#!/bin/bash

# Check MegaRAID RAID health status with MegaCLI
# Device ID and Slot numbers will be used later to check SMART attributes and RAID rebuild progress status
megacli -PDlist -aALL -NoLog | egrep 'Slot|Device|state' | awk '/Device ID/{if (x)print x;x="";}{x=(!x)?$0:x" -"$0;}END{print x;}' | sed 's/Firmware state://g'

# Check drive SMART Attributes
# Replace $DeviceID with Device ID number and X with drive order
#lsbk
#smartctl -i -d sat+megaraid,$DeviceID /dev/sdX

# Check MegaRAID RAID rebuild progress status
# Replace $EnclosureID and $SlotNumber with Enclosure ID and Slot numbers
#megacli -PDRbld -ShowProg -PhysDrv \[$EnclosureID:$SlotNumber\] -aall
