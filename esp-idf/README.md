ESP_IDF requires a USB connection to program the ESP32
use VirtualBox backend to pass through USB devices

Switching Multipass backend
===========================

Windows
_______

ensure Hyper-V is disabled in Windows Features
install Multipass and VirtualBox
in Admin Powershell::
  multipass set local.driver=virtualbox
reboot

MacOS
_____

install Multipass and VirtualBox
in Terminal::
  multipass set local.driver=virtualbox
  
  
To go back to the default backend:

Windows
_______

in Admin Powershell:
multipass set local.driver=hyperv
enable Hyper-V in Windows Features
reboot

MacOS
_____

in Terminal::
  multipass set local.driver=hyperkit
  
Finding Multipass instances in VirtualBox
=========================================

Windows
_______

TODO

MacOS
_____

Multipass runs as the root user, so to see the instances in VirtualBox, or through the VBoxManage command, you have to run those as root, too::

  sudo VirtualBox  

