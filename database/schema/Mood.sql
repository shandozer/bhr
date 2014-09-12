--CREATE VIEW
ALTER VIEW
  Mood
AS
SELECT
  s.SubjectCode
	, [Score-sum] AS Score_Sum
	, [Score-weightedAvg] AS Score_Avg
	, [Score-weightedStdDev] AS Score_SD
	, QID55
	, QID56
	, QID57 
	, QID58
	, QID59
	, QID60 
	, QID61
	, QID62
	,  case when QID63 = 1 then 'Yes' when QID63 = 0 then 'No' else NULL end
		AS 'DroppedInterests'
	, QID64
	, QID65
	, case when QID66 = 1 then 'Yes' when QID60 = 0 then 'No' else NULL end
		AS 'InGoodSpirits'
	, QID67
	, QID68
	, QID69
	, QID70
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.Lifestyle_Mood d
ON
  k.SalesforceID = d.ExternalDataReference
