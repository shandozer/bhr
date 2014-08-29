--CREATE VIEW
ALTER VIEW
  QualityOfLife
AS
SELECT
  s.SubjectCode
	, case 
			when QID80 = 1 then 'excellent' 
			when QID80 = 2 then 'very good' 
			when QID80 = 3 then 'good' 
			when QID80 = 4 then 'fair' 
			when QID80 = 5 then 'poor' end
		AS 'GeneralHealth' 
		
	, case 
			when QID81 = 1 then 'much better' 
			when QID81 = 2 then 'somewhat better' 
			when QID81 = 3 then 'about same' 
			when QID81 = 4 then 'somewhat worse' 
			when QID81 = 5 then 'much worse' end
		AS 'HealthComparedToYearAgo'
		
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
	, case 
			when QID86 = 1 then 'none' 
			when QID86 = 2 then 'very mild' 
			when QID86 = 3 then 'mild' 
			when QID86 = 4 then 'moderate' 
			when QID86 = 5 then 'severe' 
			when QID86 = 6 then 'very severe' end
		AS 'BodilyPainInLastMonth'
		
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
