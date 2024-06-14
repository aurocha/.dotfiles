## Install Ubuntu 24.04 LTS (Noble Numbat) in a Luks container+btrfs+subvolumes using debootstrap   


1.  #### Boot from Ubuntu Iso, bypass install, open a terminal, ajust your keyboard layout and get root:

		setxkbmap pt (or es,de,uk,etc)
  		sudo -i

2. 	#### Connect to network, either by using the icon on the GNOME's topbar or by running nmcli  

		nmcli d wifi c SSID --ask
		nmcli d wifi c SSID hiiden yes --ask (if wifi hidden)

3.	#### Install debootstrap and arch-install-scripts:
		apt update; apt install -y debootstrap arch-install-scripts

4.	#### Format disk. As I am on a dual boot, ths is how I choose to partition the disk.
		/dev/sda1 --> boot/efi
		/dev/sda4 --> /boot
		/dev/sda5 --> /
		/dev/sda6 --> /home
5.	#### Create luks container: 
		cryptsetup -c aes-xts-plain64 -h sha512 -s 512 --use-random --iter-time=300 luksFormat /dev/sda5

6. #### Open new luks container: 
		cryptsetup open /dev/sda5 sda5_crypt

7.	#### Format /dev/mapper sda5_crypt as btrfs: 
		mkfs.btrfs -L Ubuntu /dev/mapper/sda5_crypt

8.	#### Mount /dev/mapper/sda5_crypt to /mnt
		mount /dev/mapper/sda5_crypt /mnt

9. 	#### Create btrfs subvolumes: 
        btrfs su cr /mnt/@
		btrfs su cr /mnt/@var
		btrfs su cr /mnt/@tmp
		btrfs su cr /mnt/@opt

10.	#### Unmount /mnt and mount subvolumes:
		umount -R /mnt
		mount -o subvol=@,rw,defaults,compress=zstd:3 /dev/mapper/sda5_crypt /mnt

11.	#### Create mountpoints: 
		mkdir -p /mnt{boot,var,opt,home}

12.	#### Mount following subvolumes:
        mount -o subvol=@var,rw,defaults,compress=zstd:# /dev/mapper/sda5 /mnt/var
        mkdir -p /mnt/var/tmp
        mount -o subvol=@tmp,rw,defaults,compress=zstd:# /dev/mapper/sda5 /mnt/var/tmp
        mount -o subvol=@opt,rw,defaults,compress=zstd:# /dev/mapper/sda5 /mnt/opt
        mount /dev/sda4 /mnt/boot
        mkdir -p /mnt/boot/efi
        mount /dev/sda1 /mnt/boot/efi

13.	#### Install base system: 
		debotstrap noble /mnt http://pt.archive.ubuntu.com/ubuntu

14.	#### Generate fstab for new system: 
		genfstab -U /mnt >> /mnt/etc/fstab

15.	#### Copy ubuntu.source to new new root: 
		cp -av /etc/apt/sources.list.d/ubuntu.sources /mnt/etc/apt/sources.list.d/

16.	#### Chroot to new system: 
		arch-chroot /mnt

17. #### Install the needed packages
        apt update
        apt upgrade -y
        apt install linux-{,image-,headers-}generic-hwe-24.04 linux-firmware initramfs-tools efibootmgr ryptsetup-initramfs btrfs-progs cryptsetup vim network-manager iw iwd iucode-tool fwupd htop needrestart dmidecode gnupg grub-efi-amd64 shim shim-signed keyboard-configuration ufw

18.	#### Edit crypttab and adjust by adding: 
		sda5_crypt	UUID=uuidof/dev/sda5 none luks,discard


	You can get the UUID of a partition by running blkid. If you want to add it to crytpttab and then edit the file, try doing the following:
  
		echo `blkid -o value -s UUID /dev/sda5` >> /etc/cryptttab

	and then edit it so you get something like:

		sda5_crypt	UUID=9beeb70d-c3ae-4652-a2e8-609c825403df	none	luks,discard

19.	#### Install grub: 
		grub-install --uefi-secure-boot --target=x86_64-efi --efi-directory=/boot/efi /dev/sda --recheck

20.	#### Configure system
		update-grub
		update-initramfs -cvk all                		
		dpkg-reconfigure tzdata
        dpkg-reconfigure locales
        dpkg-reconfigure keybord-configuration
        echo "hostname" > /etc/hostname
        echo "127.0.1.1 hostname" >> /etc/hosts
        systemctl  enable NetworkManager
        apt install ubuntu-desktop-minimal
		systemctl enable ufw
		ufw enable
        systemctl set-default graphical
        systemctl enable gdm3
		passwd 		# <----change root pasword, this is important!!!

21.	#### Exit the chroot by hitting CTRL+D

22.	#### Unmount the chroot
					
		umount /mnt -R

### Reboot (and pray)
