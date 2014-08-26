

CREATE VIEW
  Subjects
AS
SELECT 
  k.SubjectCode
  , Age__c AS Age
  --, Handedness__c AS Handedness
  , Race_Ethnicity_Selected__c AS Race_Ethnicity
  , Other_Race_Ethnicity__c AS Race_Ethnicity_Other
  , CASE Has_Consented__c WHEN 'true' THEN 1 ELSE 0 END AS HasConsented
  , Gender__c AS Gender
FROM
  CodeKey k
INNER JOIN
  SF.Contact c
ON
  k.SalesforceID = c.Id
AND
  IsDeleted = 'false'