CREATE VIEW
  EarlyHistory
AS
SELECT
  s.SubjectCode
	, [Score-sum] AS Score_Sum
	, [Score-weightedAvg] AS Score_Avg
	, [Score-weightedStdDev] AS Score_SD
	, [Score 1-sum] AS Score1_Sum
	, [Score 1-weightedAvg] AS Score1_Avg
	, [Score 1-weightedStdDev] AS Score1_SD
	, QID71
	, QID72
	, QID73
	, QID74
	, QID75
	, QID76
	, QID77
	, QID78
	, QID79
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_EarlyHistory d
ON
  k.SalesforceID = d.ExternalDataReference
