#!/bin/bash

# Script to loop over libraries that are build with
# ./build_for_playbook.sh
# https://github.com/asimonov-rim/wesnoth/issues/1


PACKAGES="
pixman
cairo
libffi
glib
pango
"



cd ..



RETURNTO=$PWD
for p in $PACKAGES; do
  cd $p
  ./build_for_playbook.sh || exit 1
  cd $RETURNTO
done



