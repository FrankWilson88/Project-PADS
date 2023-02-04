#!/bin/bash

#
# Functions for Python, PIP, and any Frameworks, etc.
#
pythonFunction(){
  if ! command -v python &> /dev/null; then
    echo ${green}"Installing Python..."${r}
    echo "I'm gonna update first..."${r}
    sleep 2
    sudo apt-get update && sudo apt-get upgrade
    sudo apt-get -y install python3
  elif command -v python &> /dev/null; then
    echo ${yellow}"You already have Python..."${r}
  else
    errorFunction "Could not install Python"
  fi
}

pipFunction(){
    if ! command -v pip --version &> /dev/null; then
      echo ${green}"Installing PIP..."${r}
      sudo apt-get install pip
    elif command -v pip --version &> /dev/null; then
      echo ${yellow}"You already have PIP..."${r}
      echo ${yellow}"I'll update PIP for you..."${r}
      python -m pip install --upgrade pip
    else
      errorFunction "Could not install PIP"
    fi
}

virtualenvFunction(){
    if ! command -v virtualenvwrapper &> /dev/null; then
      echo ${green}"Installing Virtual Env Wrapper..."${r}
      sudo pip install virtualenvwrapper
      echo ${green}"I'm changing your ~/.bashrc"${r}
      echo " " >> ~/.bashrc
      echo "# Virtual Envs" >> ~/.bashrc
      export WORKON_HOME=$HOME/.virtualenvs >> ~/.bashrc
      export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 >> ~/.bashrc
      export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 ' >> ~/.bashrc
      export PROJECT_HOME=$HOME/Devel >> ~/.bashrc
      source /usr/local/bin/virtualenvwrapper.sh >> ~/.bashrc
      source ~/.bashrc
    elif command -v virtualenvwrapper &> /dev/null; then
      echo ${yellow}"You already have Virtual Env Wrapper..."${r}
    else
      errorFunction "Could not install Virtual Env Wrapper"
    fi
}

djangoFunction(){
  if ! command -v workon django &> /dev/null; then
    echo ${green}"Installing Django..."${r}
    mkvirtualenv django
    python -m pip install virtualenvwrapper
  elif command -v virtualenvwrapper &> /dev/null; then
    echo ${yellow}"You already have Django..."${r}
  else
    errorFunction"Could not install Django"
  fi
}

#
# Ruby, and it's frameworks, etc.
#
rubyFunction(){
  if ! command -v ruby --version &> /dev/null; then
    echo ${green}"Installing Ruby..."${r}
    sudo apt-get -y install ruby-full
  elif command -v ruby --version &> /dev/null; then
    echo ${yellow}"You already have Ruby..."${r}
  else
    errorFunction "Could not install Ruby"
  fi
}

railsFunction(){
  if ! command -v rails --version &> /dev/null; then
    echo ${green}"Installing Rails..."${r}
    sudo gem install rails
  elif command -v rails --version &> /dev/null; then
    echo ${yellow}"You already have Rails..."${r}
  else
    errorFunction "Could not install Rails"
  fi
}

#
# Apache
#
apacheFunction(){
  if ! command -v apache2 --version &> /dev/null; then
    echo ${green}"Installing Apache..."${r}
    sudo apt-get -y install apache2
  elif command -v apache2 --version &> /dev/null; then
    echo ${yellow}"You already have Apache..."${r}
  else
    errorFunction "Could not install Apache"
  fi
}

#
# PHP
#
phpFunction(){
  if ! command -v php &> /dev/null; then
    echo ${green}"Installing PHP..."${r}
    sudo apt-get -y install php
  elif command -v php &> /dev/null; then
    echo ${yellow}"You already have PHP..."${r}
  else
    errorFunction "Could not install PHP"
  fi
}

#
# MySQL
#
mysqlFunction(){
  if ! command -v mysql &> /dev/null; then
    echo ${green}"Installing MySQL..."${r}
    sudo apt-get -y install mariadb-server
    sudo mysql_secure_installation
    sudo mysql --user=root --password='1!2@3#' -Bse "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Cheese12'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost'; FLUSH PRIVILEGES;"
		echo ${green}"Created User: admin Password: Cheese12"
  elif command -v mysql &> /dev/null; then
    echo ${yellow}"You already have MySQL..."${r}
  else
    errorFunction "Could not install MySQL"
  fi
}

#
# Full Software Install Program
#
softwareInstallFunction(){
  if [[ $(whoami) == 'pi' && ${osname} == 'NAME="Debian GNU/Linux"' ]]; then
    echo ${green}"I'll check to see what you need to install..."${r}
    sleep 2
    # Install Python, PIP, and any Frameworks, etc.
    pythonFunction
    pipFunction
    virtualenvFunction
    djangoFunction
    # Install Ruby, and any Frameworks, etc.
    rubyFunction
    railsFunction
    # Install Apache
    apacheFunction
    # Install PHP
    phpFunction
    # Install MySQL
    mysqlFunction
    successFunction "Successfully installed your Software Stack"
  elif [[ $(whoami) == 'pi' && ${osname} == 'NAME="Debian GNU/Linux"' ]]; then
    echo ${red}"I can't do that for you..."${r}
    errorFunction "Someone tried to run softwareInstallFunction"
    historyFunction "Someone tried to run softwareInstallFunction"
  fi
}


