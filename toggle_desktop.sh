#! /bin/sh

# getting the right path of binaries
defaults=$(which defaults)
killall=$(which killall)

# setting up commands
state="$defaults read com.apple.finder CreateDesktop"
setTrue="$defaults write com.apple.finder CreateDesktop -bool true"
setFalse="$defaults write com.apple.finder CreateDesktop -bool false"
killFinder="$killall Finder"

if [ $($state) != 0 ]; then   # get the current status
  $setFalse                   # setting to hide the icons
  $killFinder                 # restart Finder to activate
  echo "icons are hidden now" # echoes what's done in command line
else
  $setTrue                    # setting to show the icons
  $killFinder                 # restart Finder to activate
  echo "icons are shown now"  # echoes what's done in command line
fi
