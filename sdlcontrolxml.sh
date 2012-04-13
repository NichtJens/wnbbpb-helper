#!/bin/bash

output="sdl-controls.xml.test"

scancode_up=273
scancode_down=274
scancode_right=275
scancode_left=276
scancode_esc=27

screen_width=1024
screen_height=600
dirbutton_width=20
topbar_height=26



function tofile()
{
    echo "$@"
    echo "$@" >> $output
}

function evaluate()
{
    for arg in $@; do
        echo $(($arg))
    done
}

function addheader()
{
    tofile '<?xml version="1.0" encoding="ISO-8859-1"?>'
    tofile '<emulation version="1">'
}

function addfooter()
{
    tofile '</emulation>'
}

function addcomment()
{
    tofile '<!-- '$@' -->'
}

function addkeyh()
{
    tofile '<key x="'$1'" y="'$2'" width="'$3'" height="'$4'" sym="'$5'" scancode="'$5'"/>'
}

function addtouchh()
{
    tofile '<touchscreen x="'$1'" y="'$2'" width="'$3'" height="'$4'"/>'
}

function addkey()
{
    addkeyh $(evaluate $@)
}

function addtouch()
{
    addtouchh $(evaluate $@)
}





rm $output



addheader

addcomment direction buttons
addcomment up;            addkey    20  26 842  20 $scancode_up
addcomment down;          addkey    20 580 842  20 $scancode_down
addcomment right;         addkey   862  26  20 574 $scancode_right
addcomment left;          addkey     0  26  20 574 $scancode_left

addcomment touchareas
addcomment top bar;       addtouch   0   0 882  26
addcomment main window;   addtouch  20  46 842 534
addcomment right boxes;   addtouch 882  26 142 574

addcomment escape button; addkey   882   0 142  26 $scancode_esc

addfooter





