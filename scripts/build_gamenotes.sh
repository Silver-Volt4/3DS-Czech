set -e
cd ../build
rm -rf *
cp "../cias/0004003000009C02 Game Notes (CTR-N-HGMP) (E) (v4.0.0).standard.cia" subject.cia
./../tools/ctrtool --contents=contents subject.cia
./../tools/ctrtool --exheader=exheader.bin --exefs=exefs.bin --romfsdir=romfs --logo=logo.bcma.lz --plainrgn=plain.bin contents.0000.00000007
./../tools/3dstool -xvtf cxi contents.0000.00000007 --header ncchheader.bin
./../tools/3dstool -xvtf exefs exefs.bin --exefs-dir exefs --header exefsheader.bin
cp ../GameNotes/GameNotes.msbt romfs/lang/EU_English/message.msbt
cp ../GameNotes/Hud.msbt romfs/lang/EU_English/hud.msbt
./../tools/3dstool -cvtf romfs romfs.bin --romfs-dir romfs/
./../tools/3dstool -cvtf cxi game.cxi --header ncchheader.bin --exh exheader.bin --logo logo.bcma.lz --plain plain.bin --exefs exefs.bin --romfs romfs.bin
./../tools/makerom -f cia -o output.cia -content game.cxi:0:0
mv output.cia ../out/GameNotes_Patched.cia
rm -rf *