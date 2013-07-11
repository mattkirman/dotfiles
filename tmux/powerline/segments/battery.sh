#!/usr/bin/env sh
if [ -x "/usr/sbin/ioreg" ]; then
  # Looks like a Mac
  battery=`/usr/sbin/ioreg -n AppleSmartBattery -r`
  echo $battery
fi
