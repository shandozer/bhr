Use BHR 
GO

SELECT 
	iq.SubjectCode
	, ChangeInMemoryPastDecade AS 'IQ_10YearMemoryChange'
	, TroubleRemembering AS 'IQ_AlreadyToldSomeone'
	, case when ecog.AlreadyToldSomeone = 1 then 'no change' when ecog.AlreadyToldSomeone = 2 then 'questionable' when ecog.AlreadyToldSomeone = 3 then 'a bit worse' when ecog.AlreadyToldSomeone = 4 then 'much worse' when ecog.AlreadyToldSomeone = 5 then 'do not know' else NULL end
		AS 'ECog_AlreadyToldSomeone'
	
	
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	EverydayCognition ecog
ON
	ecog.SubjectCode = iq.SubjectCode


---COUNTS?
SELECT alias.IQ_10YearMemoryChange, alias.IQ_AlreadyToldSomeone, alias.ECog_AlreadyToldSomeone, COUNT (1) as Totals

FROM (

SELECT 
	iq.SubjectCode
	, ChangeInMemoryPastDecade AS 'IQ_10YearMemoryChange'
	, TroubleRemembering AS 'IQ_AlreadyToldSomeone'
	, case when ecog.AlreadyToldSomeone = 1 then 'no change' when ecog.AlreadyToldSomeone = 2 then 'occasionally somewhat worse' when ecog.AlreadyToldSomeone = 3 then 'consistantly a bit worse' when ecog.AlreadyToldSomeone = 4 then 'much worse' when ecog.AlreadyToldSomeone = 5 then 'do not know' else NULL end
		AS 'ECog_AlreadyToldSomeone'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	EverydayCognition ecog
ON
	ecog.SubjectCode = iq.SubjectCode
) alias

GROUP BY
	 alias.IQ_10YearMemoryChange, alias.IQ_AlreadyToldSomeone, alias.ECog_AlreadyToldSomeone
	
ORDER BY 
	Totals desc
	