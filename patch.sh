#!/bin/bash

set -e

target="$1"

echo "Patching target: ${target}"

case $target in

  RPi3)
    echo "No patch required"
    ;;

  RPi4)
    # Set RAMLimit to >3GB, requires OS patched for DMA (e.g. Linux kernel >5.8)
    sed -i 's/gRaspberryPiTokenSpaceGuid.PcdRamLimitTo3GB|L"RamLimitTo3GB"|gConfigDxeFormSetGuid|0x0|1/gRaspberryPiTokenSpaceGuid.PcdRamLimitTo3GB|L"RamLimitTo3GB"|gConfigDxeFormSetGuid|0x0|0/g' edk2-platforms/Platform/RaspberryPi/RPi4/RPi4.dsc
    ;;

  *)
    echo "Target unknown. Aborting."
    ;;

esac
