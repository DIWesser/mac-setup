# macOS Setup

This is a fork of David Prandzioch's Homebrew based [OSX setup script](https://gist.github.com/dprandzioch/84f44e3c271d3c4cf3865969c97244a3) which I found through his [blog post](https://www.davd.eu/os-x-automated-provisioning-using-homebrew-and-cask/). It's also me throwing an old project into Github as a way of puzzling through Git. My appologies for weird commits, and etiquitte errors. 

## Usage

**I haven't tested this script yet. This is still theoretical.**  

1. Clone this repo `cd ~/Desktop && git clone https://github.com/DIWesser/macOS-Setup.git`
    - You may need to wait for developer tools to install at this point.
2. Make the main script executable `cd ~/Desktop && chmod +x mac-setup.sh`.
3. Run the main script `./mac-setup.sh`

That's it. There are still a few things that I haven't figured out how to add to the script. A todo list will be put on the desktop that lists everything you will need to do manually. 

## Todo

- [ ] Figure out how Homebrew handles installing a multiple packages if one can not be found. 
