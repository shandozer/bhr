ALTER VIEW
  Sleep
AS
SELECT
  s.SubjectCode
	, QID141 AS 'BedTime'
	, QID142 AS 'MinutesUntilSleeping'
	, QID143 AS 'WakingTime'
	, QID94 AS 'EstimateHoursActuallySlept'
	, QID95_1 AS 'TroubleSleeping_CantSleepWithin30Min'
	, QID95_2 AS 'TroubleSleeping_MiddleNightWaking'
	, QID95_3 AS 'TroubleSleeping_UseBathroom'
	, QID95_4 AS 'TroubleSleeping_CannotBreatheWell'
	, QID95_5 AS 'TroubleSleeping_CoughedOrSnored'
	, QID95_6 AS 'TroubleSleeping_FeelCold'
	, QID95_7 AS 'TroubleSleeping_FeelHot'
	, QID95_8 AS 'TroubleSleeping_BadDreams'
	, QID95_9 AS 'TroubleSleeping_Pain'
	, QID95_10 AS 'TroubleSleeping_Other'
	, QID95_10_TEXT AS 'TroubleSleeping_OtherDetails'
	, QID96 AS 'OverallSleepQuality'
	, QID97 AS 'FrequencyTakenSleepMeds'
	, QID98 AS 'Frequency_TroubleStayingAwake'
	, QID145 AS 'Frequency_TroubleKeepingUpEnthusiasm'
	, QID146 AS 'BedPartnershipStatus'
	, QID101_1 AS 'Bystander_LoudSnoring'
	, QID101_2 AS 'Bystander_LongPausesTweenBreaths'
	, QID101_3 AS 'Bystander_TwitchyLegs'
	, QID101_4 AS 'Bystander_ConfusionDuringSleep'
	, QID101_5 AS 'Bystander_OtherRestlessness'
	, QID101_5_TEXT AS 'Bystander_OtherRestlessnessDetails'
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
