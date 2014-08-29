

ALTER VIEW
  EverydayCognition
AS
SELECT
  s.SubjectCode
	, QID48
	, QID49_1 AS 'ShoppingList'
	, QID49_2 AS 'RecentEventsInNews'
	, QID49_3 AS 'DaysOldConversation'
	, QID49_4 AS 'WhereObjectsPlaced'
	, QID49_5 AS 'RepeatingStories'
	, QID49_6 AS 'DayOfTheWeek'
	, QID49_7 AS 'AlreadyToldSomeone'
	, QID49_8 AS 'AppointmentsEngagements'
	, QID50_1 AS 'NamesOfObjects'
	, QID50_2 AS 'VerbalInstructionsGiven'
	, QID50_3 AS 'FindingWordsToUseInConvo'
	, QID50_4 AS 'CommunicatingThoughtsInConvo'
	, QID50_5 AS 'FollowingStoriesViewedInMedia'
	, QID50_6 AS 'UnderstandingSomeonesPointInConvo'
	, QID50_7 AS 'CommonWordMeanings'
	, QID50_8 AS 'DescribingTVProgramViewed'
	, QID50_9 AS 'VerbalInstructionComprehension'
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
