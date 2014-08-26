CREATE VIEW
  FamilyTree
AS
SELECT
  s.SubjectCode
	, QID47_4
	, QID47_5
	, QID47_6
	, QID47_7
	, QID47_8
	, QID47_9
	, QID47_10
	, QID47_11
	, QID47_12
	, QID47_13
	, QID47_14
	, QID47_15
	, QID47_16
	, QID47_17
	, QID47_18
	, QID47_19
	, QID47_20
	, QID47_21
	, QID47_22
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_FamilyTree d
ON
  k.SalesforceID = d.ExternalDataReference
