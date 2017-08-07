#!/bin/bash
# This is a chrome installation script for macOS.
# This script has not been fully tested.

# Make sure extra files end up where you will find them
cd ~/Desktop

# Download .zip file
curl -L -o atom-mac.zip https://atom.io/download/mac

# Open .zip file
unzip atom-mac.zip

# Move .app to /Applications
mv 'Atom.app' '/Applications/Atom.app'

# Remove .dmg
rm atom-mac.zip
