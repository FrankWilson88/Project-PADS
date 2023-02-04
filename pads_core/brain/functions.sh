#!/usr/bin/bash

############################################################
# 													Help                           #
############################################################
help()
{
   # Display Help
   echo "  Use Various Functions with one command"
   echo
   echo "  Usage: pads -f [ARG][ARG]"
   echo "  Options: "
   echo "    update                                Update your Computer."
   echo "    lost                                  pwd and ls command with some zazz."
   echo "    software                              Show Software Stack"
   echo "    showcolors                            Show printable colors."
   echo "    conkystart                            Start Conky Panels"
   echo "    iplog                                 Log all IP's on the Modem"
   echo "    backup                                Backup Machine Locally"
   echo "    note      [list]                      Make, List notes. If blank make new note."
   echo "    django    [name|delete][port|name]    Start, Create, or Delete a Django Project."
}
############################################################
############################################################
# 											Main program                       #
############################################################
############################################################


#
# Misc Functions
#

update(){
	historyFunction "Running:Update"
	notify-send "Updating your system." -i "${IMG_PATH}/logos/weLogo.png"
	if [[ ${distro} == 'NAME="Manjaro Linux"' || ${distro} == 'NAME="Arch Linux"' ]]; then
          echo ${green} "I'm updating your shit, $(whoami)..." ${r}
          sudo pacman -Syyu
          successFunction "Updated OS"   
	elif [[ ${distro} == 'NAME="Debian GNU/Linux"' || ${distro} == 'NAME="Raspbian GNU/Linux"' ]]; then
          echo ${green} "I'm updating your system, $(whoami)..." ${r}
          sudo apt-get update && sudo apt-get upgrade
          successFunction "Updated OS"
        else
	  errorFunction "Error:updateFunction"
	fi
}

lost(){
	historyFunction "Running:lost"
	echo ${green}"Can't find your way again, $(whoami)?"${r};
	echo "";
        echo $(which pads);
        echo $(which pads_core);
	echo "--File Path--";
	pwd;
	ls;
	echo "";
}

software(){
	historyFunction "Running:software"
	echo ${green}"Here's the Software Stack you're using, $(whoami)."${r}
	echo "";
	echo ${yellow}"--Software Stack--"
	echo "Desktop Env: $echo $XDG_CURRENT_DESKTOP"
	echo "Current Greeter: $(ls -1 /usr/share/xgreeters/)"
	echo "Python: $(python --version)"
	echo "PIP: $(pip --version)"
	echo "Django: $(python -m django --version)"
	echo "Ruby: $(ruby --version)"
	echo "Rails: $(rails --version)"
	echo "PHP: $(php -v)"
	echo "Heroku: $(heroku --version)"
	echo "Git: $(git --version)"
	echo "Apache: $(httpd -v)"
	echo "MySQL: $(mysql --version)"
	inxi --optical
	if ! test -e workon; then
		echo "--- No active Virtual Env ---"
	else
		echo "-- Virtual Env Software --
		$(pip list)"${r}
	fi
}

showcolors(){
	historyFunction "Running:showcolors"
	for C in {0..255}; do
		tput setab $C
		echo -n "$C "
	done
	tput sgr0
	echo
}

conkystart(){
	conky -d -c ${PROG_PATH}/conky/conky_local_sys_panel
	#conky -d -c ${PROG_PATH}/conky/conky_local_log_panel
	#conky -d -c ${PROG_PATH}/conky/conky_local_info_panel
}

iplog(){
	historyFunction "Running:Network Sniffer"
	zenity="/usr/bin/zenity"
	if ! command -v nmap &> /dev/null; then
		echo "--- You need to install nmap ---"
		echo "yes" | update
		echo "yes" | sudo pacman -S nmap
		successFunction "Installed:nmap"
		echo "Checking IPs..."
		sudo nmap -sn 192.168.0.0/24 > ${IP_LOG}
	  	zenity --title="Network IPs" --text-info --filename=${IP_LOG} --width=500 --height=200
	elif command -v nmap &> /dev/null; then
		echo "Checking IPs..."
		sudo nmap -sn 192.168.0.0/24 > ${IP_LOG}
	  	zenity --title="Network IPs" --text-info --filename=${IP_LOG} --width=500 --height=200
	else
		errorFunction "Error:networksnifferFunction"
	fi
}

note(){
	if [[ $1 == "list" ]]; then
		echo "---Notes---"
		cat ${LOG_PATH}/notes.txt
		exit
	else
		read -p "Note: " note
		echo "$(date) - ${note}" >> ${LOG_PATH}/notes.txt
	fi
}

#
# Local and Server Backup
#
backup(){
	historyFunction "Running:Local Backup"
	notify-send "Backing up PADS" -i "${IMG_PATH}/logos/weLogo.png"
	if [[ -d ${BACKUP_PATH} ]]; then
		echo ${green}"Backing up ${PADS_PATH}, pads"
		cd /usr/local/bin/
		sudo tar -czvf ${PADS_BACKUP} --exclude="pads_core/memory/backup" pads pads_core
		cd ${BACKUP_PATH}
		sudo cp  "$(ls | tail -n 1)" ${MEMORY_PATH}/backup
		sudo cp  "$(ls | tail -n 1)" ${SERVER_PATH}                
		echo "Copied to ${MEMORY_PATH}/backup and ${SERVER_PATH}"
		successFunction "Local Backup: /pads/"
		cd ~
                echo "Backing up your system..."
                sleep 2
                sudo rsync -aAXHx --exclude={"/dev/*", "/proc/*", "/sys/*", "/tmp/*", "/run/*", "/mnt/*", "/media/*"} / /run/mount/storage/backup/arch_backup --verbose
                echo ${green}"Finished backing up your system!"${r}
	        notify-send "Finished backing up your system!" -i "${IMG_PATH}/logos/weLogo.png"
		successFunction "Full System Backup."
	elif [[ ! -d ${BACKUP_PATH} ]]; then
		sudo mkdir ${BACKUP_PATH}
		echo ${green}"Successfully created: ${BACKUP_PATH}"
		historyFunction "MkDir: pads_backup"
		echo ${green}"Backing up ${PADS_PATH}, pads"
		cd /usr/local/bin/
		sudo tar -czvf ${PADS_BACKUP} --exclude="${MEMORY_PATH}/backup" pads pads_core
		cd ${BACKUP_PATH}
		cp "$(ls | tail -n 1)" ${MEMORY_PATH}/backup/
		sudo cp  "$(ls | tail -n 1)" ${SERVER_PATH}                
		echo "Copied to ${MEMORY_PATH}/backup/ and ${SERVER_PATH}"
		successFunction "Local Backup: /pads/"
		cd ~
                echo ${green}"Backing up your system..."
                sleep 2
                sudo rsync -aAXHx --exclude={"/dev/*", "/proc/*", "/sys/*", "/tmp/*", "/run/*", "/mnt/*", "/media/*"} / /run/mount/storage/backup/arch_backup --verbose
                echo ${green}"Finished backing up your system!"${r}
	        notify-send "Finished backing up your system!" -i "${IMG_PATH}/logos/weLogo.png"
		successFunction "Full System Backup."
	else
		errorFunction "Error:backupFunction"
	fi
}

#
# Django Project Start/Create
#

profileFunction(){
	echo ${green}"---Heeeey you! I guess you're making new project?---"
	echo ""
	sleep 1
	read -p "~~Project Name(No Spaces!!): "${r} project
	if [[ ! -f ${MEMORY_PATH}/profiles/${project}_django.sh ]]; then
		read -p ${green}"~~Username: "${r} uname
		read -p ${green}"~~Password: "${r} passwd
		read -p ${green}"~~E-mail: "${r} email
		echo ${green}"Creating Profile:"${r}
		echo "~~${project}"
		echo "~~${uname}"
		echo "~~${passwd}"
		echo "~~${email}"
		echo "#!/bin/bash" >> ${MEMORY_PATH}/profiles/${project}_django.sh
		echo " " >> ${MEMORY_PATH}/profiles/${project}_django.sh
		echo "DJANGO_SUPERUSER_PASSWORD=\"${passwd}\" \\" >> ${MEMORY_PATH}/profiles/${project}_django.sh
		echo "DJANGO_SUPERUSER_USERNAME=\"${uname}\" \\" >> ${MEMORY_PATH}/profiles/${project}_django.sh
		echo "DJANGO_SUPERUSER_EMAIL=\"${email}\" \\" >> ${MEMORY_PATH}/profiles/${project}_django.sh
		echo "python ${PADS_PATH}/websites/${project}/manage.py createsuperuser --no-input" >> ${MEMORY_PATH}/profiles/${project}_django.sh
		sleep 5
	elif [[ -f ${MEMORY_PATH}/profiles/${project}_django.sh ]]; then
		echo ${green}"You already have a profile!"${r}
		sleep 5
	else
		errorFunction "Error:profileFunction"
	fi
}

django(){
	if [[ $1 == "delete" ]]; then
		historyFunction "Deleted:" ${2} 
		sudo rm -rf ${WEBSITES_PATH}/${2}
		sudo rm -rf ${WORKON_HOME}/${2}
		sudo rm ${MEMORY_PATH}/requirements/${2}_requirements.txt
		sudo rm ${MEMORY_PATH}/profiles/${2}_django.sh
		echo ${green}"I deleted $2 for you..."${r}
	else
        	notify-send "Starting Django Server: ${1}" -i "${IMG_PATH}/logos/weLogo.png"
		historyFunction "Starting Django Server: " ${1}
		echo ${green}$(djangoGreeting)${r}
		source ${WORKON_HOME}/${1}/bin/activate
		if [ $? -eq 0 ]; then
			python ${WEBSITES_PATH}/${1}/manage.py runserver 127.0.0.1:${2}
		elif [ $? -eq 1 ]; then
			profileFunction
			python -m venv ${WORKON_HOME}/${project}
			source ${WORKON_HOME}/${project}/bin/activate
			python -m pip install --upgrade pip
			python -m pip install django
			python -m pip install Pillow
			python -m pip install whitenoise
			python -m pip freeze > ${MEMORY_PATH}/requirements/${1}_requirements.txt
			cd ${WEBSITES_PATH}
			django-admin startproject ${project}
			cd ${WEBSITES_PATH}/${project}
			python manage.py startapp website
			python manage.py makemigrations
			python manage.py migrate
			source ${MEMORY_PATH}/profiles/${project}_django.sh
			python manage.py runserver 127.0.0.1:${2}
			successFunction "Successfully Created ${project} Django App"
		else
			errorFunction "Error:startdjango"
		fi
	fi
}

accounting(){
  echo "---------------Inventory Data Sheet---------------"
  mysql -u pads --password="%2V]G63jP/g:2ydc" < /usr/local/bin/pads_core/prog/accounting/local/inventory.sql
  echo "---------------Done---------------"
}
