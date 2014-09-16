Use BHR 
GO

SELECT 
	iq.SubjectCode
	, iq.Health
		AS 'IQ_Health'
	, ql.GeneralHealth
		AS 'Quality_Health'
	, iq.PreviousYearHealth
		AS 'IQ_LastYearHealth'
	, ql.HealthComparedToYearAgo
		AS 'Quality_LastYearHealth'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	QualityOfLife ql
ON
	ql.SubjectCode = iq.SubjectCode


---COUNTS?
SELECT alias.IQ_Health, alias.Quality_Health, alias.IQ_LastYearHealth, alias.Quality_LastYearHealth, COUNT (1) as Totals

FROM (
SELECT 
	iq.SubjectCode
	, iq.Health
		AS 'IQ_Health'
	, ql.GeneralHealth
		AS 'Quality_Health'
	, iq.PreviousYearHealth
		AS 'IQ_LastYearHealth'
	, ql.HealthComparedToYearAgo
		AS 'Quality_LastYearHealth'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	QualityOfLife ql
ON
	ql.SubjectCode = iq.SubjectCode


) alias

GROUP BY
	alias.IQ_Health, alias.Quality_Health, alias.IQ_LastYearHealth, alias.Quality_LastYearHealth	
	
ORDER BY 
	Totals desc
	