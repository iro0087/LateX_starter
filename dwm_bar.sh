#!/bin/sh
while :
do
        xsetroot -name "$(echo CPU_TEMP: $(numfmt --from-unit=K --to-unit=M --format "%8.0f" $(cat /sys/class/thermal/thermal_zone0/temp))°C) | $(echo RAM: $(echo $(numfmt --from-unit=K --to-unit=G --format "%8.1f" $(free | awk '/^Mem:/ {print $3}'))Gi)"/"$(echo $(numfmt --to-unit=M --format "%8.1f" $(free | awk '/^Mem:/ {print $2}'))Gi)) | $(date) | 📢 $(awk -F"[][]" '/Left:/ { print $2}' <(amixer sget Master))"
        sleep 0.1
done

