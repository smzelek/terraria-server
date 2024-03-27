# Steve's Terraria tMod Server :)

## Setup
1. Download access PEMs from Google Drive and chmod to 400
2. Make sure personal profile is setup via AWS cli
3. Install `terraria` and `tModLoader`
4. Download desired mods:
    * Calamity Mod
    * Calamity Mod Music
    * Thorium
    * Among Us Vanity Items
    * Boss Cursor
    * Ore Excavator
    * Recipe Browser
    * Magic Storage
    * WMITF
    * Fargo's Souls
    * Fargo's Mutants
    * Level+
    * Bags
5. Create a world locally
6. Create a `.env` file from `example.env`, fill in Create Server Vars
7. Run `./scripts/create_server.sh`
8. Copy mods into `mods/` folder and same for `worlds/`
9. Fill in Upload Data Vars in `.env`
10. Run `./scripts/upload_data.sh all`
11. Run `./scripts/ssh.sh`
    *  Run `1_setup.sh`
    *  Run `2_install.sh`
    *  Run `3_run.sh`

Enjoy!
