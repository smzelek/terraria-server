#!/bin/bash
echo "Clearing noisy journal log." | ts '[%d-%m-%y %H:%M:%S]'
du -hcs /var/log/journal/ | ts '[%d-%m-%y %H:%M:%S]'
sudo journalctl --vacuum-size=50M | ts '[%d-%m-%y %H:%M:%S]'
du -hcs /var/log/journal/ | ts '[%d-%m-%y %H:%M:%S]'
echo "Done clearing noisy journal log." | ts '[%d-%m-%y %H:%M:%S]'
