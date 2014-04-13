#!/usr/bin/env python
from os import path
import subprocess
from datetime import datetime

from data import extract

today = datetime.now().strftime('%Y.%m.%d')

datadir = path.join('data', today)

#extract.extract(datadir)
cmd = """
rm data.db
diepy import data/%(today)s/*/*.csv test
sqlite3 -header -csv data.db < analysis/summary.sql > analysis/summary.csv
sqlite3 -header -csv data.db < analysis/growth.sql > analysis/growth.csv
phantomjs analysis/screenshot.js analysis/bhr.html reports/BHRDashboard-%(today)s.png 3076px 2.25
""" % { 'today': today }
print cmd
subprocess.call(cmd, shell=True)