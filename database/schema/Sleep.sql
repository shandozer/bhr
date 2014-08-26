CREATE VIEW
  Sleep
AS
SELECT
  s.SubjectCode
	, QID141
	, QID142
	, QID143
	, QID94
	, QID95_1
	, QID95_2
	, QID95_3
	, QID95_4
	, QID95_5
	, QID95_6
	, QID95_7
	, QID95_8
	, QID95_9
	, QID95_10
	, QID95_10_TEXT
	, QID96
	, QID97
	, QID98
	, QID145
	, QID146
	, QID101_1
	, QID101_2
	, QID101_3
	, QID101_4
	, QID101_5
	, QID101_5_TEXT
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.Lifestyle_Sleep d
ON
  k.SalesforceID = d.ExternalDataReference
