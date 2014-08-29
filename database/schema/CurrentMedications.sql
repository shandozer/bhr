ALTER VIEW
  CurrentMedications
AS
SELECT
  s.SubjectCode
	, QID1_1_TEXT AS CurrentMeds1
	, QID1_2_TEXT AS CurrentMeds1_Condition
	, QID1_3_TEXT AS CurrentMeds2
	, QID1_4_TEXT AS CurrentMeds2_Condition
	, QID2 AS AdditionalMedsTaken
	, QID3_1_TEXT AS CurrentMeds3
	, QID3_2_TEXT AS CurrentMeds3_Condition
	, QID3_3_TEXT AS CurrentMeds4
	, QID3_4_TEXT AS CurrentMeds4_Condition
	, QID3_5_TEXT AS CurrentMeds5
	, QID3_6_TEXT AS CurrentMeds5_Condition
	, QID4 AS AdditionalMedsTaken2
	, QID5_1_TEXT AS CurrentMeds6
	, QID5_2_TEXT AS CurrentMeds6_Condition
	, QID5_3_TEXT AS CurrentMeds7
	, QID5_4_TEXT AS CurrentMeds7_Condition
	, QID5_5_TEXT AS CurrentMeds8
	, QID5_6_TEXT AS CurrentMeds8_Condition
	, QID5_7_TEXT AS CurrentMeds9
	, QID5_8_TEXT AS CurrentMeds9_Condition
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_CurrentMedications d
ON
  k.SalesforceID = d.ExternalDataReference
