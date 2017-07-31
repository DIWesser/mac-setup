#!/bin/bash
# This is a chrome installation script.
# It has not yet been tested and was made mostly by memory on a Linux box.

# Make sure extra files end up where you will find them
cd ~/Desktop

# Download Chrome .dmg
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

# Open/mount .dmg
hdiutil mount googlechrome.dmg

# Move .app to /Applications
cp '/Volumes/Google Chrome/Google Chrome.app' '/Applications'

# Unmount .dmg
hdiutil unmount /Volumes/Google\ Chrome

# Remove .dmg
rm googlechrome.dmg
