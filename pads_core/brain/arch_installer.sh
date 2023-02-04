#!/bin/bash

# Still need to set up WIFI
  red='\033[0;31m'
  green='\033[0;32m'
  nc='\033[0m'

  echo  -e ${green}"I'm gonna go ahead and install Arch for you..."${nc}
  sleep 2;
  if [[ -d /sys/firmware/efi ]]; then
    clear
    echo -e ${green}"You are booted in EFI Mode."${nc}
  elif [[ ! -d /sys/firmware/efi ]]; then
    clear
    echo -e ${green}"You are booted in BIOS Mode"${nc}
  fi

  if [[ ! bash ]]; then
    bash
  else
    true
  fi

  if [[ $(lspci -v | grep "Ethernet") ]]; then
    echo -e ${green}"Network connection with Ethernet"${nc}
  else
    echo -e ${green}"Network connection with WIFI"${nc}
  fi
  grep -q "^flags.*hypervisor" /proc/cpuinfo && echo -e ${green}"Machine running a VM" || echo -e "Machine running on Bare Metal"${nc}
  sleep 5
  echo -e ${green}"Starting dhcpcd.service"${nc}
  systemctl enable dhcpcd.service
  systemctl start dhcpcd.service
  ping -c 5 google.com
  timedatectl set-ntp true &> /dev/null
  sleep 2
  timedatectl set-timezone "America/New_York"
  if [[ $(fdisk -l | grep "/dev/sd*") && -d /sys/firmware/efi ]]; then
    echo -e ${green}"I'm going to partition:"${nc}
    fdisk -l | grep "/dev/sd*"
    sleep 1
    (echo n; #/mnt/boot Partition
    echo p;
    echo 1;
    echo "";
    echo +512M;
    echo t;
    echo ef;
    echo n; #swap partition
    echo p;
    echo 2;
    echo "";
    echo +2G;
    echo t;
    echo 2;
    echo 82;
    echo n;
    echo p;
    echo 3; #/mnt partition
    echo "";
    echo "";
    echo w;
    echo q;) | fdisk /dev/sd* &> /dev/null
    echo -e ${green}"Making File System"${nc}
    sleep 1
    mkfs.fat -F32 /dev/sda1 &> /dev/null
    mkswap /dev/sda2 &> /dev/null
    mkfs.ext4 /dev/sda3 &> /dev/null
    mount --mkdir /dev/sda1 /mnt/boot &> /dev/null
    swapon /dev/sda2 &> /dev/null
    mount /dev/sda3 /mnt &> /dev/null
  elif [[ $(fdisk -l | grep "/dev/sd*") && ! -d /sys/firmware/efi ]]; then
    echo -e ${green}"I'm going to partition:"${nc}
    fdisk -l | grep "/dev/sd*"
    sleep 2
    (echo o;
    echo n; #/mnt partition
    echo p;
    echo 1;
    echo "";
    echo +55G;
    echo t;
    echo 83;
    echo a;
    echo 1;
    echo n; #Swap Partition
    echo p;
    echo 2;
    echo "";
    echo +2G;
    echo t;
    echo 2;
    echo 82;
    echo w;
    echo q;) | fdisk /dev/sda &> /dev/null
    echo -e ${green}"Making File System"${nc}
    mkswap /dev/sda2 &> /dev/null
    mkfs.ext4 /dev/sda1 &> /dev/null
    swapon /dev/sda2 &> /dev/null
    mount /dev/sda1 /mnt &> /dev/null
  else
   echo -e ${red}"I can't partition your system properly"${nc}
   exit                                
  fi
  echo -e ${green}"Backing up Mirror List"${nc}
  sleep 1
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
  echo -e ${green}"Building a list of the top 12 fastest mirrors out of 50, and saving. This may take a while."${nc}
  reflector --verbose -c "US" -f 12 -l 50 -n 12 --sort rate --protocol https --save /etc/pacman.d/mirrorlist
  cat /etc/pacman.d/mirrorlist
  sleep 5
  echo -e ${green}"Installing Linux Firmware"${nc}
  pacstrap /mnt base linux linux-firmware neofetch fakeroot nano sudo man-db man-pages texinfo lshw upower dhcpcd iwd networkmanager
  grep -q "^flags.*hypervisor" /proc/cpuinfo && pacstrap /mnt virtualbox-guest-utils && systemctl enable vboxservice.service && systemctl start vboxservice.service && echo -e ${green}"VboxGuestUtils"${nc} || continue
  echo -e ${green}"Generating fstab"${nc}
  genfstab /mnt >> /mnt/etc/fstab
  arch-chroot /mnt bash -c \
  'red="\033[0;31m";
  green="\033[0;32m";
  nc="\033[0m";
  echo -e ${green}"Changing to Chroot user"${nc};
  echo -e ${green}"Changing Timezone"${nc};
  ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime;
  hwclock --systohc &> /dev/null;
  sed -i "s/#en_US.UTF-8 UTF8/en_US.UTF-8 UTF-8/g" /etc/locale.gen;
  locale-gen &> /dev/null;
  echo "LANG=en_US.UTF-8" >> /etc/locale.conf;
  systemctl enable dhcpcd.service &> /dev/null;
  echo -e ${green}"Gimmie your hostname ya bitch!"${nc};
  read -p "Hostname: " hostname;
  echo ${hostname} >> /etc/hostname;
  touch /etc/hosts;
  echo "127.0.0.1 localhost" >> /etc/hosts;
  echo "::1 localhost" >> /etc/hosts;
  echo "127.0.1.1 ${hostname}" >> /etc/hosts;
  echo -e ${green}"Create a password for root."${nc};
  passwd;
  echo -e ${green}"Make yourself a bitch ass username..."${nc};
  read -p "Username: " user;
  useradd -m ${user};
  echo -e ${green}"Make your stupid password, ${user}"${nc};
  passwd ${user};
  echo "" && echo "${user} ALL=(ALL:ALL) ALL" >> /etc/sudoers;
  if [[ $? == 0 ]]; then
    echo -e ${green}"Nice to meet you ${user}!"${nc};
    sleep 2;
  else
    echo -e ${red}"I could not configure sudo access"${nc};
    sleep 2;
  fi

  
  if [[ -d /sys/firmware/efi ]]; then
    echo -e ${green}"I am installing GRUB for EFI Mode"${nc};
    sleep 2;
    pacman -Syyu;
    yes | pacman -S grub efibootmgr;
    mount --mkdir /dev/sda1 /boot/efi;
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB;
    grub-mkconfig -o /boot/grub/grub.cfg;
    if [[ $? == 0 ]]; then
      echo -e ${green}"I am all done installing Arch Linux!"${r};
      echo -e ${green}"I gotta reboot your new shit yo...";
      echo "Rebooting in...";
      x=5
      while [ $x -gt 0 ]; do
        echo -ne ${green}"${x}...\r"${nc} && sleep 1;
        ((x--))
      done
    else
      echo -e ${red}"Something went wrong Exit Code: $?"${nc};
      exit;
    fi
  elif [[ ! -d /sys/firmware/efi ]]; then
    echo -e ${green}"I am installing GRUB for BIOS Mode"${nc};
    sleep 2;
    pacman -Syy;
    yes | pacman -S grub;
    grub-install --target=i386-pc /dev/sda;
    grub-mkconfig -o /boot/grub/grub.cfg;
    if [[ $? == 0 ]]; then
      echo -e ${green}"I am all done installing Arch Linux!";
      echo "I gotta reboot your new shit yo...";
      echo "Rebooting in...";
      x=5
      while [ $x -gt 0 ]; do
        echo -ne "${x}...\r"${nc} && sleep 1;
        ((x--))
      done
    else
      echo -e ${red}"Something went wrong Exit Code: $?"${nc};
      exit;
    fi
  else
    echo "I do not know which bootloader to install.";
    exit;
  fi'
