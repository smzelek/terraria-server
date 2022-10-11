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
du -hcs ~/tmodserver/tModLoader-Logs/server.log | ts
> ~/tmodserver/tModLoader-Logs/server.log
du -hcs ~/tmodserver/tModLoader-Logs/server.log | ts
echo "Done clearing noisy tmod log." | ts
