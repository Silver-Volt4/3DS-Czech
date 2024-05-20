set -e
mkdir -p ../build
cd ../build
rm -rf *
cp "../cias/0004003000009802 (CTR-N-HMMP).standard.cia" subject.cia
./../tools/ctrtool --contents=contents subject.cia
./../tools/ctrtool --exheader=exheader.bin --exefs=exefs.bin --romfsdir=romfs --plainrgn=plain.bin contents.0000.00000089
./../tools/3dstool -xvtf cxi contents.0000.00000089 --header ncchheader.bin
./../tools/3dstool -xvtf exefs exefs.bin --exefs-dir exefs --header exefsheader.bin
cp ../src/HomeMenu/HomeMenu.msbt romfs/message/EU_English/menu_msbt_LZ.bin
cp ../src/HomeMenu/Hud.msbt romfs/message_hud/EU_English/hud_msbt_LZ.bin
./../tools/3dstool -zf romfs/message/EU_English/menu_msbt_LZ.bin --compress-type lzex
./../tools/3dstool -zf romfs/message_hud/EU_English/hud_msbt_LZ.bin --compress-type lzex
./../tools/3dstool -cvtf romfs romfs.bin --romfs-dir romfs/
./../tools/3dstool -cvtf cxi game.cxi --header ncchheader.bin --exh exheader.bin --plain plain.bin --exefs exefs.bin --romfs romfs.bin
./../tools/makerom -f cia -o output.cia -content game.cxi:0:0
mv output.cia ../out/HomeMenu_Patched.cia
rm -rf *