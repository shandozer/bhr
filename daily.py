#!/usr/bin/env python
from os import path
import subprocess
from datetime import datetime

from data import extract

today = datetime.now().strftime('%Y.%m.%d')

datadir = path.join('archive', today)

extract.extract(datadir)
cmd = """
rm data.db
diepy import archive/%(today)s/*/*.csv test
sqlite3 -header -csv data.db < analysis/summary.sql > analysis/summary.csv
sqlite3 -header -csv data.db < analysis/growth.sql > analysis/growth.csv
phantomjs analysis/report2pdf.js analysis/bhr.html reports/BHR_Dashboard-%(today)s.pdf
""" % { 'today': today }
print cmd
subprocess.call(cmd, shell=True)