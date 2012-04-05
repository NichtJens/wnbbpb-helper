#!/bin/bash

# Script to create the pango-modules assests part for
# workspace/wesnoth/projectfiles/qnx/bar-descriptor.xml
# https://github.com/asimonov-rim/wesnoth/issues/1


TARGETDIR="lib/pango/1.6.0/modules"
MODULES="etc/pango/pango.modules"



cd ..
WORKSPACE=$PWD
INSTALLDIR=$WORKSPACE/install
HOSTDIR="$INSTALLDIR/$TARGETDIR"


echo ""

for f in $HOSTDIR/*; do
  name=$(basename $f)
  echo '       <asset path="'$HOSTDIR/$name'" type="Qnx/Elf">'$TARGETDIR/$name'</asset>'
done

echo ""

echo '       <asset path="'$INSTALLDIR/$MODULES'" type="Qnx/Elf">'$MODULES'</asset>'

echo ""



