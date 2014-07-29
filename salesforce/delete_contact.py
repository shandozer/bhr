#!/usr/bin/env python
# runs a sforce SOQL query and saves the results as a csv file.
import sys
import string
import beatbox
#import xmltramp
import argparse
import csv
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger()

sf = beatbox._tPartnerNS
svc = beatbox.Client()

def delete(username, password, id):
    svc.login(username, password)
    contacts = svc.retrieve('LastName', 'Contact', [id])
    print contacts
    if not len(contacts) == 1:
        return
    
    disable_user(id)
    qrs = get_questionnaire_response_ids(id)
    # for qr in get_questionnaire_response_ids(id):
#         svc.delete([qr])
    
    if qrs:
        svc.delete(qrs)
    svc.delete([id])

def disable_user(id):
    users = get_user_ids(id)
    if len(users) > 1:
        raise Exception("Too many users!")
    elif len(users) == 0:
        return
         
    data = dict(type='User',Id=users[0], isActive='FALSE', isPortalEnabled='false')
    svc.update(data)
    svc.delete(users)

def get_user_ids(id):
    qr = svc.query("select Id from User WHERE Contact.ID = '" + id + "'" )
    records = []
    logger.info(qr['size'])
    while True:
        records = records + qr['records']
        if qr['done']: 
            break
        qr = svc.queryMore(qr['queryLocator'])
    
    print records
    return [r['Id'] for r in records]
        
def get_questionnaire_response_ids(id):
    qr = svc.query("select Id from Questionnaire_Response__c WHERE Contact__r.ID = '" + id + "'" )
    records = []
    logger.info(qr['size'])
    while True:
        records = records + qr['records']
        if qr['done']: 
            break
        qr = svc.queryMore(qr['queryLocator'])
    
    print records
    return [r['Id'] for r in records]
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser("delete_contact")
    parser.add_argument('id', action="store")
    args = parser.parse_args()
    
    delete('', '', args.id)
