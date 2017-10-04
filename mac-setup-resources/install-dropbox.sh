#!/bin/bash
# This is a Dropbox installation script for macOS.
# This script has not been fully tested.

# Make sure extra files end up where you will find them
cd ~/Desktop

# Download Chrome .dmg
# Download link works in browser, but not with cURL
#curl -o DropboxInstaller.dmg https://www.dropbox.com/download?plat=mac&full=1

# Open/mount .dmg
#hdiutil mount DropboxInstaller.dmg

# Move .app to /Applications
#cp -r '/Volumes/Google Chrome/Google Chrome.app' '/Applications'

# Unmount .dmg
#hdiutil unmount /Volumes/

# Remove .dmg
#rm 
