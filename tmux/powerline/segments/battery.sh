#!/usr/bin/env bash
bar() {
  case $1 in
    0)
      echo -n "#[fg=red]"
      echo -n '▁';;

    1)
      echo -n "#[fg=red]"
      echo -n '▂';;

    2)
      echo -n "#[fg=red]"
      echo -n '▃';;

    3)
      echo -n "#[fg=yellow]"
      echo -n '▄';;

    4)
      echo -n "#[fg=yellow]"
      echo -n '▅';;

    5)
      echo -n "#[fg=green]"
      echo -n '▆';;

    6)
      echo -n "#[fg=green]"
      echo -n '▇';;

    7)
      echo -n "#[fg=green]"
      echo -n '█';;

    *)
      echo -n ' ';;

  esac
}


if [ -x "/usr/sbin/ioreg" ]; then
  # Looks like a Mac
  if [ `/usr/sbin/ioreg -n AppleSmartBattery -r | grep ExternalConnected | awk '{print $3}'` == "Yes" ]; then
    if [ `/usr/sbin/ioreg -n AppleSmartBattery -r | grep IsCharging | awk '{print $3}'` == "Yes" ]; then
      echo -n "#[fg=green]\xE2\x9A\xA1\xEF\xB8\x8E "
    elif [ `/usr/sbin/ioreg -n AppleSmartBattery -r | grep FullyCharged | awk '{print $3}'` == "No" ]; then
      echo -n "#[fg=red]\xE2\x9A\xA1\xEF\xB8\x8E "
    fi
  fi

  battery_charge=-1

  if [ `/usr/sbin/ioreg -n AppleSmartBattery -r | grep FullyCharged | awk '{print $3}'` == "Yes" ]; then
    battery_charge=7
  else
    max_capacity=`/usr/sbin/ioreg -n AppleSmartBattery -r | grep MaxCapacity | awk '{print $3}'`
    current_capacity=`/usr/sbin/ioreg -n AppleSmartBattery -r | grep CurrentCapacity | awk '{print $3}'`

    battery_charge=$((current_capacity / max_capacity))
    battery_charge=$((battery_charge * 7))
  fi

  bar $battery_charge
fi
