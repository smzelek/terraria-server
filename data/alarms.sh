#!/bin/bash

DISK_USAGE=$(df -kh --output=pcent /dev/root | sed 1d | tr -d '% ')
aws cloudwatch put-metric-data --metric-name DiskUsage --namespace Terraria --value ${DISK_USAGE}
if [ $DISK_USAGE -gt 90 ]; then
    echo "[terraria-server-disk:ALARM]  Disk usage of ${DISK_USAGE}% exceeds threshold of 90%." | ts
else 
    echo "[terraria-server-disk:OK]     Disk usage of ${DISK_USAGE}% is below threshold of 90%." | ts
fi

TERRARIA_DOWN=$(&>/dev/null tmux has-session -t terraria; echo $?)
aws cloudwatch put-metric-data --metric-name ServerDown --namespace Terraria --value ${TERRARIA_DOWN}
if [ $TERRARIA_DOWN -eq 1 ]; then
    echo "[terraria-server-down:ALARM]  No session found for Terraria Server." | ts
else
    echo "[terraria-server-down:OK]     Terraria Server is running." | ts
fi
