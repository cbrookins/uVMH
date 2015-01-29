# User Variables
share='images'
vGeometry='1280x800'

# Script Variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
NC='\033[0m' # No Color


# Upgrading OS
clear
echo -e "${green}Upgrading OS${NC}"
sudo apt-get update > /dev/null && apt-get upgrade -y > /dev/null
clear

# Installing packages
echo -e "${green}Installing needed packages${NC}"
sudo apt-get install -y openbox vnc4server virt-manager xterm samba > /dev/null
clear

# Configure VNC Server
echo -e "${green}Configuring VNC Server${NC}"
vncserver
vncserver -kill :1

echo '#!/bin/sh' > ~/.vnc/xstartup
echo "unset SESSION_MANAGER" >> ~/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> ~/.vnc/xstartup
echo "openbox-session &" >> ~/.vnc/xstartup
echo "virt-manager &" >> ~/.vnc/xstartup

sudo cp ~/uvmh/vncserver /etc/init.d/vncserver
sudo chmod +x /etc/init.d/vncserver
sudo update-rc.d vncserver defaults 99 > /dev/null

sudo mkdir -p /etc/vncserver
echo 'VNCSERVERS="1:'$USER'"' | sudo tee -a /etc/vncserver/vncservers.conf
echo 'VNCSERVERARGS[1]="-geometry '${vGeometry}'"' | sudo tee -a /etc/vncserver/vncservers.conf
clear

# Copy Openbox files to profile
echo -e "${green}Moving Openbox configs to .config/openbox${NC}"
mkdir -p ~/.config/openbox
sudo cp -R /etc/xdg/openbox/* ~/.config/openbox
yes | cp -rf ~/uvmh/menu.xml ~/.config/openbox/menu.xml
clear

# Configuring Samba
echo -e "${green}Configuring Samba${NC}"
echo "[${share}]" | sudo tee -a /etc/samba/smb.conf
echo " comment = vm share" | sudo tee -a /etc/samba/smb.conf
echo " path = /var/lib/libvirt/images" | sudo tee -a /etc/samba/smb.conf
echo " browseable = yes" | sudo tee -a /etc/samba/smb.conf
echo " read only = yes" | sudo tee -a /etc/samba/smb.conf
echo " write list = @sambashare" | sudo tee -a /etc/samba/smb.conf
echo " create mode = 0664" | sudo tee -a /etc/samba/smb.conf
echo " directory mode = 0774" | sudo tee -a /etc/samba/smb.conf
echo " force user = root" | sudo tee -a /etc/samba/smb.conf
echo " force group = root" | sudo tee -a /etc/samba/smb.conf
echo -e "${yellow}Created Samba share with name ${share}${NC}"
sleep 5
clear
sudo smbpasswd -a $USER
sudo /etc/init.d/samba restart

# Reboot
echo -e "${yellow}Rebooting...${NC}"
sleep 5
sudo reboot
