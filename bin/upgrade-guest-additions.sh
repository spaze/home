#!/bin/sh

echo "Mounting CD image"
sudo mount /dev/cdrom /media/cdrom

echo "Running install"
sudo /media/cdrom/VBoxLinuxAdditions.run

echo "Updating initramfs"
sudo update-initramfs -u

echo "Done, reboot now"
