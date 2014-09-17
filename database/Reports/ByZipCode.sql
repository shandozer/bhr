
CREATE VIEW
  Reports.ByZipCode
AS
SELECT 
  z.zip
  , MIN(z.latitude) AS lat
  , MIN(z.longitude) AS long
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
  ZipCodes z
oN
  c.MailingPostalCode = z.zip
GROUP BY
  z.zip



