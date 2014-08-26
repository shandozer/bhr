
CREATE TABLE
  CodeKey (
    SalesforceID VARCHAR(50) NOT NULL
    , SubjectCode VARCHAR(50) NULL
    , Autonumber INT IDENTITY(1,1) NOT NULL
 )
 
 
INSERT INTO CodeKey (SalesforceID )
SELECT Id FROM SF.Contact 
WHERE LastName NOT LIKE '%TEST%'
AND Id NOT IN ( SELECT SalesforceID FROM CodeKey )


UPDATE CodeKey
 SET SubjectCode = 'BHR' + RIGHT('0000000000'+CAST(Autonumber AS VARCHAR), 6)
WHERE
  SubjectCode IS NULL

  
