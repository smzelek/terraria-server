# Steve's Terraria Server :)

TODO:
* enable hibernation during off hours to save $$$
* try to use Fargate instead, need to run in ECS task instead?
* look into running TModLoader in Linux
* add alarms that email me if server goes offline or CPU/Mem/Storage use is too high

## SSH in:
```bash
ssh -i KEY_FILE.pem -v ubuntu@xx.xx.xx.xx
```

## Upload world files:
```bash
scp -i KEY_FILE.pem WORLD.wld ubuntu@xx.xx.xx.xx:~/.local/share/Terraria/Worlds/
``` 
