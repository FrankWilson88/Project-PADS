from django.shortcuts import render
from accounting.settings import BASE_DIR
import os
import random
import datetime
from django.views import generic
from backend.queries.inventory import cw, pw, si

# Create your views here.
catalog = {
	'customwork': cw,
	'prodo': pw,
	'storeInventory': si,
}


def index(request):
	f = open(os.path.join(BASE_DIR, 'log.txt'), 'a')
	print('User clicked Home Page ' + str(datetime.datetime.now()), file=f)
	f.close()		
	print('User clicked Home Page')
	return render(request, 'index.html', catalog)

def about(request):
	f = open(os.path.join(BASE_DIR, 'log.txt'), 'a')
	print('User clicked About Page ' + str(datetime.datetime.now()), file=f)
	f.close()		
	print('User clicked About Page')
	return render(request, 'about.html', catalog)