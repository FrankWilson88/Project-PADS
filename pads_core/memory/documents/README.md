<!-- Cloned from https://github.com/othneildrew/Best-README-Template.git -->
<div id="top"></div>
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/FrankWilson88/Project-PADS">
    <img src="https://lh3.googleusercontent.com/i0ItE8oHQ1GWIMqN1PBl5rI4dL2hM0T9VUbBytBZeT0nA6VunnabiL4nPytawS0_Rsyd=s85" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Project PADS</h3>

  <p align="center">
Personal Assistant and Deployment System
    <br />
    <a href="https://github.com/FrankWilson88/Project-PADS"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/github_username/repo_name">View Demo</a>
    ·
    <a href="https://github.com/FrankWilson88/Project-PADS/issues">Report Bug</a>
    ·
    <a href="https://github.com/FrankWilson88/Project-PADS/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#install_arch">Installing Arch</a></li>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installing PADS</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

PADS(Personal Assistant and Deployment System) is General Purpose Artificial Intelligence designed to carry out every day business tasks.
It's purpose is to provide book keeping, employee timesheets, client tracking, automation, etc. It can do double entry accounting for hybrid manufacturing companies. 
None of the data is loaded as Environment Variables, so your interaction with PADS is between you and it.
It's original purpose was to serve as a website, with a relational historical database. 
Work on this project began in Python using the Django Framework on June 23, 2021 at 5:30pm.
The accounting database first came online Oct. 13th, 2021 at 11:48pm. The Bash Syntax was first created by Joe Corso on May 4th, 2022. 
It was previously codenamed Project Eniac, to pay homage to the original project of the same name.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Arch Linux](https://www.archlinux.org/)
* [Javascript](https://www.javascript.com/)
* [Python](https://www.python.org/)
* [Django](https://www.djangoproject.com/)
* [Bash](https://www.gnu.org/software/bash/)
* [MySQL](https://www.mysql.com/)

### Core Files

- pads_core/brain/
  - pads
  - functions.sh
  - log_msg.sh
  - response.sh
  - pads_installer
  - setup.sh
  - styles.sh
- pads_core/memory/
  - audio/
  - documents/
  - img/
  - logs/
  - profiles/
  - requirements/
    - pads_requirements.txt
- pads/prog/
- pads/sandbox/


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

<!-- Installing Arch -->
## Installing Arch Linux
If you're not using Arch Linux, skip to <a href="#installation">installation</a>.
1. Verify boot mode
  - If this command runs with no errors, you're using EFI Mode.
  
   ```sh
   ls /sys/firmware/efi/efivars
   ```
2. Connect to the internet.
  - If you're on Ethernet, it should be connected automatically.
  - Enable and start <a href="https://wiki.archlinux.org/title/dhcpcd">dhcpcd.service</a>
  
  ```sh
  systemctl enable dhcpcd.service
  systemctl start dhcpcd.service
  ```
  - If you're on WIFI, use <a href="https://wiki.archlinux.org/title/Iwd#iwctl">iwd</a>.
  
  ```sh
  iwctl
  device list
  station device scan
  station device get-networks
  station device connect SSID
  ```
  - Ping something...
  
  ```sh
  ping www.google.com
  ```
3. Update system clock
  ```sh
  timedatectl set-ntp true
  timedatectl set-timezone America/New_York
  timedatectl status
  ```
4. Partition the disk. I use <a href="https://wiki.archlinux.org/title/fdisk">fdisk</a>. DO NOT OVERWRITE REDUNDANT STORAGE!!!!

  - List devices, and choose your device
  
  ```sh
  fdisk -l
  ```
  - Change shell to fdisk
  
  ```sh
  fdisk /dev/sda
  ```
  - EFI Boot Mode:
    - Build partition table
    
    ```sh
    n # /mnt/boot partition
    p # primary partition
    1 # /dev/sda1
    "" # first block default
    +512M # last block 512mb
    t # type of partition
    ef # Linux filesystem
    n # swap partition
    p # primary partition
    3 # /dev/sda3
    "" # first block default
    +2G # last block 2gb
    t # type of partition
    3 # to pick sda3
    82 OR swap # swap filesystem
    n # /mnt partition
    p # primary partition
    4 /dev/sda4
    "" # first block default
    "" # last block takes rest of space
    w # write partition table
    q # quit fdisk
    ```
    - Make filesystem
    
    ```sh
    mkfs.fat -F 32 /dev/sda1
    mkswap /dev/sda3
    mkfs.ext4 /dev/sda4
    ```
    
    - Mount filesystem
    
    ```sh
    mount --mkdir /dev/sda1 /mnt/boot
    swapon /dev/sda3
    mount /dev/sda4 /mnt
    ```
  - BIOS Boot Mode:
    - Build partition table
    
    ```sh
    n # /mnt partition
    p # primary partition
    1 # partition number
    "" # first block default
    +500G # last block (make it as big as you want)
    t # type of filesystem
    83 # linux filesystem
    a # bootable flag
    1 # partition number to make bootable
    n # swap partition
    p # primary partition
    3 # partition number
    "" # first block default
    +2G # last block partition
    t # type of filesystem
    3 # partition number
    82 OR swap # swap filesystem
    w # write partition table
    q # quit fdisk
    ```
    - Make filesystem
    
    ```sh
    mkfs.ext4 /dev/sda1
    mkswap /dev/sda3
    swapon /dev/sda3
    ```
    
    - Mount filesystem
    
    ```sh
    mount /dev/sda1 /mnt
    ```
5. Backup and Select your mirrorlist
  
  ```sh
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
  reflector --verbose -c "US" -f 12 -l 50 -n 12 --sort rate --protocol https --save /etc/pacman.d/mirrorlist 
  cat /etc/pacman.d/mirrorlist
  ```
  
6. Install Essential Packages
  
  ```sh
  pacstrap /mnt base linux linux-firmware neofetch fakeroot nano sudo man-db man-pages texinfo lshw upower dhcpcd iwd networkmanager 
  ```
  
    - If you're using a hypervisor install proper guest utilities
    
    ```sh
    pacstrap /mnt virtualbox-guest-utils && systemctl enable vboxservice.service && systemctl start vboxservice.service 
    ```
    
7. Configure the system

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

8. Change root

```sh
arch-chroot /mnt
```

9. Configure timezone for system

```sh
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
```

10. Set device locale
  - Manually edit /etc/locale.gen and uncomment your locale (ig: en_US.UTF-8) OR run the following command
  
  ```sh
  sed -i "s/#en_US.UTF-8 UTF8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
  ```
  - Generate locale file
  
  ```sh
  locale-gen
  ```
  
  - Manually edit /etc/locale.conf OR run the following command
  
  ```sh
  echo "LANG=en_US.UTF-8" >> /etc/locale.conf
  ```
11. Create hostname, host, and user, enable dhcpcd.service
  ```sh
  systemctl enable dhcpcd.service
  echo "${hostname}" > /etc/hostname
  echo "127.0.0.1 localhost" >> /etc/hosts;
  echo "::1 localhost" >> /etc/hosts;
  echo "127.0.1.1 ${hostname}" >> /etc/hosts;
  passwd # this is for root password NOT the user
  useradd -m ${user} # add your user
  passwd ${user} # enter your user password
  sudo nano /etc/sudoers
  ${user} ALL=(ALL:ALL) ALL" >> /etc/sudoers;
  ```
  
12. Install Bootloader (I'm using GRUB)
  -  EFI Bootloader
  
  ```sh
  pacman -Syu grub efibootmgr
  mount --mkdir /dev/sda1 /boot/efi
  grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
  grub-mkconfig -o /boot/grub/grub.cfg
   ```
   - BIOS Bootloader
   
   ```sh
   pacman -Syu grub
  grub-install --target=i386-pc /dev/sda
  grub-mkconfig -o /boot/grub/grub.cfg
   ```
13. Reboot
  - Post install
  ```sh
  sudo pacman -Syu xorg xorg-service xorg-apps xterm xfce4 xfce4-goodies
  ```
  
14. Change .xinitrc
  ```sh
  sudo nano ~/.xinitrc
  exec startxfce4
  ```
  
## Building your server  

### Setting up the Domain
You must have a domain name. I use <a href="https://www.dynu.com/">Dynu dns</a>. There are different way to set up the domain name to work. So you'll have to source the documentation yourself if you choose to use a different registrar. <a href="https://www.dynu.com/en-US/Resources/Tutorials">This</a> is the link for the resources from Dynu. Also, if you need a Dynamic DNS, but your router doesn't support it. They have open source software written in python that you can use to automatically update your ip address.

  - Log in to account at <a href="https://www.dynu.com/">Dynu dns</a>.
  - Change the "A Record", for Dynu:
    - Click on DDNS Service
    - Click on the Domain you want to use
    - Change the IPv4 Address to the address of your Router
    - Click Save
    
### Setting up the Router
There are a lot of ways you may need to tinker with it, and depending on your ISP, you may not be allowed to host a home website. I use Century Link, which fortunately allows to do just about anything you want with your internet, unless it's illegal of course.

  - Log into your router. Usually at "https://192.168.0.1
  - Click on "Advanced Setup"
  - The left-hand panel under "Security" click "Port Forwarding"
  - Enter the IP Address of the device serving the website. If you're not sure, type ``ip address`` in the terminal. You can also click "Select Device", and from the dropdown click the device.
  - You don't need to enter an LAN Starting Port.
  - Select "TCP" from "Select Protocol".
  - For WAN Starting and Ending Port, enter "80".
  - For Source IP State select "All IP Addresses".
  - Click Apply
  - Do the same for port 443.

### Installing nginx
There are thousands of tutorials that have thousands of ways of setting up nginx (or any web server), and most of them suck the biggest hairiest set of monkey balls you can think of. I've found the most success by just reading the <a href="https://wiki.archlinux.org/title/Nginx">Arch Linux</a>, and <a href="https://nginx.org/en/docs/">nginx</a> documentation; and the <a href="https://nginx.org/en/docs/beginners_guide.html">beginner guide</a>, and the <a href="https://www.nginx.com/resources/wiki/start/">getting started</a> page. I found a few helpful tidbits on setting up the project directory, and a bare minimum configuration <a href="https://gist.github.com/janoliver/127091de8185cd8557ad">here</a>.
Also, the docs assume you'll use the defaule location for your config files. I like to keep them with my project, so I add the line: ```include /srv/http/*/nginx.conf;``` in the /etc/nginx/nginx.conf file, which will check each project directory for an nginx.conf file and read from there. More on that when we get there.

  - Install nginx. Arch Linux recommends nginx-mainline
  
  ```sh
  sudo pacman -Syu nginx-mainline
  ```
  
  - Enable/Start services
  ```sh
  sudo systemctl enable nginx.service
  sudo systemctl start nginx.service
  ```
  
  - You should see the default page at <a href="http://127.0.0.1">http://127.0.0.1</a> located at /usr/share/nginx/html/index.html
  
  - Backup the default config file
  ```sh
  sudo cp /etc/nginx.nginx.conf /etc/nginx/nginx.conf.bak
  ```
  
  - Set the configurations at /etc/nginx/nginx.conf
  ```sh
  sudo nano /etc/nginx/nginx.conf
  ```
  
  - This is a sample of the default file:
  ```sh
    #user http;
    #worker_processes  1;

    #error_log  logs/error.log;
    #error_log  logs/error.log  notice;
    #error_log  logs/error.log  info;

    #pid        logs/nginx.pid;

    events {
        worker_connections  1024;
    }

    http {
        include       mime.types;
        default_type  application/octet-stream;

        #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    server {
        listen       80;
        server_name  localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }

    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}

    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}
}
  ```
  - All server blocks must be nested in the http block.
  - Uncomment ```user http;```
  - Uncomment ```work_processes 1;```
    - The docs suggest setting it to the amount of hardware threads you have. But you can also use ```auto```, and it will detect optimal value.
  - Uncomment ```gzip on;```
  - This is where I would add the line ```include /srv/http/*/nginx.conf;```
  - Make your config file for your project in the project directory
  ```sh
  sudo nano /srv/http/example/nginx.conf
  ```
  
  - Create a server block in your example/nginx.conf: (This is the bare minimum).
  ```sh
  server {
      listen 80;
      server_name example.YOURDOMAIN;

      error_log /srv/http/example/log/nginx.error.log;
      access_log /srv/http/example/log/nginx.access.log;

      root /srv/http/example;
      index index.html;
   }
  ```
  
  - Make a directory for your project, add basic webpage
  ```sh
  sudo mkdir /srv/http/example /srv/http/example/logs
  touch /srv/http/example/logs/nginx.error.log
  touch /srv/http/example/logs/nginx.access.log
  sudo nano /srv/http/example/index.html
  echo "hello world" >> /srv/example/index.html
  ```
  
  - Reload nginx services
  ```sh
  sudo systemctl reload nginx.service
  ```
  
  - Go to your website on the browser and it should show up. It doesn't have an SSL yet.
  
  - Backup your computer
  ```sh
  sudo rsync -aAXHx --exclude={"/dev/*", "/proc/*", "/sys/*", "/tmp/*", "/run/*", "/mnt/*", "/media/*"} / /run/mount/storage/backup/arch_backup --verbose
  ```
  
  - If you have issues chech
  ```sh
  sudo systemctl status nginx.service
  ```
  
  - If you get the error: ```could not build optimal types_hash``` add ```types_hash_max_size 4096;``` to /etc/nginx/nginx.conf under http{}
  
### Setting up uWSGI
todo

### Setting up and SSL
todo
## Installing PADS
### Prerequisites

If you are on Arch Linux, you can update first. The installer also updates before it installs anything.
* bash
  ```sh
  sudo pacman -Syyu
  ```
If you are on Rasbian/Debian, you can update first. The installer also updates before it installs anything.
* bash
  ```sh
  sudo apt-get update && sudo apt-get upgrade
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/FrankWilson88/Project-PADS.git
   ```
2. Open Directory you cloned the project to
   ```sh
   cd path/to/Project-PADS
   ```
3. Source the installer, and let it do the rest.
   ```sh
   sudo source pads_installer
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
### Usage

Usage: pads [-d|f|h|p|v] [ARG][ARG]
Options:

  -f    [name|help][port]     Run any function and exit
  -d                          Install Dependencies and exit
  -h                          Print the Usage and exit
  -p                          Run the Python Module and exit
  -v                          Print the Version and exit
Ex: pads -f help || pads -h || pads -f django testproject 8080 || pads -f django delete testproject

_For more examples, please refer to the [Documentation](https://www.wormhole.click)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] E-commerce Website
    - [ ] Private Messaging on website
    - [ ] POS Sales directly through website (not a third-party).
    - [X] Accounting Database
- [ ] Bash Automation:
    - [ ] Cross Compatable:
       - [x] Manjaro
       - [x] Rasbian
       - [x] Debian
       - [ ] Windows
       - [ ] Mac OS
    - [x] Update Machine
    - [x] Log IP's connected to Modem.
    - [x] History, Success, Error Logs.
    - [x] Notes Log
    - [x] Backup Program
    - [x] Create, Delete, Start Django Project including user.
    - [x] Conky Panels for Sys Info
    - [ ] GUI
- [ ] Automate Customer Assistance:
    - [ ] Speech Module
    - [ ] Machine Learning
    - [ ] Search Distributors to find best prices, and make purchase's when inventory is at a given level.
    - [ ] Possibly search the web for buyers to connect to sellers (Assist in sales).
- [ ] Electron App
- [ ] Android App
- [ ] IOS App

See the [open issues](https://github.com/FrankWilson88/Project-PADS/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

MIT License

Copyright (c) 2022 Joe Corso

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@email_client.com

Project Link: [https://github.com/FrankWilson88/Project-PADS/](https://github.com/FrankWilson88/Project-PADS/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/FrankWilson88/Project-PADS/issues/
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
