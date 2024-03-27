set -e
cd ../build
rm -rf *
cp "../cias/0004003000009B02 Instruction Manual (CTR-N-HMVP) (E) (v5.0.0).standard.cia" subject.cia
./../tools/ctrtool --contents=contents subject.cia
./../tools/ctrtool --exheader=exheader.bin --exefs=exefs.bin --romfsdir=romfs --logo=logo.bcma.lz --plainrgn=plain.bin contents.0000.0000000a
./../tools/3dstool -xvtf cxi contents.0000.0000000a --header ncchheader.bin
./../tools/3dstool -xvtf exefs exefs.bin --exefs-dir exefs --header exefsheader.bin
cp ../Manual/Manual.msbt romfs/message/EU_English/ebird.msbt
./../tools/3dstool -cvtf romfs romfs.bin --romfs-dir romfs/
./../tools/3dstool -cvtf cxi game.cxi --header ncchheader.bin --exh exheader.bin --logo logo.bcma.lz --plain plain.bin --exefs exefs.bin --romfs romfs.bin
./../tools/makerom -f cia -o output.cia -content game.cxi:0:0
mv output.cia ../out/Manual_Patched.cia
rm -rf *