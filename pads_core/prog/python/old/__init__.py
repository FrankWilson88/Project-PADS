# Imports
import os
import datetime
from datetime import date
from pytz import timezone
import platform
import random
from numpy import random
import re  # regular expressions
import wikipedia
import webbrowser
import requests

# My Imports
#import db

'''
 Variables
'''
# RegEx


# Date Variables
utc = timezone('UTC')
d1 = datetime.datetime.utcnow()
date = date.today()
today = date.strftime('%Y-%m-%d')
aiBorn = datetime.datetime(2021, 6, 23, 17, 30, 0)
aiBirth = aiBorn.strftime('%Y-%m-%d')
aiAge = d1 - aiBorn

# System Variables
sys = platform.system()
cwd = os.getcwd() + '/'
osUser = os.getlogin()
osEnviron = os.environ
osUname = os.uname()

# Misc Variables
dick = "8===D~~ "
copyright = 'Copyright, ' + str(aiBorn.year) + '-' + str(date.year) + ' | Army Glass'
license = ''' The MIT License (MIT)

Copyright © 2021 Army Glass
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'''

# userMoods
goodMood = ['happy', 'good', 'excited']
badMood = ['mad', 'bad', 'angry']

# userResponse
responseYes = []
responseNo = []

'''
 Profiles
'''
userOS = sys
userDir = cwd


# Database Entries

def newuser():
    print('Nice to meet you,', osUser + '!\nWhat\'s your real name?')
    global userName
    userName = input(dick)
    regex = re.findall('[a-zA-Z]\s[a-zA-Z]', userName)
    if regex:
        pass
    else:
        print('That\'s not your full name!')
        newuser()


def newuserBirthday():
    print('When\'s your birthday?')
    global userBirthday
    userBirthday = input(dick)
    regex = re.search('[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]', userBirthday)
    if regex:
        pass
    else:
        print('Must be YYYY/MM/DD format')
        newuserBirthday()


def newuserGender():
    print('Are you Male or Female?')
    global userGender
    userGender = input(dick)
    male = re.search('[male|Male|m|M]', userGender)
    female = re.search('[female|Female|f|F]', userGender)
    if male or female:
        pass
    else:
        print('You must enter: male, Male, m, M, female, Female, f, F.')
        newuserGender()


def newuserEmail():  # Mike Corso helped develop the regex for this function
    print('What\'s your email?')
    global userEmail
    userEmail = input(dick)
    regex = re.search('[a-zA-Z]+@[a-z]+.com\Z', userEmail)
    if regex:
        pass
    else:
        print('You must enter a valid email')
        newuserEmail()


# File Handling

def userPath():
    start_path = 'users/' + userName + '/'
    final_path = os.path.join(start_path)
    if not os.path.isdir(final_path):
        os.makedirs(final_path)
    return final_path


def userRead():
    y = os.path.join('users/', userName + '/')
    x = open(y + 'brain.py', 'r').read()
    return x


'''
 Eniac
'''
# Eniac's Profile
eniacProfile = {
    'author': 'Joseph Matthew Corso',
    'forkAuthor': '',
    'name': 'Eniac',
    'born': aiBorn.strftime('%Y-%m-%d'),
    'age': int(aiAge.days) // 365,
    'gender': sys,
    'address': cwd,
    'version': '1.0.0',  # author.version.version (Change the author in the version and forkAuthor if it's forked. edit the version spots however you want or add more as long as author is the base.)
    #'database': db.eniac.database + '.mysql.' + db.dbInfoEniac,
}
eniacAuthor = eniacProfile['author']
eniacForkAuthor = eniacProfile['forkAuthor']
eniacName = eniacProfile['name']
eniacBorn = eniacProfile['born']
eniacAge = eniacProfile['age']
eniacGender = eniacProfile['gender']
eniacAddress = eniacProfile['address']
eniacVersion = eniacProfile['version']

# More Imports to run the program without circulation.
import response
import brain
#import login
