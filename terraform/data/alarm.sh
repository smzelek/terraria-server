#!/bin/bash

TERRARIA_DOWN=$(&>/dev/null tmux has-session -t terraria; echo $?)
if [ $TERRARIA_DOWN -eq 1 ]; then
    aws cloudwatch put-metric-data --region us-east-1 --metric-name terraria-server-uptime --namespace Terraria --value -1
    echo "[terraria-server-uptime:ALARM]  No session found for Terraria Server." | ts '[%d-%m-%y %H:%M:%S]'
    echo -e "\n----------------------" | ts '[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    echo "Restarting Terraria Server because alarm found it to be offline." | ts '[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    echo -e "----------------------\n" | ts '[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    bash ./3_run.sh
else
    aws cloudwatch put-metric-data --region us-east-1 --metric-name terraria-server-uptime --namespace Terraria --value 1
    echo "[terraria-server-uptime:OK]     Terraria Server is running." | ts '[%d-%m-%y %H:%M:%S]'
fi
