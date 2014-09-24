USE [BHR]
GO

SELECT alias.Race_Ethnicity, alias.Gender,  alias.State, alias.zip, Count(1) as N, MIN(Age) AS MinAge, MAX(Age) AS MaxAge, ROUND(AVG(Age), 1) AS 'AvgAge (60+)', ROUND(STDEV(Age), 1) AS SD

FROM (
	SELECT 
	  k.SubjectCode
	  , Age__c AS Age
	  , Race_Ethnicity_Selected__c AS Race_Ethnicity
	  , Other_Race_Ethnicity__c AS Race_Ethnicity_Other
	  , CASE Has_Consented__c WHEN 'true' THEN 1 ELSE 0 END AS HasConsented
	  , Gender__c AS Gender
	  , z.county AS County
	  , z.state AS State
	  , z.zip
	  , c.
	FROM
	  CodeKey k
	INNER JOIN
	  SF.Contact c
	ON
	  k.SalesforceID = c.Id
	  AND IsDeleted = 'false'
	LEFT OUTER JOIN
	  ZipCodes z
	oN
	  c.MailingPostalCode = z.zip
	WHERE
		Other_Race_Ethnicity__c IS NULL
		AND Age__c >= 60 

) alias

Group By
	alias.Race_Ethnicity, alias.Gender, alias.State, alias.zip
Order by 
	N desc