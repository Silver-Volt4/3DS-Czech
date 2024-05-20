# Custom 3DS Operating System translation

This repository is a proof-of-concept translation of the 3DS's OS.
Currently this repo contains modifications of the Home Menu, Friends List, Notifications, Game Notes and Electronic Manual applets.

Luma3DS _cannot_ patch system applets at this time, so they have to be rebuilt to use the translations.
This sadly causes random crashes in the 3DS's home menu. Machine code is like Chinese to me and I can't figure out know what causes the crashes.
Therefore, I do not consider this project mature enough for day-to-day use.
However, if system applet patching were to be introduced to Luma3DS, this repository could be very easily tweaked to support it.

This repository contains string tables for the Home Menu, Friends List, Notifications, Game Notes and Electronic Manual applets, translated into Czech. Each is stored in a separate directory.
Use [Kuriimu1](https://github.com/IcySon55/Kuriimu/releases) to edit these .msbt files.

To build patched CIAs, you must extract the titles from a European 3DS and place them in the `cias` directory.
You must also obtain `ctrtool`, `makerom` ([get them here](https://github.com/3DSGuy/Project_CTR/releases)) and `3dstool` ([get it here](https://github.com/dnasdw/3dstool/releases)).
Place those in the `tools` directory. Finally, the build scripts only support unix shells (bash, zsh etc) so to run the build scripts on Windows you will need WSL or MinGW.
The modified files will be sent to `out`. Encrypt the CIAs using GodMode9 before installing.

Again, the modified CIAs _will_ cause random crashes. You are responsible for any damage that happens to your 3DS. You **must** create a backup of your NAND before proceeding.
