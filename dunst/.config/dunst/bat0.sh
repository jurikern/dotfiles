 #!/bin/sh

CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

[ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -lt 21 ] && \
/usr/bin/notify-send -u critical -a power_supply_low "Low Battery ($CAPACITY%)" "Plug in the charger." || \
echo "Full Battery notification not sent"
