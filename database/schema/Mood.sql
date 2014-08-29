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
	, case when QID57 = 1 then 'Yes' when QID57 = 2 then 'No' end
		AS 'DroppedInterests'
	, QID58
	, QID59
	, case when QID60 = 1 then 'Yes' when QID60 = 2 then 'No' end
		AS 'InGoodSpirits'
	, QID61
	, QID62
	, QID63
	, QID64
	, QID65
	, QID66
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
