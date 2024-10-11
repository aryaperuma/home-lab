#!/bin/bash

# Create a new VM
VM_NAME="HomeLabVM"
VBoxManage createvm --name "$VM_NAME" --ostype "Ubuntu_64" --register

# Set VM settings
VBoxManage modifyvm "$VM_NAME" --memory 2048 --cpus 2 --nic1 nat --vrde on

# Create a virtual hard disk
VBoxManage createhd --filename "$HOME/VirtualBox\ VMs/$VM_NAME/$VM_NAME.vdi" --size 20000

# Attach storage controller
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox\ VMs/$VM_NAME/$VM_NAME.vdi"

# Attach an ISO file (Ubuntu) for installation
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium /path/to/ubuntu.iso

# Set boot order
VBoxManage modifyvm "$VM_NAME" --boot1 dvd --boot2 disk

# Start VM
VBoxManage startvm "$VM_NAME"
