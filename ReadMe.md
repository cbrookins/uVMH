Ubuntu Virtual Machine Host
===========================

## Purpose
This script is meant to easily configure a headless Ubuntu virtual machine host.  Using VNC, openbox and virt-manager the server can be managed through a GUI interface over a VNC connection.  Samba allows for virtual hard disks and OS images to easily be transferred to the server.  

## Requirements
Ubuntu 14.04

## Setup

### Ubuntu Setup
During the Ubuntu installation select the following options:  
**OpenSSH Server** (optional)  
**Virtual Machine Host** (required)

### Clone git repository
`sudo apt-get install git`  
`git clone https://github.com/cbrookins/uvmh`  

### Run UVMH
`chmod +x uvmh/setup.sh`  
`uvmh/setup.sh`

### Includes
**Fixed Disk Tool**
> After working with virt-manager I noticed that even when I asked it to create a fixed disk, it wouldn't.  I created this little bash script to handle that for me.  
>
> **Usage**  
> `uvmh/fDisk.sh *format* *name* *size*`
> 
> **Example**
> `uvmh/fDisk.sh vmdk ubuntu_sda 60G`  
> *This will create a 60 gigabyte vmdk formatted virtual disk named ubuntu_sda.vmdk*  
> *See the [qemu documentation](http://qemu.weilnetz.de/qemu-doc.html#disk_005fimages_005fformats) for additional formats that can be used*