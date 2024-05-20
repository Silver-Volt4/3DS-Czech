set -e
mkdir -p ../build
cd ../build
rm -rf *
cp "../cias/000400300000A002 Notifications (CTR-N-HCRP) (E) (v4.0.1).standard.cia" subject.cia
./../tools/ctrtool --contents=contents subject.cia
./../tools/ctrtool --exheader=exheader.bin --exefs=exefs.bin --romfsdir=romfs --logo=logo.bcma.lz --plainrgn=plain.bin contents.0000.00000012
./../tools/3dstool -xvtf cxi contents.0000.00000012 --header ncchheader.bin
./../tools/3dstool -xvtf exefs exefs.bin --exefs-dir exefs --header exefsheader.bin
cp ../src/Notifications/Notifications.msbt romfs/message/EU_English/newslist_msbt_LZ.bin
cp ../src/Notifications/Hud.msbt romfs/message_hud/EU_English/hud_msbt_LZ.bin
./../tools/3dstool -zf romfs/message/EU_English/newslist_msbt_LZ.bin --compress-type lzex
./../tools/3dstool -zf romfs/message_hud/EU_English/hud_msbt_LZ.bin --compress-type lzex
./../tools/3dstool -cvtf romfs romfs.bin --romfs-dir romfs/
./../tools/3dstool -cvtf cxi game.cxi --header ncchheader.bin --exh exheader.bin --logo logo.bcma.lz --plain plain.bin --exefs exefs.bin --romfs romfs.bin
./../tools/makerom -f cia -o output.cia -content game.cxi:0:0
mv output.cia ../out/Notifications_Patched.cia
rm -rf *