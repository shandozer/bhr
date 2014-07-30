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
sqlite3 -header -csv data.db < dashboard/summary.sql > dashboard/summary.csv
sqlite3 -header -csv data.db < dashboard/growth.sql > dashboard/growth.csv
phantomjs dashboard/report2pdf.js dashboard/bhr.html reports/BHR_Dashboard-%(today)s.pdf
""" % { 'today': today }
print cmd
subprocess.call(cmd, shell=True)