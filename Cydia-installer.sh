#!/bin/sh

#  CydiaInstall
#  
#
#  Created by Dayt0n on 10/23/14.
#


clear
read -p "Make sure your iDevice and Mac are on the same network. Please enter the IP address of your device: " ipwhu
sleep 1
clear
echo "Creating Temporary Directory..."
cd ~
mkdir tmpcydia
cd tmpcydia
mkdir Cydia
cd Cydia
mkdir AutoInstall
cd AutoInstall
sleep 0.5
echo "Downloading Cydia Packages..."
wget 'http://apt.saurik.com/cydia/debs/cydia-lproj_1.1.12_iphoneos-arm.deb'
wget 'http://apt.saurik.com/debs/cydia_1.1.30_iphoneos-arm.deb'

clear
sleep 2
echo "Transfering Cydia Packages to Device..."
cd ~
cd tmpcydia
sleep 0.5
sleep 2
ssh-keygen -R $ipwhu
sleep 0.5
clear
echo "Please enter your SSH password when prompted [default is alpine]"
scp -rp Cydia root@$ipwhu:/private/var/root/Media
sleep 1
clear
echo "Please enter your SSH password one last time."
ssh root@$ipwhu 'cd /private/var/root/Media/Cydia/AutoInstall; dpkg -i *.deb; sleep 4; reboot'
sleep 0.5
cd ~
rm -rf tmpcydia
clear
echo "Enjoy Cydia!”
exit
