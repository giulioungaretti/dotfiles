# stolen from https://gist.github.com/brandonb927/3195465 
echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


echo ""
echo "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0


echo ""
echo "Disable the warning when changing a file extension? (y/n)"
read -r response
case $response in
  [yY])
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    break;;
  *) break;;
esac


echo ""
echo "Set Dock to auto-hide and remove the auto-hiding delay? (y/n)"
read -r response
case $response in
  [yY])
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0
    break;;
  *) break;;
esac

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400
 

