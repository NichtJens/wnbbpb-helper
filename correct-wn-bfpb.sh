#!/bin/bash

# Correct a typo(?) in the Wesnoth build script.

sed -i 's!$(PWD)!$PWD!g' ../wesnoth/build_for_playbook.sh



