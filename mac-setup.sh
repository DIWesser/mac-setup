#!/bin/bash

#  This profile is a heavily modified version of David Prandzioch's
#  Homebrew based Mac setup script. The script can be found at
#  https://gist.github.com/dprandzioch/84f44e3c271d3c4cf3865969c97244a3
#  and the blog post he wrote about it can be found at 
#  https://www.davd.eu/os-x-automated-provisioning-using-homebrew-and-cask/

#Check if run as root
if [ "$UID" -ne "0" ] ; then # Actual check
    echo "This script must be run as root. (Use sudo.)"
    exit 1 # Stop script if 
fi

# Make sure all files land where you expect them to
cd ~/Desktop

#  Homebrew requires Xcode CLI tools to be installed.
xcode-select --install

#echo "Press any key when Xcode CLI tools installation is complete..."
#read

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if [[ $(command -v brew) ]] ; then
    # Setup drivers cask
    brew tap caskroom/drivers

    # Install CLI apps with Homebrew
    # Apps installed on seperates lines since Homebrew will fail to download any apps
    # if some of them are no longer available.
    brew install aescrypt
    brew install coreutils # Current Gnu coreutils (e.g. ls, cat, wc)
    brew install exiftool
    brew install ffmpeg
    brew install htop
    brew install mas # Mac App Store CLI
    #brew install nano # Text editor
    brew install neovim
    brew install pandoc
    brew install python2
    brew install python3
    brew install ranger
    brew install testdisk
    brew install wget
    brew install youtube-dl

    # Install GUI apps with Homebrew Casks
    brew cask install android-file-transfer
    brew cask install calibre
    brew cask install carbon-copy-clone
    #brew cask install dropbox #Disabled because Dropbox now self-updates
    brew cask install etcher
    #brew cask install franz
    brew cask install gpgtools
    brew cask install handbrake
    brew cask install iterm2
    brew cask install keepassxc
    brew cask install libreoffice
    brew cask install java
    #brew cask install jgrasp # Java IDE
    #brew cask install max
    brew cask install mas             # Mac App Store CLI client
    brew cask install shiftit         # Manipulate windows with keyboard
    brew cask install skype
    brew cask install vlc
    brew cask install taskpaper
    #brew cask install teamviewer
    brew cask install transmission
    brew cask install typora
    brew cask install veracrypt
    brew cask install virtualbox virtualbox-extension-pack
    brew cask install wacom-intuos-tablet
else
    echo "Homebrew is not installed."
fi

# Install Mac App Store apps
if [[ $(command -v mas) ]] ; then
    mas install 66042322  # 123D Design
    mas install 15318186  # 123D Make
    mas install 118136179 # AutoMute
    mas install 25264550  # Blackmagic Disk Speed Test
    mas install 414554506 # Clocks
    mas install 424389933 # Final Cut Pro
    mas install 82658836  # GarageBand
    mas install 09183694  # Keynote
    mas install 41258766  # Magnet
    mas install 09203825  # Numbers
    mas install 09201541  # Pages
    mas install 176895641 # Spark
else
    echo "mas is not installed. No apps will be installed from the App Store."
fi

# Install self updating apps with Scripts

# Install Atom
#chmod +x macos-setup/mac-setup-resources/install-atom.sh
#./macos-setup/mac-setup-resources/install-atom.sh

#Install Chrome
chmod +x macos-setup/mac-setup-resources/install-chrome.sh
./macos-setup/mac-setup-resources/install-chrome.sh

#Install Dropbox
chmod +x macos-setup/mac-setup-resources/install-dropbox.sh
./macos-setup/mac-setup-resources/install-dropbox.sh

#Install Google Drive
chmod +x macos-setup/mac-setup-resources/install-google-drive.sh
./macos-setup/mac-setup-resources/install-google-drive.sh

# Install vim-plug (vim plugin manager)
if [[ $(command -v nvim) ]] ; then                              # For Neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
elif [[ $(command -v vim) ]] ; then                             # For Vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "Neither Vim or Neovim are installed. vim-plug will not be installed."
    echo "Also, what did you do?!?!"
fi

# Use Daniel Wesser's dotfiles
# Create and work in Git Directory
#mkdir ~/Git
#cd ~/Git
# Get dotfiles
#git clone https://github.com/DIWesser/mac-dotfiles.git
# Create symlinks to dotfiles
#chmod +x mac-dotfiles/install.sh
#./mac-dotfiles/install.sh
# Return to Desktop
#cd ~/Desktop

# Add modular app launchers. Since apparently you're not ready to let those go.
#mv -r mac-setup-resource/Launchers ~/Applications/Launchers

# Install Typora Themes
# Ash
#curl -sS https://github.com/typora/typora-ash-theme/archive/master.zip
#Unzip
#mv

# Dropbox
#curl -sS https://raw.githubusercontent.com/ujwaljain/typora-theme-gallery/gh-pages/media/theme/dropbox/dropbox.css
#mv dropbox.css ~/Library/Application\ Support/abnerworks.Typora/themes/dropbox.css

# Minimalism
#curl -sS https://github.com/pink-bird/typora-theme-gallery/blob/gh-pages/media/theme/minimalism/minimalism.zip?raw=true
#unzip
#mv -r minimalism/minimalism ~/Library/Application\ Support/abnerworks.Typora/themes/minimalism
#mv minimalism/minimalism-dark.css ~/Library/Application\ Support/abnerworks.Typora/themes/minimalism-dark.css
#mv minimalism/minimalism.css ~/Library/Application\ Support/abnerworks.Typora/themes/minimalism.css

#################################################################################
# Usability enhancements
#################################################################################

# Disable iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool NO
sudo defaults write "/System/Library/User Template/Non_localized/Library/Preferences/com.apple.SetupAssistant" DidSeeCloudSetup -bool YES

# Enable AppStore debug menu
# defaults write com.apple.appstore ShowDebugMenu -bool YES

# Disable Photos app to open automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Enable shutdown dialog
#defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool NO

# Accelerated playback on window size adjustment for Cocoa apps
#defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Reduce up safari render delay
#defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# Faster keystroke reactions
#defaults write NSGlobalDomain KeyRepeat -int 0

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# Force Safari to open target links in new tabs
#defaults write com.apple.Safari TargetedClicksCreateTabs -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Quit printer app when job is completed
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable system-wide resume
#defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable smart quotes & dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable keyboard illumination on 5 minutes standby
defaults write com.apple.BezelServices kDimTime -int 300

# Require password after sleep or screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable subpixel rendering on non-apple lcds
#defaults write NSGlobalDomain AppleFontSmoothing -int 2

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
#defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Change scrolling direction
# Try http://www.tech-recipes.com/rx/11757/os-x-lion-10-7-reverse-scroll-direction/

#################################################################################
# Finder
#################################################################################

# Automatically open a new Finder window when a volume is mounted
#defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
#defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
#defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable disk verification
#defaults write com.apple.frameworks.diskimages skip-verify -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Show POSIX path as finder window title
#defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder status bar originating from $HOME instead of /
#defaults write /Library/Preferences/com.apple.finder PathBarRootAtHome -bool YES

# Enable AirDrop on all interfaces
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show all file extensions
/usr/bin/defaults write com.apple.finder AppleShowAllExtensions -bool YES

# Show/hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Remove warning before changing an extension
/usr/bin/defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable snap-to-grid for icons views (desktop & finder)
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
#chflags nohidden ~/Library

# Show the /Volumes folder
#sudo chflags nohidden /Volumes

# Disable emoji substitution
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable spell checking
#defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
#defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Daily check for software updates
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Home dir as default finder location
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"


#################################################################################
# Safari
#################################################################################

# Privacy: send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool true
defaults write com.apple.Safari SuppressSearchSuggestions -bool false

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
#defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Make Safari’s search banners default to Contains instead of Starts With
#defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
#defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Context menu item for safari dev tools
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


#################################################################################
# Mail
#################################################################################

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
#defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Disable inline attachments (just show the icons)
#defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
#defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"


#################################################################################
# Dock & Menu Bar
#################################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
#defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Minimize windows into their application’s icon
#defaults write com.apple.dock minimize-to-application -bool true

# dock tile size
defaults write com.apple.dock tilesize -int 42

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Maximize autodisplay/hide speed of Dock
defaults write com.apple.dock autohide-time-modifier -int 0

# Automatically hide and show the Menu Bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Dark Dock
defaults write NSGlobalDomain AppleInterfaceStyle Dark

#################################################################################
# Time Machine
#################################################################################

# Disable local time machine backups
tmutil disablelocal

# Disable time machine selection on new hotplug
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES

# Allow unsupported devices
defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes -bool YES

# do not create .DS_Store on network shares
#/usr/bin/defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool YES


#################################################################################
# Performance tuning
#################################################################################

# Disable animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.finder DisableAllAnimations -bool YES
defaults write com.apple.dock launchanim -bool NO
defaults write com.apple.mail DisableReplyAnimations -bool YES
defaults write com.apple.mail DisableSendAnimations -bool NO
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

# Disable dashboard
/usr/bin/defaults write com.apple.dashboard mcx-disabled -bool YES

# Don't show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Reset Launchpad, but keep the desktop wallpaper intact
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Disable sudden motion for ssd – Dissabled because my laptop does not have an HDD option
#sudo pmset -a sms 0


#################################################################################
# Utilities
#################################################################################

# Terminal: Only use UTF-8 in Terminal.app
#defaults write com.apple.terminal StringEncodings -array 4

# Enable the debug menu in Address Book
#defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
#defaults write com.apple.dashboard devmode -bool true

# Enable the debug menu in iCal (pre-10.8)
#defaults write com.apple.iCal IncludeDebugMenu -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
#defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
#defaults write com.apple.DiskUtility advanced-image-options -bool true

# Transmission: Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Transmission: Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Transmission: Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false


# Restart Finder & Dock
killall Finder
killall Dock

#################################################################################
# Personalising
#################################################################################

# Symlink  ~/Movies to ~/Video and Hide ~/Movies
# Because Apple keeps putting things in Movies.
# Piss off, Apple.
ln -s ~/Movies ~/Video
chflags hidden ~/Movies
#################################################################################
# Post Setup User Info
#################################################################################

# Save a todo list to the desktop as Todo.md
#echo "" >> Todo.md
echo "- [ ] Install [Dalhousie VPN](https://vpn.its.dal.ca/)" >> Todo.md
echo "- [ ] Show bettery percentage in Menu Bar" >> Todo.md
echo "- [ ] Make Chrome the default Browser" >> Todo.md
echo "- [ ] Iterm: Show border around window" >> Todo.md
echo "- [ ] Iterm: Remove Title Bar (Settings > Profiles > Window > Style > No Title Bar)" >> Todo.md
echo "- [ ] [Install Dropbox](https://www.dropbox.com/download?plat=mac&full=1)" >> Todo.md
echo "- [ ] Import Messages Data" >> Todo.md
echo "- [ ] Import fstab" >> Todo.md
echo "- [ ] Change screenshot save location (`defaults write com.apple.screencapture location ~/Dropbox/Pictures/Screenshots/Elli`)" >> Todo.md
echo "- [ ] Sign in to Chrome and [configure extensions](chrome://extensions)" >> Todo.md
echo "- [ ] Setup encrypted drives" >> Todo.md
echo "- [ ] Set ShiftIt keyboard shortcuts" >> Todo.md
echo "- [ ] [Install audacity](http://www.audacityteam.org/download/mac/)" >> Todo.md
echo "- [ ] Install Creative Cloud" >> Todo.md
echo "- [ ] [Install DaVinci Resolve](https://www.blackmagicdesign.com/ca/products/davinciresolve/#)" >> Todo.md
echo "- [ ] [Install EOS Utility](https://www.usa.canon.com/internet/portal/us/home/support/self-help-center/eos-utility)" >> Todo.md
echo "- [ ] Install Microsoft Office" >> Todo.md
echo "- [ ] Setup Clocks" >> Todo.md
echo "- [ ] Enable right click on trackpad" >> Todo.md

# List of apps to install from app store
# Save a readme to the desktop as readme.md
