CREATE VIEW
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
