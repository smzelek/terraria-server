#!/bin/bash

TERRARIA_DOWN=$(&>/dev/null tmux has-session -t terraria; echo $?)
aws cloudwatch put-metric-data --region us-east-1 --metric-name ServerDown --namespace Terraria --value ${TERRARIA_DOWN}
if [ $TERRARIA_DOWN -eq 1 ]; then
    echo "[terraria-server-down:ALARM]  No session found for Terraria Server." | ts '[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    echo "\n----------------------" | ts'[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    echo "Restarting Terraria Server because alarm found it to be offline." | ts'[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    echo "----------------------\n" | ts'[%d-%m-%y %H:%M:%S]' | tee -a terraria.log
    bash ./3_run.sh
else
    echo "[terraria-server-down:OK]     Terraria Server is running." | ts '[%d-%m-%y %H:%M:%S]'
fi
