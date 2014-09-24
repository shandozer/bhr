SELECT alias.zip, COUNT(1) as ZipN, ROUND(AVG(alias.Age__c), 2) AS AvgAge, ROUND(STDEV(alias.Age__c), 2) AS 'SD'
FROM ( SELECT
		  k.SubjectCode
		  , z.zip
		  , c.Age__c
		  , z.county
		  , z.state

		FROM
		  CodeKey k
		INNER JOIN
		  SF.Contact c
		ON
		  k.SalesforceID = c.Id
		  AND IsDeleted = 'false'
		LEFT OUTER JOIN
		  ZipCodes z
		ON
		  c.MailingPostalCode = z.zip
		WHERE
			Age__c >= 60
			AND 
			z.county like '%san francisco%'
		  ) alias

GROUP By alias.zip
Order by 
ZipN desc