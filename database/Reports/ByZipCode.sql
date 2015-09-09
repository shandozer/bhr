
ALTER VIEW
  Reports.ByZipCode
AS
SELECT 
  z.ZipCode AS zip
  , MIN(z.lat) AS lat
  , MIN(z.lon) AS long
  , REPLACE(MIN(z.county),' County','') AS county
  , MIN(z.state) AS state
  , COUNT(1) AS n
FROM
  CodeKey k
INNER JOIN
  SF.Contact c
ON
  k.SalesforceID = c.Id
  AND IsDeleted = 'false'
LEFT OUTER JOIN
  zips z
oN
  c.MailingPostalCode = z.ZipCode
  
GROUP BY
  z.ZipCode



