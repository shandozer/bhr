#!/usr/bin/env python
# runs a sforce SOQL query and saves the results as a csv file.
import argparse
from ConfigParser import SafeConfigParser
import csv
import logging
import string
import sys
from os import path

import beatbox
import xmltramp

sf = beatbox._tPartnerNS

_logger = logging.getLogger(__name__)

class Salesforce(object):
    
    def __init__(self, config=None):
        self._read_config(config)
        self._init_session()
    
    
    
    def _read_config(self, config=None):
        parser = SafeConfigParser()

        if config:
            _logger.info('Parsing config file %s' % config)
            parser.read(config)
        elif path.exists('sfex.ini'):
            _logger.info('Parsing config file %s' % path.abspath('sfex.ini'))
            parser.read(path.abspath('sfex.ini'))
        elif path.exists(path.expanduser("~/sfex.ini")):
            _logger.info('Parsing config file %s' % path.abspath(path.expanduser('~/sfex.ini')))
            parser.read(path.abspath(path.expanduser('~/sfex.ini')))
        else:
            raise Exception("No configuration file found!")

        self._user = parser.get('account', 'user')
        self._token = parser.get('account', 'token')
        self._password = parser.get('account', 'password')


    def _init_session(self):
        self._svc = beatbox.Client()
        self._svc.login(self._user, self._password + '!!' + self._token)
        
# def buildSoql(sobjectName):
#     dr = svc.describeSObjects(sobjectName)
#     soql = ""
#     for f in dr[sf.fields:]:
#         if len(soql) > 0: soql += ','
#         soql += str(f[sf.name])
#     return "select " + soql + " from " + sobjectName
    
    def _get_fieldnames(self, name):
        """
        Arguments:
            name (str): the name of the object to get the fields for
        Returns:
            [str]: A list of the object's fieldnames 
        """
        dr = self._svc.describeSObjects(name)
        fieldnames = [str(f[sf.name]) for f in dr[sf.fields:]]
        return fieldnames
    
# def printColumnHeaders(queryResult):
#     needsComma = 0
#     # note that we offset 2 into the records child collection to skip the type and base sObject id elements
#     for col in queryResult[sf.records][2:]:
#         if needsComma: print ',',
#         else: needsComma = 1
#         print col._name[1],
#     print

    def get_data(self, name):
        
        fieldnames = self._get_fieldnames(name)
        
        soql = "select " + ", ".join(fieldnames) + " from " + name
        _logger.debug(soql)
        
        qr = self._svc.query(soql)
        records = []
        _logger.info(qr['size'])
        while True:
            records.extend(qr[sf.records:])
            print len(records)
            if str(qr[sf.done]) == 'true': 
                break
            qr = self._svc.queryMore(str(qr[sf.queryLocator]))
    
        data = [ [str(col) if str(col) != 'Unanswered' else '' for col  in row[2:]] for row in records]
        
        _logger.info("Retrieved {} records.".format(len(data)))
        result = [dict(zip(fieldnames, row)) for row in data]
        return result


    def export(self, name, filepath):
        data = self.get_data(name)
        self._write_csv(data, filepath)
        
    def _write_csv(self, data, filepath):
        f = open(filepath, 'wb')
        fieldnames = data[0].keys()

        w = csv.DictWriter(f, fieldnames=fieldnames, delimiter=',')
        w.writerow(dict((fn,fn) for fn in fieldnames))
        for row in data:
            w.writerow(row)
        f.close()
    
if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    
    parser = argparse.ArgumentParser("salesforce export")
    parser.add_argument('object', action="store")
    parser.add_argument('file', action="store")
    args = parser.parse_args()
    
    s = Salesforce()
    s.export(args.object, args.file)

