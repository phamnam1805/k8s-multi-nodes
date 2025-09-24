#!/bin/bash
sudo cp ./bootptab /etc/bootptab
sudo /bin/launchctl load -w /System/Library/LaunchDaemons/bootps.plist
sudo /bin/launchctl kickstart -kp system/com.apple.bootpd