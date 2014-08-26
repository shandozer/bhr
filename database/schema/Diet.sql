CREATE VIEW
  Diet
AS
SELECT
  s.SubjectCode
	, [Score-sum] AS Score_Sum
	, [Score-weightedAvg] AS Score_Avg
	, [Score-weightedStdDev] AS Score_SD
	, QID161
	, QID167
	, QID168
	, QID170
	, QID171
	, QID129_1
	, QID129_2
	, QID129_3
	, QID129_4
	, QID129_4_TEXT
	, QID172
	, QID173
	, QID131
	, QID132
	, QID133
	, QID165
	, QID166
	, QID136
	, QID137
	, QID138
	, QID139_1
	, QID139_1_TEXT
	, QID139_2
	, QID139_2_TEXT
	, QID139_3
	, QID139_3_TEXT
	, QID139_4
	, QID139_4_TEXT
	, QID139_5
	, QID139_5_TEXT
	, QID139_6
	, QID139_6_TEXT
	, QID139_7
	, QID139_7_TEXT
	, QID139_8
	, QID139_8_TEXT
	, QID139_9
	, QID139_9_TEXT
	, QID139_10
	, QID139_10_TEXT
	, QID139_11
	, QID139_11_TEXT
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_Diet d
ON
  k.SalesforceID = d.ExternalDataReference
