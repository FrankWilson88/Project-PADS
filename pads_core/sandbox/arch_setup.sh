#!/bin/bash

#
# Install Server Stack for Manjaro
#

serverInstallFunction(){
	if [[ $(whoami) == 'frank' && $(echo ${osname} == "Manjaro Linux") ]]; then

		# check for Apache
		if ! command -v httpd &> /dev/null; then
			echo "--Updating system--"${r}
			echo "yes" | update
			echo ${green}"--Installing Apache--"${r}
			echo "yes" | sudo pacman -S apache
			successFunction "Installed:Apache"
		elif command -v httpd &> /dev/null; then
			echo ${yellow}"--- You already have Apache Installed ---"${r}
		else
			errorFunction "Error:Apache"
		fi

		# check for PHP
		if ! command -v php &> /dev/null; then
			echo ${green}"--Installing PHP--"${r}
			echo "yes" | update
			echo "yes" | sudo pacman -S php
			echo ${green}"--Enabling and Restarting Apache Services--"${r}
			sudo systemctl enable httpd
			sudo systemctl restart httpd
			successFunction "Installed:PHP"
		elif command -v php &> /dev/null; then
			echo ${yellow}"--- You already have PHP Installed ---"${r}
		else
			errorFunction "Error:PHP"
		fi

		# check for mysql
		if ! command -v mysql &> /dev/null; then
			echo ${green}"--Installing MySQL--"${r}
			echo "yes" | update
			echo "yes" | sudo pacman -S mysql
			sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
			sudo systemctl enable mysqld
			sudo systemctl start mysqld
			echo ${green}"--Updating Again and running msql_secure_installation--"${r}
			echo "yes" | update
			sudo mysql_secure_installation
      sudo mysql_secure_installation
      # Note: use -Bse to add mysql queries from the command line
      sudo mysql --user=root < ${MEMORY_PATH}/profiles/mysql.txt
      echo ${green}"---Created Profile---"
      echo "User: pads" 
      echo "Password: %2V]G63jP/g:2ydc"	
			echo "All Done!"${r}
			successFunction "Installed:MySQL"
		elif command -v mysql &> /dev/null; then
			echo ${yellow}"--- You already have MySQL Installed ---"${r}
		else
			errorFunction "Error:MySQL"
		fi
		echo ${green}"All Done!"${r}

	elif [[ $(whoami) != 'frank' && $(echo ${osname} != "Manjaro Linux") ]]; then
		echo ${red}${blink}"I can't let you do that..."${r}
		errorFunction "Someone else tried to install your server stack!"
	else
		errorFunction "Error:serverInstallFunction"
	fi
}

#
# Python and whatever frameworks (automatically installs VirtualEnvWrapper)
#

pythonFunction(){
	#
	# check for Python, PIP, Virtual Env Wrapper, and Django 
	# if you don't have it, it will automatically install.
	# if you don't want Python it won't install anything else.
	#

	# check for Python
	if ! command -v python &> /dev/null; then
		read -p ${green}"Would you like to install Python? (y/n) "${r} python
		if $python == 'y' || $python == 'yes'; then
			echo ${green}"--- I'm installing Python ---"${r}
			echo "yes" | update
			echo "yes" | sudo pacman -S python
			echo ${green}"--- Python Installed ---"${r}
			successFunction "Installed:Python"
		
			# check for PIP
			if ! command -v pip &> /dev/null; then
				echo ${green}"--- You're gonna need PIP ---"${r}
				echo "yes" | update
				echo "yes" | sudo pacman -S python-pip
				echo "yes" | $(python -m pip install --upgrade pip)
				successFunction "Installed:PIP"
			elif command -v pip &> /dev/null; then
				echo ${yellow}"--- You already have PIP ---"${r}
			else
				errorFunction "Error:PIP"
			fi
	
			# check for Virtual Env Wrapper
			if ! command -v virtualenvwrapper &> /dev/null; then
				echo ${green}"--- I'm install Virtual Env Wrapper ---"${r}
				echo "yes" | sudo pip install virtualenvwrapper -v
				echo ${green}"--- Appending .bashrc this may fuck up your computer ---"${r}
				echo " "
				echo "# Virtual Envs" >> ~/.bashrc
				echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
				echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
				echo "export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '" >> ~/.bashrc
				echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
				echo "source /usr/bin/virtualenvwrapper.sh" >> ~/.bashrc
				echo ${green}"--- Reloading .bashrc ---"${r}
				source ~/.bashrc
				historyFunction "I changed the ~/.bashrc when installing Virtual Env Wrapper"
				successFunction "Installed:Virtual Env Wrapper"
			elif command -v virtualenvwrapper &> /dev/null; then
				echo ${yellow}"--- You already have VirtualEnvWrapper ---"${r}
			else
				errorFunction "Error:Virtual Env Wrapper"
			fi

	elif command -v python &> /dev/null; then
		echo ${yellow}"--- You already have Python ---"${r}

			# check for PIP
			if ! command -v pip &> /dev/null; then
				echo ${green}"--- You're gonna need PIP ---"${r}
				echo "yes" | update
				echo "yes" | sudo pacman -S python-pip
				echo "yes" | $(python -m pip install --upgrade pip)
				successFunction "Installed:PIP"
			elif command -v pip &> /dev/null; then
				echo ${yellow}"--- You already have PIP ---"${r}
			else
				errorFunction "Error:PIP"
			fi
	
			# check for Virtual Env Wrapper
			if ! command -v virtualenvwrapper &> /dev/null; then
				echo ${green}"--- I'm install Virtual Env Wrapper ---"${r}
				echo "yes" | sudo pip install virtualenvwrapper -v
				echo ${green}"--- Appending .bashrc this may fuck up your computer ---"${r}
				echo " "
				echo "# Virtual Envs" >> ~/.bashrc
				echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
				echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
				echo "export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '" >> ~/.bashrc
				echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
				echo "source /usr/bin/virtualenvwrapper.sh" >> ~/.bashrc
				echo ${green}"--- Reloading .bashrc ---"${r}
				source ~/.bashrc
				historyFunction "I changed the ~/.bashrc when installing Virtual Env Wrapper"
				successFunction "Installed:Virtual Env Wrapper"
			elif command -v virtualenvwrapper &> /dev/null; then
				echo ${yellow}"--- You already have VirtualEnvWrapper ---"${r}
			else
				errorFunction "Error:Virtual Env Wrapper"
			fi

			# check for Django
			if ! command -v python -m django --version &> /dev/null; then
				read -p "Would you like to install Django? (y/n) " django
				if $django == 'y' || $django == 'yes'; then
					mkvirtualenv django
					echo ${green}"---Installing Django---"${r}
					pip install django -v
					deactivate django
					echo ${green}"--- Django Installed ---"${r}
					successFunction "Installed:Django"
				elif $django == 'n' || $django == 'no'; then
					echo ${red}"Fine! Fuck off!"${r}
				else
					errorFunction "Typo"
				fi
			elif command -v python -m django --version &> /dev/null; then
				echo ${yellow}"--- You already have Django ---"${r}
			else
				errorFunction "Error:Django"
			fi
	else
		errorFunction "Error:pythonFunction"
	fi
}

#
# Ruby and whatever frameworks (added to the VirtualEnvWrapper)
#
rubyFunction(){
	if ! command -v ruby &> /dev/null; then
		read -p ${green}"Would you like to install Ruby? (y/n) "${r} ruby
		if [[ ${ruby} == 'y' || ${ruby} == 'yes' ]]; then
			echo ${green}"--- I'm updating and installing Ruby ---"${r}
			echo "yes" | update
			echo "yes" | sudo pacman -S ruby
			echo ${green}"--- Appending ~/.bashrc for gem ---"${r}
			echo " " >> ~/.bashrc
			echo "# Gem " >> ~/.bashrc
			echo 'export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"' >> ~/.bashrc
			echo 'export PATH="$PATH:$GEM_HOME/bin"' >> ~/.bashrc
			source ~/.bashrc
			historyFunction "You changed your ~/.bashrc for GEM"
			echo ${green}"--- Updating Gem ---"${r}
			gem update
			echo ${green}"--- Ruby Installed ---"${r}
			successFunction "Installed:Ruby"

			# check for Rails
			if ! command -v rails &> /dev/null; then
				read -p ${green}"Would you like to install Rails? (y/n) "${r} rails
				if [[ $rails == 'y' || $rails == 'yes' ]]; then
					echo ${green}"---I'm installing Rails---"${r}
					if ! [[ $(workon rails) ]]; then
						update						
						mkvirtualenv rails
						gem install rails
						deactivate rails
						echo ${green}"--- Rails Installed ---"${r}
						successFunction "Installed:Rails"
					else
						update
						workon rails
						gem install rails
						deactivate rails
						echo ${green}"---Done installing Rails---"${r}
						successFunction "Installed:Rails"
					fi
				elif [[ $rails == 'n' || $rails == 'no' ]]; then
					echo ${red}"--- Fine! Fuck off! ---"${r}
				else
					echo ${red}"Yes or No Will Do..."${r}
					sleep 2
					rubyFunction
				fi
			elif command -v rails &> /dev/null; then
				echo ${yellow}"--- You already have Rails ---"${r}
			else
				errorFunction "Error:Rails"
			fi

		elif [[ ${ruby} == 'n' || ${ruby} == 'no' ]]; then
			echo ${yellow}"--- No on installing Ruby ---"${r}
		else
			echo ${red}"I don't understand you..."${r}
			sleep 2
			rubyFunction
		fi
	elif command -v ruby &> /dev/null; then
		echo ${yellow}"--- You already have Ruby ---"${r}

		# check for Rails
		if ! command -v rails &> /dev/null; then
			read -p ${green}"Would you like to install Rails? (y/n) "${r} rails
			if [[ $rails == 'y' || $rails == 'yes' ]]; then
				echo ${green}"---I'm installing Rails---"${r}
				if ! [[ $(workon rails) ]]; then
					echo "yes" | update						
					mkvirtualenv rails
					gem install rails
					deactivate rails
					echo ${green}"--- Rails Installed ---"${r}
					successFunction "Installed:Rails"
				elif [[ $(workon rails) ]]; then
					echo "yes" | update
					workon rails
					gem install rails
					deactivate rails
					echo ${green}"--- Rails Installed ---"${r}
					successFunction "Installed:Rails"
				else
					errorFunction "Error:Workon Rails"
				fi
			elif [[ $rails == 'n' || $rails == 'no' ]]; then
				echo ${red}"--- No to installing Rails ---"${r}
			else
				echo ${red}${blink}"I didn't understand you..."${r}
				sleep 2
				rubyFunction
			fi
		elif command -v rails &> /dev/null; then
			echo ${yellow}"--- You already have Rails ---"${r}
		else
			errorFunction "Error:Rails"
		fi
	else
		errorFunction "Error:rubyFunction"
	fi
}

#
# This function installs the full software stack
#

softwareInstallFunction(){
	historyFunction "Running:softwareInstall"
	if [[ $(echo ${osname} == 'Manjaro Linux') ]]; then
		echo ${green}"=============================================================================="
		echo  "                      --- I'm Installing your Software Stack ---"
		echo "=============================================================================="${r}
		pythonFunction
		rubyFunction
		read -p ${green}"Would you like to install the Server Stack? (y/n) "${r} server
		if [[ $server == 'y' || $server == 'yes' ]]; then
			serverInstallFunction
			successFunction "Installed:Software Stack | Installed:Server Stack"
		else
			echo ${red}"---No on the Server---"${r}
			echo ${green}"---I'm all done!---"${r}
			successFunction "Installed:Software Stack | No Server Stack"
		fi
	else
		echo ${red}${blink}"I can't let you do that..."${r}
		errorFunction "Someone else tried install your software stack!"
	fi
}