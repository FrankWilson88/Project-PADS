<body>
<div id="top"></div>

  <!-- PROJECT LOGO -->
<div class="logo" align="center">

  <h3 align="center">Project PADS</h3>

  <p align="center">
Personal Assistant and Deployment System
    <br />
    <a href="https://github.com/FrankWilson88/Project-PADS"><strong>Explore the docs»</strong></a>
    <br />
    <br />
    <a href="mailto:armyglass@hotmail.com?subject=Project%20PADS%20Bug%20Report">Report Bug</a>
    ·
    <a href="mailto:armyglass@hotmail.com?subject=Project%20PADS%20Request%20Feature">Request Feature</a>
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
        <li><a href="#core-files">Core Files</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#install-arch">Installing Arch</a></li>
        <li>
          <a href="#server">Building Your Server</a>
            <ul>
              <li><a href="#domain">Setting up the Domain</a></li>
              <li><a href="#router">Setting up the Router</a></li>
              <li><a href="#nginx">Installing NGINX</a></li>
              <li><a href="#uwsgi">Installing uWSGI</a></li>
              <li><a href="#python">Write you first Python webpage</a></li>
              <li><a href="#ssl">Writing your SSL</a></li>
              <li><a href="#samba">Installing Samba</a></li>
              <li><a href="#jinja">Using Jinja2 in your project</a></li>
            </ul>
        </li>
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
<details>
<summary>About The Project</summary>
<h1 id="about-the-project">About The Project</h1>

PADS(Personal Assistant and Deployment System) is General Purpose Artificial Intelligence designed to carry out every day business tasks.
It's purpose is to provide book keeping, employee timesheets, client tracking, automation, etc. It can do double entry accounting for hybrid manufacturing companies. 
None of the data is loaded as Environment Variables, so your interaction with PADS is between you and it.
It's original purpose was to serve as a website, with a relational historical database. 
Work on this project began in Python using the Django Framework on June 23, 2021 at 5:30pm.
The accounting database first came online Oct. 13th, 2021 at 11:48pm. The Bash Syntax was first created by Joe Corso on May 4th, 2022. 
It was previously codenamed Project Eniac, to pay homage to the original project of the same name.

<p align="right">(<a href="#top">back to top</a>)</p>
</details>

<details>
<summary>Built With</summary>
<h1 id="built-with">Built With</h1>

<ul>
  <li><a href="https://www.archlinux.org/" target="_blank" title="Arch Linux Documentation page">Arch Linux</a></li>
  <li><a href="https://www.javascript.com/" target="_blank" title="Javascript Documentation page">Javascript</a></li>
  <li><a href="https://www.python.org/" target="_blank" title="Python Documentation page">Python</a></li>
  <li><a href="https://www.djangoproject.com/" target="_blank" title="Django Documentation page">Django</a></li>
  <li><a href="https://www.gnu.org/software/bash/" target="_blank" title="Bash Documentation page">Bash</a></li>
  <li><a href="https://www.mysql.com/" target="_blank" title="MySQL Documentation page">MySQL</a></li>
  <li><a href="https://www.nginx.com/" target="_blank" title="NGINX Documentation page">NGINX</a></li>
  <li><a href="https://uwsgi-docs.readthedocs.io/en/latest/" target="_blank" title="uWSGI Documentation page">uWSGI</a></li>
</ul>
</details>

<details>
<summary>Core Files</summary>
<h1 id="core-files">Core Files</h1>
<ul>
  <li>pads_core/brain/</li>
    <ul>
      <li>pads</li>
      <li>functions.sh</li>
      <li>log_msg.sh</li>
      <li>response.sh</li>
      <li>pads_installer</li>
      <li>setup.sh</li>
      <li>styles.sh</li>
    </ul>
  <li>pads_core/memory/</li>
    <ul>
      <li>audio/</li>
      <li>documents/</li>
      <li>img/</li>
      <li>logs/</li>
      <li>profiles/</li>
      <li>requirements/</li>
        <ul><li>pads_requirements.txt</li></ul>
    </ul>
  <li>pads/prog/</li>
  <li>pads/sandbox/</li>
</ul>
<p align="right">(<a href="#top">back to top</a>)</p>
</details>

</details>


<!-- GETTING STARTED -->
<details>
<summary>Getting Started</summary>
<h1 id="getting-started">Getting Started</h1>

<p>
This is an example of instructions on setting up your project locally.
This will guide you through the process of installing Arch Linux (assumming you have a bootable drive already).
Then installing and configuring NGINX, then intalling and setting up uWSGI with Python, then installing PADS.
I mostly made this guide for my own personal use. If you've stumbled across this Documentation, and find it helpful then that's awesome.
But I didn't make this as a "tutorial", so it most likely won't work for you.
</p>
</details>

<!-- Installing Arch -->
<details>
<summary>Installing Arch Linux</summary>
<h1 id="install-arch">Installing Arch Linux</h1>
<p>If you're not using Arch Linux, skip to <a href="#installation">installation</a>.</p>
<p>PADS has a built in Arch Install script. Use it at your own risk.</p>

<ol>
<li> Verify boot mode</li>
  <ul>
  <li>If this command runs with no errors, you're using EFI Mode.</li>
  <code>ls /sys/firmware/efi/efivars</code>
  </ul> 

<li> Connect to the internet.</li>
  <ul>
  <li>If you're on Ethernet, it should be connected automatically.</li>
  <li>Enable and start <a href="https://wiki.archlinux.org/title/dhcpcd">dhcpcd.service</a></li>
  <code>
  systemctl enable dhcpcd.service<br>
  systemctl start dhcpcd.service
  </code>
  <li>If you're on WIFI, use <a href="https://wiki.archlinux.org/title/Iwd#iwctl">iwd</a>.</li>
  <code>
  iwctl<br>
  device list<br>
  station device scan<br>
  station device get-networks<br>
  station device connect SSID<br>
  </code>
  <li>Ping something...</li>
  <code>
  ping www.google.com
  </code>
  </ul>

<li> Update system clock</li>
  <code>
  timedatectl set-ntp true<br>
  timedatectl set-timezone America/New_York<br>
  timedatectl status<br>
  </code>

<li> Partition the disk. I use <a href="https://wiki.archlinux.org/title/fdisk">fdisk</a>. DO NOT OVERWRITE REDUNDANT STORAGE!!!!</li>
  <ul>
  <li>List devices, and choose your device</li>
  <code>fdisk -l</code>
 
  <li>Change shell to fdisk</li>
  <code>fdisk /dev/sda</code>
  
  <ul>
  <li>EFI Boot Mode:</li>
    <ul>
    <li>Build partition table</li>
    
    <code>
    n # /mnt/boot partition<br>
    p # primary partition<br>
    1 # /dev/sda1<br>
    "" # first block default<br>
    +512M # last block 512mb<br>
    t # type of partition<br>
    ef # Linux filesystem<br>
    n # swap partition<br>
    p # primary partition<br>
    3 # /dev/sda3<br>
    "" # first block default<br>
    +2G # last block 2gb<br>
    t # type of partition<br>
    3 # to pick sda3<br>
    82 OR swap # swap filesystem<br>
    n # /mnt partition<br>
    p # primary partition<br>
    4 /dev/sda4<br>
    "" # first block default<br>
    "" # last block takes rest of space<br>
    w # write partition table<br>
    q # quit fdisk<br>
    </code>
    
    <li>Make filesystem</li>
    <code>
    mkfs.fat -F 32 /dev/sda1<br>
    mkswap /dev/sda3<br>
    mkfs.ext4 /dev/sda4<br>
    </code>
    
    <li>Mount filesystem</li>
    <code>
    mount --mkdir /dev/sda1 /mnt/boot<br>
    swapon /dev/sda3<br>
    mount /dev/sda4 /mnt<br>
    </code>
    </ul>
  </ul>

  <ul>
  <li>BIOS Boot Mode:</li>
    <ul>
    <li>Build partition table</li>
    <code>
    n # /mnt partition<br>
    p # primary partition<br>
    1 # partition number<br>
    "" # first block default<br>
    +500G # last block (make it as big as you want)<br>
    t # type of filesystem<br>
    83 # linux filesystem<br>
    a # bootable flag<br>
    1 # partition number to make bootable<br>
    n # swap partition<br>
    p # primary partition<br>
    3 # partition number<br>
    "" # first block default<br>
    +2G # last block partition<br>
    t # type of filesystem<br>
    3 # partition number<br>
    82 OR swap # swap filesystem<br>
    w # write partition table<br>
    q # quit fdisk<br>
    </code>

    <li>Make filesystem</li>
    <code>
    mkfs.ext4 /dev/sda1<br>
    mkswap /dev/sda3<br>
    swapon /dev/sda3<br>
    </code>
    
    <li>Mount filesystem</li>
    <code>
    mount /dev/sda1 /mnt
    </code>
    </ul>
  </ul>
  </ul>

<li> Backup and Select your mirrorlist</li>
  <code>
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak<br>
  reflector --verbose -c "US" -f 12 -l 50 -n 12 --sort rate --protocol https --save /etc/pacman.d/mirrorlist <br>
  cat /etc/pacman.d/mirrorlist<br>
  </code>
  
<li> Install Essential Packages</li>  
  <code>
  pacstrap /mnt base linux linux-firmware neofetch fakeroot nano sudo man-db man-pages texinfo lshw upower dhcpcd iwd networkmanager 
  </code>
    <ul>
    <li>If you're using a hypervisor install proper guest utilities</li>
    <code>
    pacstrap /mnt virtualbox-guest-utils && systemctl enable vboxservice.service && systemctl start vboxservice.service 
    </code>
    </ul>
    
<li> Configure the system</li>
<code>
genfstab -U /mnt >> /mnt/etc/fstab
</code>

<li> Change root</li>
<code>
arch-chroot /mnt
</code>

<li> Configure timezone for system</li>
<code>
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime<br>
hwclock --systohc<br>
</code>

<li> Set device locale</li>
  <ul>
  <li> Manually edit /etc/locale.gen and uncomment your locale (ig: en_US.UTF-8) OR run the following command</li>
  <code>
  sed -i "s/#en_US.UTF-8 UTF8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
  </code>

  <li> Generate locale file</li>
  <code>
  locale-gen
  </code>
  
  <li> Manually edit /etc/locale.conf OR run the following command</li>
  <code>
  echo "LANG=en_US.UTF-8" >> /etc/locale.conf
  </code>
  </ul>

<li> Create hostname, host, and user, enable dhcpcd.service</li>
  <code>
  systemctl enable dhcpcd.service<br>
  echo "${hostname}" > /etc/hostname<br>
  echo "127.0.0.1 localhost" >> /etc/hosts<br>
  echo "::1 localhost" >> /etc/hosts<br>
  echo "127.0.1.1 ${hostname}" >> /etc/hosts<br>
  passwd # this is for root password NOT the user<br>
  useradd -m ${user} # add your user<br>
  passwd ${user} # enter your user password<br>
  sudo nano /etc/sudoers<br>
  ${user} ALL=(ALL:ALL) ALL" >> /etc/sudoers<br>
  </code>
  
<li> Install Bootloader (I'm using GRUB)</li>
  <ul>
  <li>EFI Bootloader</li>
  <code>
  pacman -Syu grub efibootmgr<br>
  mount --mkdir /dev/sda1 /boot/efi<br>
  grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB<br>
  grub-mkconfig -o /boot/grub/grub.cfg<br>
  </code>
  </ul>

   <ul>
   <li> BIOS Bootloader</li>
   <code>
   pacman -Syu grub
   grub-install --target=i386-pc /dev/sda
   grub-mkconfig -o /boot/grub/grub.cfg
   </code>
   </ul>

<li>Exit Chroot and Reboot</li>
  <code>
  exit<br>
  reboot
  </code>

<li>Post install</li>
  <ul>
  <li>This installs xfce4</li>
  <code>
  sudo pacman -Syu xorg xorg-service xorg-apps xterm xfce4 xfce4-goodies
  </code>
  <li> Change .xinitrc</li>
  <code>
  sudo nano ~/.xinitrc<br>
  exec startxfce4
  </code>
  </ul>
</ol>
<p align="right">(<a href="#top">back to top</a>)</p>
</details>

<details>
<summary>Building your Server</summary>
<h1 id="server">Building your server</h1>
<ol>
<li id="domain"> Setting up the Domain</li>
<p>You must have a domain name. I use <a href="https://www.dynu.com/" target="_blank" title="Dynu Home Page">Dynu dns</a>. There are different way to set up the domain name to work. So you'll have to source the documentation yourself if you choose to use a different registrar. <a href="https://www.dynu.com/en-US/Resources/Tutorials" target="_blank" title="Dynu Tutorial Page">This</a> is the link for the resources from Dynu. Also, if you need a Dynamic DNS, but your router doesn't support it. They have open source software written in python that you can use to automatically update your ip address.</p>

  <ul>
  <li> Log in to your account at <a href="https://www.dynu.com/" target="_blank" title="Dynu Log in Page">Dynu dns</a>.</li>
  <li> Change the "A Record", for Dynu:</li>
    <ul>
    <li> Click on DDNS Service</li>
    <li> Click on the Domain you want to use</li>
    <li> Change the IPv4 Address to the address of your Router</li>
    <li> Click Save</li>
    </ul>
  </ul>
  
<li id="router"> Setting up the Router</li>
<p>There are a lot of ways you may need to tinker with it, and depending on your ISP, you may not be allowed to host a home website. I use Century Link, which fortunately allows to do just about anything you want with your internet, unless it's illegal of course. Lack luster documentation for Century Link Port Forwarding is <a href="https://www.centurylink.com/home/help/internet/modems-and-routers/advanced-setup/port-forwarding.html" target="_blank" title="Century Link Port Forwarding Page">here</a>.</p>
  <ul>
  <li> Log into your router. Usually at <a href="https://192.168.0.1" target="_blank" title="Router IP">https://192.168.0.1</a></li>
  <li> Click on "Advanced Setup"</li>
  <li> The left-hand panel under "Security" click "Port Forwarding"</li>
  <li> Enter the IP Address of the device serving the website.</li> 
  <ul>
    <li>If you're not sure, type <code>ip address</code> in the terminal. You can also click "Select Device", and from the dropdown click the device.</li>
  </ul>
  <li> You don't need to enter an LAN Starting Port.</li>
  <li> Select "TCP" from "Select Protocol".</li>
  <li> For WAN Starting and Ending Port, enter "80".</li>
  <li> For Source IP State select "All IP Addresses".</li>
  <li> Click Apply</li>
  <li> Do the same for port 443.</li>
  </ul>

<li id="nginx"> Installing nginx</li>
<p>
There are thousands of tutorials that have thousands of ways of setting up nginx (or any web server), and most of them suck the biggest hairiest set of monkey balls you can think of. I've found the most success by just reading the <a href="https://wiki.archlinux.org/title/Nginx">Arch Linux</a>, and <a href="https://nginx.org/en/docs/">nginx</a> documentation; and the <a href="https://nginx.org/en/docs/beginners_guide.html">beginner guide</a>, and the <a href="https://www.nginx.com/resources/wiki/start/">getting started</a> page. I found a few helpful tidbits on setting up the project directory, and a bare minimum configuration <a href="https://gist.github.com/janoliver/127091de8185cd8557ad">here</a>.<br>
Also, the docs assume you'll use the defaule location for your config files. I like to keep them with my project, so I add the line: <code>include /srv/http/*/nginx.conf;</code> in the /etc/nginx/nginx.conf file, which will check each project directory for an nginx.conf file and read from there. More on that when we get there.
</p>
  
  <ul>
  <li> Install nginx. Arch Linux recommends nginx-mainline</li>
  <code>
  sudo pacman -Syu nginx-mainline
  </code>
  
  <li> Enable/Start services</li>
  <code>
  sudo systemctl enable nginx.service<br>
  sudo systemctl start nginx.service<br>
  </code>
  
  <li> You should see the default page at <a href="http://127.0.0.1" target="_blank" title="localhost">http://127.0.0.1</a> located at /usr/share/nginx/html/index.html</li>
  
  <li> Backup the default config file</li>
  <code>
  sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
  </code>
  
  <li> Set the configurations at /etc/nginx/nginx.conf</li>
  <code>
  sudo nano /etc/nginx/nginx.conf
  </code>
  
  <ul>
  <li> All server blocks must be nested in the http block.</li>
  <li> This is a sample of the default file:</li>
  </ul>
  <pre>
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
  </pre>
  <li> Uncomment <code>user http;</code></li>
  <li> Uncomment <code>work_processes 1;</code></li>
    <ul><li> The docs suggest setting it to the amount of hardware threads you have. But you can also use <code>auto</code>, and it will detect optimal value.</li></ul>
  <li> Uncomment <code>gzip on;</code></li>
  <li> This is where I would add the line <code>include /srv/http/*/nginx.conf;</code></li>
  <li> Make your config file for your project in the project directory</li>
  <code>
  sudo nano /srv/http/example/nginx.conf
  </code>
  
  <li> Create a server block in your example/nginx.conf: (This is the bare minimum).</li>
  <pre>
  server {
      listen 80;
      server_name example.YOURDOMAIN;

      error_log /srv/http/example/log/nginx.error.log;
      access_log /srv/http/example/log/nginx.access.log;

      root /srv/http/example;
      index index.html;
   }
  </pre>
  
  <li> Make a directory for your project, add basic webpage</li>
  <code>
  sudo mkdir /srv/http/example /srv/http/example/log /srv/http/example/htdocs /srv/http/example/run /srv/http/example/htdocs/static /srv/http/example/htdocs/static/css /srv/http/example/htdocs/static/js /srv/http/example/htdocs/static/img<br>
  touch /srv/http/example/log/nginx.error.log<br>
  touch /srv/http/example/log/nginx.access.log<br>
  sudo nano /srv/http/example/index.html<br>
  echo "hello world" >> /srv/http/example/htdocs/index.html<br>
  </code>
  
  <li> Reload nginx services</li>
  <code>
  sudo systemctl reload nginx.service
  </code>
  
  <li> Go to your website on the browser and it should show up. It doesn't have an SSL yet.</li>
  
  <li> Backup your computer</li>
  <code>
  sudo rsync -aAXHx --exclude={"/dev/*", "/proc/*", "/sys/*", "/tmp/*", "/run/*", "/mnt/*", "/media/*"} / /path/to/your/backup/folder --verbose
  </code>
  
  <li> If you have issues chech</li>
  <code>
  sudo systemctl status nginx.service
  </code>
  
  <li> If you get the error: <code>could not build optimal types_hash</code> add <code>types_hash_max_size 4096;</code> to /etc/nginx/nginx.conf under http{}</li>
  </ul>

<li id="uwsgi"> Setting up uWSGI</li>
<p>I got a lot of help from this Github user, so many thanks to him, <a href="https://gist.github.com/janoliver/127091de8185cd8557ad" target="_blank" title="Janoliver Github Page">here</a>. Here's a quick <a href="https://uwsgi-docs.readthedocs.io/en/latest/WSGIquickstart.html" target="_blanke" title="uWSGI Documentation">guide</a> to setting up uWSGI for Python. Here's a <a href="https://uwsgi-docs.readthedocs.io/en/latest/Nginx.html" target="_blanke" title="NGINX with uWSGI">guide</a> to setting up NGINX with uWSGI. Basically, the following steps will get a basic Python app running.
<ul>
<li>Install uWSGI</li>
  <code>sudo pacman -Syu uwsgi uwsgi-plugin-python</code>
<ul>
  <li>The packages do not include any init scripts or systemd services. Therefore, create the file /etc/systemd/system/uwsgi.service with the following content:</li>
  <pre>
  [Unit]
  Description=uWSGI Server

  [Service]
  ExecStart=/usr/bin/uwsgi --emperor "/srv/http/*/uwsgi.ini" --uid=http --gid=http --vassals-inherit /srv/http/base.uwsgi.ini
  SuccessExitStatus=30
  ExecReload=/bin/kill -HUP $MAINPID
  KillSignal=SIGINT
  Restart=always
  Type=notify
  NotifyAccess=all

  [Install]
  WantedBy=multi-user.target
  </pre>
  <p>The unit spawns the uwsgi emperor who looks in /srv/http/*/uwsgi.ini for application-specific uwsgi configuration files. The processes are started as the http user and group. All configuration files will share the content in /srv/http/base.uwsgi.ini. This is to save typing in additional config files.
  </p>

  <li>Configure to for using uWSGI</li>
  <ul>
  <li>First, set up the base uwsgi config file /srv/http/base.uwsgi.ini mentioned above:</li>
  <pre>
  [uwsgi]
  uid = http
  gid = http
  </pre>
  <p>Though these two lonely directives seem funny, this would be the place to put config entries, that are shared by all the vassals, i.e., the actual applications in /srv/http. An option in a vassal's uwsgi.ini always overrides the value in the base.uwsgi.ini.</p>
  <li>Now, let us configure our project to be served via uwsgi. Edit the /srv/http/example/uwsgi.ini file and insert the following:</li>
  <pre>
  [uwsgi]
  plugin = python
  socket = %drun/%n.sock
  chdir = %dhtdocs
  wsgi-file = index.py
  master = True
  pidfile = %drun/%n.pid
  logto = %dlog/%n.log
  </pre>
  <li>Configure NGINX to talk to uWSGI</li>
  <p>In the section above, we defined a socket location for uwsgi. We will now configure nginx to use that socket when it wants to talk to uwsgi. Edit /srv/http/example/nginx.conf and change it to the following snippet:(The second "location block" will serve the static files of your webpage.)</p>
  <pre>
  server {
    listen 80;
    server_name example.YOURDOMAIN;

    error_log /srv/http/example/log/error.log;
    access_log /srv/http/example/log/access.log;

    root /srv/http/example;

    location / {
            include uwsgi_params;
            uwsgi_modifier1 30;
            uwsgi_pass unix:/srv/http/example/run/uwsgi.sock;
    }

    location /htdocs/static/ {
    }
  }
  </pre>
  <li>If you need to serve more then one website. Set up individual server blocks:</li>
  <pre>
  server {
  listen 80;
  server_name www.example.com example.com;

  error_log /srv/http/example/log/nginx.error.log;
  access_log /srv/http/example/log/nginx.access.log;

  location / {
    root /srv/http/example;
    include uwsgi_params;
    uwsgi_modifier1 30;
    uwsgi_pass unix:/srv/http/example/run/uwsgi.sock;
  }
    
  location /htdocs/static/ {
    root /srv/http/example;
  } 
  }
  </pre>
  </ul>

</ul>
</ul>
<li id="python">Writing your first Python webpage</li>
<ul>
<li>The last step for running our python app is the application itself. We will simply use the example from Wikipedia. Edit /srv/http/example/htdocs/index.py and insert the following lines of python code:</p>
<pre>
def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return b```Hello World from python!\nBrought to you by Carls Jr.```
</pre>
<li>Start uWSGI Service and reload NGINX Service</li>
<code>
sudo systemctl start uwsgi.service<br>
sudo systemctl reload nginx.service
</code>
<li>Change Directory Permissions</li>
<code> sudo chown -R http:http /srv/http/example</code>
<li> Check for any errors with</li>
<code>
systemctl status nginx.service<br>
systemctl status uwsgi.service<br>
sudo nginx -t && nginx -s reload
</code>
<li>Pull up your domain in the browser to see "Hello from Python!"</li>
<li>If you want to read from a premade .html file, follow this:</li>
<pre>
def application(env, start_response):
    index_file = open('index.html', 'r').read()
    start_response('200 OK', [('Content-Type','text/html'), ('Content-Length', str(len(index_file)))])
    yield index_file.encode('utf-8')
</pre>
<li>To add links, edit your /srv/http/example/uwsgi.ini file:</li>
<ul>
<li>More documentation <a href="https://uwsgi-docs.readthedocs.io/en/latest/StaticFiles.html" target="_blank" title="uWSGI Snippets">here</a>.</li>
<li>For some reason the Docs say it should be "true", but it must be "True".</li>
</ul>
<pre>
mount = /about=about.py
mount = /otherlink=otherlink.py
manage-script-name = True
</pre>
</ul>

<li id="ssl"> Setting up an SSL</li>
<p>We will use <a href="https://letsencrypt.org/" target="_blank" title="Let's Encrypt official page">Let's Encrypt</a> it uses a command called <a href="https://wiki.archlinux.org/title/Certbot" target="_blank" title="ArchWiki for Certbot"><code>certbot</code></a></p>
<ul>
<li>If it's not installed by default, install it, and the nginx plugin.</li>
<code>sudo pacman -Syu certbot certbot-nginx</code>
<li>Let Certbot do it's thing</li>
<code>sudo certbot --nginx -d www.example.com -d example.com</code>
<li>Basically, it sets up all the proper files and folders and configs for an SSL for your website. Here is a sample output:</li>
<pre>
server {
  listen 80;
  server_name www.example.com example.com;

  error_log /srv/http/example/log/nginx.error.log;
  access_log /srv/http/example/log/nginx.access.log;

  root /srv/http/armyglass;

  location / {
    include uwsgi_params;
    uwsgi_modifier1 30;
    uwsgi_pass unix:/srv/http/example/run/uwsgi.sock;
  }
    
  location /htdocs/static/ {
  }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/www.example.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/www.example.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
    
}
server{
    listen 80;
    server_name www.example.com example.com;
    return 404; # managed by Certbot
    if ($host = example.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = www.example.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot
}
</pre>
<li>You should be able to reload your website, and see https://. Also, if you try http:// it should redirect.</li>
<li>You can add these entries to your /etc/hosts page to help harden your system: <a href="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts" target="_blank" title="Steven Black Github">Blacklist Social Media</a></li>
</ul>

<li id="#samba">Install Samba</li>
  <p>I like to use Samba, so that I can use a different computer as a development environment; and I don't have to stay logged directly into the server. To sync up the files I'll make an alias for the project, and use rsync to update the server files after I've ssh'ed into the server from a terminal. So basically, install Samba to the Server, install ssh, add the rsync alias to the ~/.bashrc file, set up your Raspberry Pi, ssh into the server, copy all prodo files to the pi, develop on the pi, and rsync the files to the server. Example rsync:</p>
  <code>alias project_name="sudo rsync -av --no-perms --no-owner --no-group --exclude='project_name/run/*' --exclude='project_name/log/*' /usr/local/bin/pads_core/prog/websites/python/project_name /srv/http; sudo systemctl reload uwsgi.service && sudo systemctl reload nginx.service"</code>
  <ul>
    <li>Install to your system</li>
    <code>sudo pacman -Syu samba</code>
    <li>Add a base entry to your /etc/samba/smb.conf</li>
    <pre>
    [sambashare]
    comment = Samba on Ubuntu
    path = /home/username/sambashare
    read only = no
    browsable = yes
    </pre>
    <li>Start the service</li>
    <code>
    sudo systemctl enable smb.service<br>
    sudo systemctl start smb.service
    </code>
    <li>Create password for user</li>
    <code>sudo smbpasswd -a $username</code>
    <li>Connect to a Samba Share</li>
  </ul>
  
<li id="#jinja">Using Jinja2 in your project</li>
  <p>The hardest part I couldn't figure out was that the website couldn't find the Jinja2 files. I was coming across this issue because I was trying to install Jinja as my user and not the http user. If you install it as your user pip installs the library under ${HOME}/site-packages. That's fine and dandy, except earlier in the project we set up NGINX to log into the site as http, and not me (or you). That's good too, except when we develop, we're developing as me, and when we update the website; it logs in as http. So it wont find ${HOME}/site-packages, it doesn't exist. Plus, http user doesn't have super user access, or any access beyond =rw. So it won't find the library, and as hard as you try it won't elevate access to get to the library. So once we understand that, we can move on.</p>
  <ul>
    <li>Make sure your http user has proper read write access to your website files. If you want to set up a home folder for your http user and make a virtual env, you can finagle your machine however you want.</li>
    <code>sudo chown -R http:http /srv/http</code><br>
    <code>sudo chmod -R =rw /srv/http</code>
    <li>Log into http user</li>
    <code>su http</code>
    <li>Install Jinja2. If you didn't make a home folder for http, it'll create /srv/http/.local for your libraries to live. If you're ok with that, there's nothing symantically wrong with that.</li>
    <code>pip install jinja2</code>
    <li>OR don't log into http, and do this from your user instead</li>
    <code>sudo -H -u http pip install --user jinja2</code>
    <li>There's all these fancy tutorials that look really confusing on how to set up jinja, but all you gotta do is change your index.py, or whatever file. After that, start using it. Notice FileSystemLoader is where it's finding your templates and base.html. So if you like templates in a directory the traditional way, that's where you would change that. That class right there is where it searches for "base.html" and loads "index.html" fills in the templates and elements, and bob's your uncle. Also, from this point forward, install all python libraries the same way. I left the mysql.connector there as a hint. In terms of the CVM method, this is your "views".</li>
    <pre>
    #!/bin/python
    from jinja2 import Environment, FileSystemLoader, select_autoescape
    #import mysql.connector

    def application(env, start_response):
      index_file = open('static/html/index.html', 'r').read()
      #db=mysql.connector.connect(user="root",host="localhost")
      file_loader = FileSystemLoader('static/html')
      env = Environment(loader=file_loader,autoescape=select_autoescape())
      template = env.get_template('index.html')
      output = template.render()
      start_response('200 OK', [('Content-Type','text/html'), ('Content-Length', str(len(output)))])
      yield output.encode('utf-8')
    </pre>
  </ul>

<p align="right">(<a href="#top">back to top</a>)</p>
</ol>
</details>

<details>
<summary>Installing PADS</summary>
<h1 id="installation"> Installing PADS</h1>
<ol>
<li> Prerequisites</li>
  <ul>
  <li>If you are on Arch Linux, you can update first. The installer also updates before it installs anything.</li>
  <code>
  sudo pacman -Syyu
  </code>
  <li>If you are on Rasbian/Debian, you can update first. The installer also updates before it installs anything.</li>
  <code>
  sudo apt-get update && sudo apt-get upgrade
  </code>
  </ul>

<li> Installation</li>
  <ul>
  <li>Download the .tar and installer</li>
   <ul><li>Start by downloading the <a href="https://www.wormhole.click/pads_download/pads_installer" download>installer</a> and <a href="https://www.wormhole.click/pads_download/pads_v1.1.0.tar.gz" download>.tar file</a> OR:</li></ul>
   <code>
   wget www.wormhole.click/pads_download/pads_installer <br>
   wget www.wormhole.click/pads_download/pads_v1.1.0.tar.gz  
   </code>
   <li>Open Directory you cloned the project to</li>
   <code>
   cd path/to/download
   </code>
   <li>Source the installer, and let it do the rest.</li>
   <code>
   sudo source pads_installer
   </code>
  </ul>

<p align="right">(<a href="#top">back to top</a>)</p>
</ol>
</details>


<!-- USAGE EXAMPLES -->
<details>
<summary>Usage</summary>
<h1 id="usage"> Usage</h1>
<p>Type <code>pads -h</code> to see the Usage page.</p>
<pre>
Usage: pads [-d|f|h|p|v] [ARG][ARG]
Options:

  -f    [name|help][port]     Run any function and exit
  -d                          Install Dependencies and exit
  -h                          Print the Usage and exit
  -p                          Run the Python Module and exit
  -v                          Print the Version and exit
Ex: pads -f help || pads -h || pads -f django testproject 8080 || pads -f django delete testproject
</pre>

<p>Type <code>pads -f help</code> to see the Functions Usage page. This is the meat and potatoes of PADS. You'll find the code for it at <code>pads_core/brain/functions.sh</code>. I still have a lot more features I plan on adding. Some of these so far, are pretty self explanitory.</p>
<pre>
  Use Various Functions with one command

  Usage: pads -f [ARG][ARG]
  Options: 
    update                                Update your Computer.
    lost                                  pwd and ls command with some zazz.
    software                              Show Software Stack
    showcolors                            Show printable colors.
    conkystart                            Start Conky Panels
    iplog                                 Log all IP's on the Modem
    backup                                Backup Machine Locally
    note      [list]                      Make, List notes. If blank make new note.
    django    [name|delete][port|name]    Start, Create, or Delete a Django Project.
</pre>

<p>Each function has a built in History Log, Success Log, and Error Log; located at <code>pads_core/memory/logs</code>. The code for the log functions is located at <code>pads_core/brain/log_msg.sh</code>.</p>
<p>Type <code>pads -d</code> to install the dependancies. The command runs <code>source setup.sh</code>, which is inside <code>pads_core/brain/setup.sh</code>. You'll see that it installs the dependancies listed at <code>pads_core/memory/requirements/pads_requirements.txt</code>. You can add software by just adding the library to the list.</p>
<p>Type <code>pads -f lost</code> and it just runs both pwd and ls.</p>
<p>Type <code>pads -f software</code> to see what stack you have so far. I would like to fill this out more. For now, it just shows your Desktop name, Greeter, if you have ruby or python, heroku, and active virtual env, etc. If it doesn't exist it throws an error so that needs to be supressed.</p>
<p>Type <code>pads -f showcolors</code> to print all the colors usable in the terminal, with the hex code for each. It's handy for adding colors to the scripts when you run them in a terminal, but other then that it doesn't do much.</p>
<p>Type <code>pads -f conkystart</code> to start the conky panels. If you look under <code>pads_core/prog/conky</code> you'll see the code for the panels, and you can edit them however. If you look under <code>pads_core/brain/functions.sh</code> starting at line 98 is the conkystart function. You'll see that 2 of the 3 panels are commented out. On lower end machines the panels will freeze your computer if they all load.</p>
<p>Type <code>pads -f iplog</code> to see all the ip addresses connected to your modem/router. It uses zenity as a GUI, and so, is a dependancy. I don't believe zenity is compatible on Debian. It's something I need to fix. You can see the text file located at <code>pads_core/memory/logs/iplog.txt</code>.</p>
<p>Type <code>pads -f backup</code> just backs up PADS into a .tar file. It saves it at <code>pads_core/memory/backup</code>. When you backup PADS it skips over the previous backup, otherwise it would be like inception; a backup inside a backup inside a backup...On my machine I added rsync to back up my entire system to a server. For security I removed it from the open source program, but you can add your own.</p>
<p>Type <code>pads -f note</code> to show an input box to write a note. It's located at <code>pads_core/memory/logs/note.txt</code>. It's pretty basic, but I don't use it for a daily tasks list, more just for a mental dump of notes while I work on PADS. Like a workflow for updating PADS. Type <code>pads -f notes list</code> to see all current notes.</p>
<p>Type <code>pads -f django projectname 8080</code> to start a Django Project named projectname on port 8080. If the project doesn't exist it'll create the project and the super user. Add all requirements for the project to <code>pads_core/memory/requirements/projectname_requirements.txt</code>. You can see the code for creating the Django project, and profile at <code>pads_core/brain/functions.sh</code> starting at line 182. Delete a Django Project by typing <code>pads -f django delete projectname</code>.</p>

For more examples, please refer to the <a href="https://www.wormhole.click/pads" target="_blank" title="wormhole.click">Documentation</a>.
<p align="right">(<a href="#top">back to top</a>)</p>
</details>


<!-- ROADMAP -->
<details>
<summary>Roadmap</summary>
<h1 id="roadmap"> Roadmap</h1>

<pre>
- [ ] E-commerce Website
    - [ ] Private Messaging on website
    - [ ] POS Sales directly through website (not a third-party).
    - [X] Accounting Database
- [ ] Bash Automation:
    - [ ] Cross Compatable:
       - [x] Arch Linux
       - [x] Manjaro
       - [x] Rasbian
       - [x] Debian
       - [ ] Windows
       - [ ] Mac OS
    - [x] Update Machine
    - [x] Automated Arch Linux installer.
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
</pre>
<p>See the <a href="https://github.com/FrankWilson88/Project-PADS/issues" target="_blank" title="Github Account">issues</a> for a full list of proposed features (and known issues).</p>

<p align="right">(<a href="#top">back to top</a>)</p>
</details>


<!-- CONTRIBUTING -->
<details>
<summary>Contributing</summary>
<h1 id="contributing"> Contributing</h1>

<p>
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.
</p>
<p>
If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
</p>
<p>Don't forget to give the project a star! Thanks again!</p>
<ol>
<li> Fork the Project</li>
<li> Create your Feature Branch (`git checkout -b feature/AmazingFeature`)</li>
<li> Commit your Changes (`git commit -m 'Add some AmazingFeature'`)</li>
<li> Push to the Branch (`git push origin feature/AmazingFeature`)</li>
<li> Open a Pull Request</li>
</ol>
<p align="right">(<a href="#top">back to top</a>)</p>
</details>


<!-- LICENSE -->
<details>
<summary>License</summary>
<h1 id="license"> License</h1>

<p>
MIT License <br><br>

Copyright (c) 2022 Joe Corso <br><br>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
<br><br>
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
<br><br>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</p>
<p align="right">(<a href="#top">back to top</a>)</p>
</details>


<!-- CONTACT -->
<details>
<summary>Contact</summary>
<h1 id="contact"> Contact</h1>

<p>Joe Corso - <a href="mailto:armyglass@hotmail.com?subject=Project%20PADS">armyglass@hotmail.com</a>

<p>Project Link: <a href="https://github.com/FrankWilson88/Project-PADS/" target="_blank" title="PADS on Github">Project PADS</a>

<p align="right">(<a href="#top">back to top</a>)</p>
</details>


<!-- ACKNOWLEDGMENTS -->
<details>
<summary>Acknowledgments</summary>
<h1 id="acknowledgments"> Acknowledgments</h1>
<ul>
<li>[]()</li>
<li>[]()</li>
<li>[]()</li>
</ul>
<p align="right">(<a href="#top">back to top</a>)</p>
</details>

</body>
</html>

