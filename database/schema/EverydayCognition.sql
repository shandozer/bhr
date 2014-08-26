CREATE VIEW
  EverydayCognition
AS
SELECT
  s.SubjectCode
	, QID48
	, QID49_1
	, QID49_2
	, QID49_3
	, QID49_4
	, QID49_5
	, QID49_6
	, QID49_7
	, QID49_8
	, QID50_1
	, QID50_2
	, QID50_3
	, QID50_4
	, QID50_5
	, QID50_6
	, QID50_7
	, QID50_8
	, QID50_9
	, QID51_1
	, QID51_2
	, QID51_3
	, QID51_4
	, QID51_5
	, QID51_6
	, QID51_7
	, QID52_1
	, QID52_2
	, QID52_3
	, QID52_4
	, QID52_5
	, QID53_1
	, QID53_2
	, QID53_3
	, QID53_4
	, QID53_5
	, QID53_6
	, QID54_1
	, QID54_2
	, QID54_3
	, QID54_4
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_EverydayCognition d
ON
  k.SalesforceID = d.ExternalDataReference
