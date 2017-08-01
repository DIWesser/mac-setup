if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Lock computer from terminal
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Make the VeraCrypt CLI slightly more sane.
alias veracrypt='/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt'

# Make the Carbon Copy Cloner 4 CLI slightly more sane.
alias ccc='/Applications/Carbon\ Copy\ Cloner.app/Contents/MacOS/ccc'

# Close terminal window like Vim
alias :q='exit'

# Use NeoVim a bit more
alias vi='nvim'
#alias vim='nvim'

# Quickly access todo list
alias todo="vim ~/Dropbox/Lists/Personal.taskpaper"

# ls tweaks
alias la='ls -A'

# Print weather to terminal
alias weather='wget -qO - http://wttr.in/ | head -7'
