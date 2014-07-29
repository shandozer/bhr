#!/usr/bin/env python
"""BHR Data Collector

Usage:
    simple.py list
    simple.py download <name>
"""
import csv

from simple_salesforce import Salesforce
from docopt import docopt

sf_user = ''
sf_pass = ''
sf_token = ''

sf = Salesforce(username=sf_user, password=sf_pass, security_token=sf_token)

def encode_value(v):
    if v is None:
        return None
        
    if isinstance(v, bool):
        if v:
            return u'1'
        return u'0'
    if isinstance(v, unicode):
        return v.encode('UTF-8')
    
    return v
    
#print(sf.query_all("SELECT Id, Email FROM Contact"))
#print(sf.Contact.describe())

def list():
    for x in sf.describe()["sobjects"]:
        print x["label"] + ': ' + x['name']

def download(name):

    sobject = sf.__getattr__(name)

    fieldnames = [ f['name'] for f in sobject.describe()['fields']]

    print(fieldnames)

    f = open(name + '.csv', 'wb')
    f.write(u'\ufeff'.encode('utf8')) # BOM (optional...Excel needs it to open UTF-8 file properly)
    w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction='ignore')
    w.writerow(dict((fn,fn) for fn in fieldnames))

    soql = "SELECT %s FROM %s" % (", ".join(fieldnames), name)
    print(soql)
    r = sf.query_all(soql)

    for row in r['records']:
        w.writerow({k:encode_value(v) for k,v in row.items()})

    f.close()

if __name__ == '__main__':
    arguments = docopt(__doc__, version='Naval Fate 2.0')
    
    if arguments['list']:
        list()
    elif arguments['download']:
        download(arguments['<name>'])

    