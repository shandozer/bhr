ALTER VIEW
  MedicalHistory
AS
SELECT
  s.SubjectCode
	, [Score-sum] AS Score_Sum
	, [Score-weightedAvg] AS Score_Avg
	, [Score-weightedStdDev] AS Score_SD

	, [QID1_1]
	, [QID1_2]
	, [QID1_3]
	, [QID1_4]
	, [QID1_5]
	, [QID1_6]
	, [QID1_7]
	, [QID1_8]
	, [QID1_9]
	, [QID1_10]
	, [QID1_11]
	, [QID1_12]
	, [QID1_13]
	, [QID1_14]
	, [QID1_15]
	, [QID1_16]
	, [QID1_17]
	, [QID1_18]
	, [QID1_19]
	, [QID1_20]
	, [QID2]
	, [QID3_1]
	, [QID4]
	, [QID5]
	, [QID6]
	, [QID7_1_TEXT]
	, [QID7_2_TEXT]
	, [QID7_3_TEXT]
	, [QID7_4_TEXT]
	, [QID7_5_TEXT]
	, [QID9]	
	, [QID13]
	, [QID15]
	, [QID16]
	, [QID17]
	, [QID18]
	, [QID19]
	, [QID20]
	, [QID21]
	, [QID22]
	, [QID23]
	, [QID26]
	, [QID28#1_1] AS QID28_1_1
	, [QID28#1_2] AS QID28_1_2
	, [QID28#1_3] AS QID28_1_3
	, [QID28#1_4] AS QID28_1_4
	, [QID28#1_5] AS QID28_1_5
	, [QID28#1_6] AS QID28_1_6
	, [QID28#1_7] AS QID28_1_7
	, [QID28#1_8] AS QID28_1_8
	, [QID28#1_9] AS QID28_1_9
	, [QID28#1_10] AS QID28_1_10
	, [QID28#1_11] AS QID28_1_11
	, [QID28#1_12] AS QID28_1_12
	, [QID28#1_13] AS QID28_1_13
	, [QID28#1_14] AS QID28_1_14
	, [QID28#1_15] AS QID28_1_15
	, [QID28#2_1] AS QID28_2_1
	, [QID28#2_2] AS QID28_2_2
	, [QID28#2_3] AS QID28_2_3
	, [QID28#2_4] AS QID28_2_4
	, [QID28#2_5] AS QID28_2_5
	, [QID28#2_6] AS QID28_2_6
	, [QID28#2_7] AS QID28_2_7
	, [QID28#2_8] AS QID28_2_8
	, [QID28#2_9] AS QID28_2_9
	, [QID28#2_10] AS QID28_2_10
	, [QID28#2_11] AS QID28_2_11
	, [QID28#2_12] AS QID28_2_12
	, [QID28#2_13] AS QID28_2_13
	, [QID28#2_14] AS QID28_2_14
	, [QID28#2_15] AS QID28_2_15

FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_MedicalHistory d
ON
  k.SalesforceID = d.ExternalDataReference
