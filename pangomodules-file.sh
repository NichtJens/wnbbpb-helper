#!/bin/bash

# Script to create pango.modules files
# as I did not understand how to do that with pango-querymodules
# https://github.com/asimonov-rim/wesnoth/issues/1


HOSTDIR="/usr/lib/x86_64-linux-gnu"
TARGETDIR="app/native/lib"

# Loop over list of files compiled for PB
# Get corresponding entry from host
# Adjust path from host to PB

for f in ../install/lib/pango/1.6.0/modules/*; do
  pango-querymodules |\
  grep $(basename $f) |\
  sed "s!^$HOSTDIR!$TARGETDIR!"
done


# Output should be piped into file:
# workspace/install/etc/pango/pango.modules
# This file must be copied to the folder:
# app/native/etc/pango/

# The directory:
# workspace/install/lib/pango
# should go to:
# app/native/lib/



echo "Run this as:" >&2
echo "$0 > ../install/etc/pango/pango.modules" >&2



