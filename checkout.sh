#!/bin/bash

# Script to checkout everything to build Wesnoth
# following this manual:
# https://github.com/asimonov-rim/wesnoth/issues/1


GITHUB="https://github.com"
GITCLONE="git clone"



REPO[1]="asimonov-rim"

PACKAGES[1]="
boost_headers
boost_program_options
boost_regex
boost_system
boost_iostreams
ogg
vorbis
SDL_image
SDL_mixer
SDL_net
SDL_ttf
pixman
cairo
libffi
glib
pango
"


REPO[2]="blackberry"

PACKAGES[2]="
SDL
TouchControlOverlay
"



cd ..



NREPOS=${#REPO[@]}
for nrepo in $(seq $NREPOS); do
  repo=${REPO[$nrepo]}
  echo -e "\nChecking out from \"$repo\":"

  for pack in ${PACKAGES[$nrepo]}; do
    echo -e "\tCloning: $pack"
    $GITCLONE "$GITHUB/$repo/$pack.git"
  done

done



$GITCLONE "$GITHUB/${REPO[1]}/wesnoth.git" --branch pandafluff





