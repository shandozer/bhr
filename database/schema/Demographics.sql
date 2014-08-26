CREATE VIEW
  Demographics
AS
SELECT
  s.SubjectCode
	, QID177
	, QID178
	, QID179
	, QID180
	, QID189
	, QID181
	, QID182
	, QID183
	, QID184_1
	, QID184_2
	, QID184_3
	, QID184_4
	, QID184_5
	, QID184_6
	, QID184_7
	, QID184_8
	, QID184_9
	, QID184_10
	, QID184_11
	, QID184_12
	, QID184_13
	, QID185
	, QID186
	, QID192
	, QID193
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.Lifestyle_Demographics d
ON
  k.SalesforceID = d.ExternalDataReference
