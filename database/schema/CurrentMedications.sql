CREATE VIEW
  CurrentMedications
AS
SELECT
  s.SubjectCode
	, QID1_1_TEXT
	, QID1_2_TEXT
	, QID1_3_TEXT
	, QID1_4_TEXT
	, QID2
	, QID3_1_TEXT
	, QID3_2_TEXT
	, QID3_3_TEXT
	, QID3_4_TEXT
	, QID3_5_TEXT
	, QID3_6_TEXT
	, QID4
	, QID5_1_TEXT
	, QID5_2_TEXT
	, QID5_3_TEXT
	, QID5_4_TEXT
	, QID5_5_TEXT
	, QID5_6_TEXT
	, QID5_7_TEXT
	, QID5_8_TEXT
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
