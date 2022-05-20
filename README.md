																														----WELCOME TO Project PADS!----
Version = 1.0.0
Contact = armyglass@hotmail.com

PADS(Personal Assistant and Deployment System) is General Purpose Artificial Intelligence designed to carry out every day business tasks.
It's purpose is to provide book keeping, employee timesheets, client tracking, automation, etc. It can do double entry accounting for hybrid manufacturing companies. 
None of the data is loaded as Environment Variables, so your interaction with PADS is between you and it.
It's original purpose was to serve as a website, with a relational historical database. 
Work on this project began in Python using the Django Framework on June 23, 2021 at 5:30pm.
The accounting database first came online Oct. 13th, 2021 at 11:48pm. The Bash Syntax was first created by Joe Corso on May 4th, 2022. 
It was previously codenamed Project Eniac, to pay homage to the original project of the same name.
For online documentation, please visit: https://www.wormhole.click

  Usage: pads [-h|v|s|f] [ARG][ARG]
    Options:
      -h                          Print the Usage and exit
      -v                          Print the Version and exit
      -s                          Install important Software and exit
      -f    [name|help][port]	  Run any function and exit

  Ex: pads -f help || pads -h || pads -f django testproject 8080 || pads -f delete testproject


===========================
FEATURES
===========================
- Cross Compatable with Manjaro, Debian
- Update Computer
- Built in Conky Panels for Sys Info
- Log all IP's connected to your Modem
- History, Success, and Error Logs
- TODO List
- Builtin Backup
- Create Django Projects from the ground up, including the superuser
- Double Entry Accounting Database using Django

============================
INSTALLATION INSTRUCTIONS
============================
- Download pads_v1.0.0_Installer from GitHub at:
- cd into directory you downloaded from
- Run: source pads_v1.0.0_Installer

============================
CONTRIBUTE
============================
	Issue Tracker:
	Source Code: https://github.com/FrankWilson88/Project-PADS.git

============================
SUPPORT
============================
	If you are having issues, you may contact me at armyglass@hotmail.com

============================
LICENSE
============================
MIT License

Copyright (c) 2022 Joseph M. Corso

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

============================
DEPENDENCIES
============================
- conky
- python3
- python-pip
- mysql
- virtualenvwrapper

===========================
CORE FILES
===========================

===========================
KNOWN ISSUSES
===========================
- Since django is loaded from an .sh file, it loads into a subshell when activating the virtual env. When the server quits, the virtual env is 
automatically deactivated causing it to look as if the virtual env was never active to begin with. It can cause confusion, and also when adding modules to the virtual env or pip freeeze the user will still have to activate the virtual env manually. Also, you can't run the workon command in the subshell, as it won't be found. As a work around, I source the file for the virtualenv (in the django function ln. 241). You can trace back the program to the getopts menu in the brain file. It uses source to commit the functions to memory while they run, then quits. In doing so creates a subshell, also prevelant in the paramaters of the function. Django function parameters are $1 and $2 respectively. While the brain parameters are $2, $3 and $4. Where $3 and $4 are the $1 and $2 parameters. If you run the django function by itself it can create the virtual env with the workon command because it's at the top level shell, but doing so would have to make it an environment variable which would also compromise all the other functions. The idea was to only have PADS features committed to memory while you're interacting with it, but forget anything that could be an environment variable right afterwards. Which is why PADS needs to be executable as well.
