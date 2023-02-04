#!/usr/bin/env python

# Imports
import platform
import random
import os
import datetime
import getpass
import mysql.connector
import response

# Variables
d1 = datetime.datetime.utcnow()
aiBorn = datetime.datetime(2021, 6, 23, 17, 30, 0)
aiBirth = aiBorn.strftime('%Y-%m-%d')
aiAge = d1 - aiBorn
version_history = open(os.path.abspath('/usr/bin/pads_core/memory/version_history.txt'))
dick = "8===D~~ "

# Database Info
padsDB = mysql.connector.connect(
  host='127.0.0.1',
  database='pads_brain',
  user='pads',
  password='%2V]G63jP/g:2ydc',
)

# User Profile
userProfile = {
  'input': input(dick),
  'osName': os.getlogin(),
  'osEnviron': os.environ,  
}

# PADS's Profile
padsProfile = {
  'author': 'Joseph Matthew Corso',
  'name': 'PADS',
  'born': aiBorn.strftime('%Y-%m-%d'),
  'age': int(aiAge.days) // 365,
  'gender': platform.system(),
  'address': os.getcwd() + '/',
  'version': version_history.readline(),
  'dbVersion': 'You are connected to: ' + padsDB.get_server_info(),
}
padsAuthor = padsProfile['author']
padsName = padsProfile['name']
padsBorn = padsProfile['born']
padsAge = padsProfile['age']
padsGender = padsProfile['gender']
padsAddress = padsProfile['address']
padsVersion = padsProfile['version']
padsDBVersion = padsProfile['dbVersion']

if __name__ == '__main__':
  import __init__
else:
  print('Lick my ball sack')

print('Righty o\', duderieno...')
padsDB.close()

