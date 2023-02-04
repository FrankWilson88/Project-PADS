#!/bin/bash

##################################
# Install Server Stack for PADS #
##################################

#################################################################
# This is a cross compatable process to                         #
# install software from requirements.txt:                       #
# (path/to/pads_core/memory/requirements/pads_requirements.txt) #
#################################################################

# Cross Compatable Installation Commands
basicInstall(){
  echo "" >> ${HOME}/.bashrc
  echo "# PADS Vars" >> ${HOME}/.bashrc
  echo ". /usr/local/bin/pads_core/brain/styles.sh" >> ${HOME}/.bashrc
  echo "play -q /usr/local/bin/pads_core/memory/audio/codecopen.wav" >> ${HOME}/.bashrc
  git init /usr/local/bin/pads_core/prog/websites/git
  if ! command -v virtualenvwrapper &> /dev/null; then
    echo ${green}"Installing Virtual Env Wrapper..."${r}
    yes | sudo pip install virtualenvwrapper -v
    echo ${green}"I'm changing your ~/.bashrc"${r}
    sleep 2
    echo " " >> ~/.bashrc
    echo "# Virtual Envs" >> ~/.bashrc
    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
    echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
    echo "export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '" >> ~/.bashrc
    echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
    echo "source /usr/bin/virtualenvwrapper.sh" >> ~/.bashrc
    source ~/.bashrc
  elif command -v virtualenvwrapper &> /dev/null; then
    echo ${yellow}"You already have Virtual Env Wrapper..."${r}
  else
    errorFunction "Could not install Virtual Env Wrapper"
  fi
  sudo systemctl enable nginx.service
  sudo systemctl restart nginx.service
  sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
  sudo systemctl enable mysqld
  sudo systemctl start mysqld
  sudo mysql_secure_installation
  # Note: use -Bse to add mysql queries from the command line
  sudo mysql --user=root < ${MEMORY_PATH}/profiles/mysql.txt
  echo ${green}"---Created Profile---"
  echo "User: pads" 
  echo "Password: %2V]G63jP/g:2ydc"${nc}
  chmod +x ${PADS_PATH}/prog/conky/conky_local_info_theme.sh
  chmod +x ${PADS_PATH}/prog/conky/conky_local_sys_theme.sh
  chmod +x ${PADS_PATH}/prog/conky/conky_local_log_theme.sh
  source ~/.bashrc
}

# OS specific Installation Commands
manjaroFuntion(){
  echo ${green}"Setting up Snap..."${r}
  sudo pacman -S snapd
  sudo systemctl enable --now snapd.socket
  sudo ln -s /var/lib/snapd/snap /snap
}

archFunction(){ 
  source arch_installer.sh
  reboot
}

# Main Program, checks the OS first
historyFunction "Running: Software Install"
notify-send "Installing Dependancies" -i "${IMG_PATH}/logos/weLogo.png"
if [[ ${distro} == 'NAME="Manjaro Linux"' || ${distro} == 'NAME="Arch Linux"' ]]; then
  if [[ ${distro} == 'NAME="Manjaro Linux"' ]]; then
    manjaroFunction
  elif [[ ${distro} == 'NAME="Arch Linux"' ]]; then
    if [[ ! $(ls /boot/*) ]]; then
      archFunction
    fi
  else
    errorFunction "I can't find your distrobution."
  fi
  sudo pacman -Syyu - < ${MEMORY_PATH}/requirements/pads_requirements.txt
  basicInstall
  echo -e ${green}"I'm alive! Type \"pads\" for my help page."${r}
elif [[ ${distro} == 'NAME="Debian GNU/Linux"' ]]; then
  sudo apt-get update && sudo apt-get upgrade
  cat ${MEMORY_PATH}/pads_requirements.txt | xargs sudo apt-get -y install
  basicInstall
  echo ${green}"I'm alive! Type \"pads\" for my help page."${r}
else
  echo ${red}"I can't do that for you..."${r}
  errorFunction "Incompatable Machine..."
fi

