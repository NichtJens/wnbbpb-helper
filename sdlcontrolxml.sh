#!/bin/bash

output="sdl-controls.xml"


dirbutton_width=50

screen_width=1024
screen_height=600
topbar_height=26
panel_width=142

main_width=$screen_width-$panel_width
main_height=$screen_height-$topbar_height

scancode_up=273
scancode_down=274
scancode_right=275
scancode_left=276
scancode_esc=27



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
addcomment up;            addkey   $dirbutton_width               $topbar_height                    $main_width-$dirbutton_width-$dirbutton_width   $dirbutton_width                $scancode_up
addcomment down;          addkey   $dirbutton_width               $screen_height-$dirbutton_width   $main_width-$dirbutton_width-$dirbutton_width   $dirbutton_width                $scancode_down
addcomment right;         addkey   $main_width-$dirbutton_width   $topbar_height                    $dirbutton_width                                $screen_height-$topbar_height   $scancode_right
addcomment left;          addkey   0                              $topbar_height                    $dirbutton_width                                $screen_height-$topbar_height   $scancode_left

addcomment touchareas
addcomment top bar;       addtouch 0                              0                                 $main_width                                     $topbar_height
addcomment main window;   addtouch $dirbutton_width               $topbar_height+$dirbutton_width   $main_width-$dirbutton_width-$dirbutton_width   $main_height-$dirbutton_width-$dirbutton_width
addcomment right boxes;   addtouch $main_width                    $topbar_height                    $panel_width                                    $main_height

addcomment escape button; addkey   $main_width                    0                                 $panel_width                                    $topbar_height                  $scancode_esc

addfooter





