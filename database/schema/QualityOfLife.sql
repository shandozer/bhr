CREATE VIEW
  QualityOfLife
AS
SELECT
  s.SubjectCode
	, QID80
	, QID81
	, QID82_1
	, QID82_2
	, QID82_3
	, QID82_4
	, QID82_5
	, QID82_6
	, QID82_7
	, QID82_8
	, QID82_9
	, QID82_10
	, QID83_1
	, QID83_2
	, QID83_3
	, QID83_4
	, QID84_1
	, QID84_2
	, QID84_3
	, QID85
	, QID86
	, QID87
	, QID140_1
	, QID140_2
	, QID140_3
	, QID140_4
	, QID140_5
	, QID140_6
	, QID140_7
	, QID140_8
	, QID140_9
	, QID88
	, QID89_1
	, QID89_2
	, QID89_3
	, QID89_4
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.Lifestyle_QualityOfLife d
ON
  k.SalesforceID = d.ExternalDataReference
