Ubuntu Virtual Machine Host
===========================

## Purpose
This script is meant to easily configure a headless Ubuntu virtual machine host.  Using VNC, openbox and virt-manager the server can be managed through a GUI interface over a VNC connection.  Samba allows for virtual hard disks and OS images to easily be transferred to the server.  

## Requirements
Ubuntu 14.04  
Ubuntu 18.04  

## Setup

### Ubuntu Setup
During the Ubuntu installation select the following options:  
**OpenSSH Server** (optional)  
**Virtual Machine Host** (required)

### Clone git repository
`sudo apt-get install git`  
`git clone https://github.com/cbrookins/uVMH`  

### Run UVMH
`chmod +x uvmh/setup.sh`  
`uVMH/setup.sh`

### Notes  
VNC will be available on port **5901**  
**example:** xx.xx.xx.xx:5901  

### Includes
**Fixed Disk Tool**
> After working with virt-manager I noticed that even when I asked it to create a fixed disk, it wouldn't.  I created this little bash script to handle that for me.  
>
> **Usage**  
> `uVMH/fDisk.sh *format* *name* *size*`
> 
> **Example**
> `uVMH/fDisk.sh vmdk ubuntu_sda 60G`  
> *This will create a 60 gigabyte vmdk formatted virtual disk named ubuntu_sda.vmdk*  
> *See the [qemu documentation](http://qemu.weilnetz.de/qemu-doc.html#disk_005fimages_005fformats) for additional formats that can be used*
