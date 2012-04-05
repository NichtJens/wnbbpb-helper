#!/bin/bash

# Script to get some missing files
# and place them accordingly
# https://github.com/asimonov-rim/wesnoth/issues/1


MISSING="./missing"

LIST="
http://artem.filefest.net/wesnoth/libintl/libintl.h
http://artem.filefest.net/wesnoth/pkgconfig/fontconfig.pc
http://artem.filefest.net/wesnoth/pkgconfig/freetype2.pc
http://artem.filefest.net/wesnoth/pkgconfig/libpng.pc
"



mkdir -p $MISSING

for f in $LIST; do
  wget -P $MISSING -nc $f
done


sed -i "s!QNX_TARGET=/home/asimonov/bbndk-2.0.0-beta3/target/qnx6!QNX_TARGET=$QNX_TARGET!" $MISSING/*.pc


cp $MISSING/*.pc ../install/lib/pkgconfig/
cp $MISSING/libintl.h $QNX_TARGET/usr/include/



