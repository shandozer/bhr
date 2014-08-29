Use BHR 
GO

SELECT 
	iq.SubjectCode
	, iq.InGoodSpirits
		AS 'IQ_GoodSpirits'
	, m.InGoodSpirits
		AS 'Mood_GoodSpirits'
	, iq.HasDroppedInterestsOrActivities
		AS 'IQ_DroppedInterests'
	, m.DroppedInterests
		AS 'Mood_DroppedInterests'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	Mood m
ON
	m.SubjectCode = iq.SubjectCode


---COUNTS?
SELECT alias.IQ_GoodSpirits, alias.Mood_GoodSpirits, alias.IQ_DroppedInterests, alias.Mood_DroppedInterests, COUNT (1) as Totals

FROM (
SELECT 
	iq.SubjectCode
	, iq.InGoodSpirits
		AS 'IQ_GoodSpirits'
	, m.InGoodSpirits
		AS 'Mood_GoodSpirits'
	, iq.HasDroppedInterestsOrActivities
		AS 'IQ_DroppedInterests'
	, m.DroppedInterests
		AS 'Mood_DroppedInterests'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	Mood m
ON
	m.SubjectCode = iq.SubjectCode
) alias

GROUP BY
	alias.IQ_GoodSpirits, alias.Mood_GoodSpirits, alias.IQ_DroppedInterests, alias.Mood_DroppedInterests
	
ORDER BY 
	Totals desc
	