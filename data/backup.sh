#!/bin/bash

echo "Attempting server backup." | ts
tmux send-keys -t terraria "say beep-boop. Backing up the world." C-m | ts
tmux send-keys -t terraria "save" C-m | ts
tmux send-keys -t terraria "say boop-beep. Backup complete." C-m | ts
echo "Server backup complete." | ts 

echo "Deleting old backups." | ts
(cd ~/.local/share/Terraria/tModLoader/Worlds/Backups/; ls -tr | head -n -3 | xargs -t --no-run-if-empty rm | ts)
echo "Deleting old backups complete." | ts

echo "Clearing noisy tmod log." | ts
du -hcs ~/tmodserver/tModLoader-Logs/* | ts
find ~/tmodserver/tModLoader-Logs/server.* -type f -print0 | xargs -0 truncate -s0
du -hcs ~/tmodserver/tModLoader-Logs/* | ts
echo "Done clearing noisy tmod log." | ts

echo "Clearing noisy journal log." | ts
du -hcs /var/log/journal/ | ts
sudo journalctl --vacuum-size=50M | ts
du -hcs /var/log/journal/ | ts
echo "Done clearing noisy journal log." | ts
