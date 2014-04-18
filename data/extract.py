#!/usr/bin/env python
import os
import csv
from os import path
from datetime import datetime
import shutil

from sfex import Salesforce
from qualpy.core import Qualtrics


sf = Salesforce()
q = Qualtrics()


def download_survey(survey_id, dst):
    if isinstance(survey_id, str):
        surveys = q.get_active_surveys()
        survey = [s for s in surveys if s['SurveyID'] == survey_id][0]
    print("Downloading {0}".format(survey['SurveyName']))
    data = q.get_survey_data(survey['SurveyID'])
    tablename = survey2filename(survey['SurveyName'])
    downloadpath = path.join(dst, tablename + '.csv')
    write_csv(data, downloadpath)


def download_panel(panel_id, dst):
    if isinstance(panel_id, str):
        panels = q.get_panels()
        panel = [p for p in panels if p['PanelID'] == panel_id][0]
    print('Downloading "%s" ...' % panel['Name'])
    data = q.get_panel_data(panel['PanelID'])
    tablename = survey2filename(panel['Name'])
    downloadpath = path.join(dst, tablename + '.csv')
    write_csv(data, downloadpath)
    
    
def survey2filename(survey_name):
    return survey_name.replace(' ', '').replace('-', '_')


def write_csv(data, filepath):
    f = open(filepath, 'wb')
    writer = csv.writer(f)
    writer.writerows(data)
    f.close()


def extract(dst):
    sfdir = path.join(dst, 'SF')
    qdir = path.join(dst, 'Q')
    
    if not path.exists(sfdir):
        os.makedirs(sfdir)
    if not path.exists(qdir):
        os.makedirs(qdir)
        
    sf.export('Contact', path.join(sfdir, 'Contact.csv'))
    sf.export('Questionnaire_Response__c', path.join(sfdir, 'Questionnaire_Response__c.csv'))
    sf.export('Subtab__c', path.join(sfdir, 'Subtab__c.csv'))
    
    tests = sf.get_data('Subtab__c')
    for test in tests:
        if test['Survey_Id__c'] == '':
            continue
        download_survey(test['Survey_Id__c'], qdir)

    download_panel('ML_bxPZH7gxhMTYKt7', qdir)


if __name__ == '__main__':
    today = datetime.now().strftime('%Y.%m.%d')
    extract(today)