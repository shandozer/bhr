ALTER VIEW
	Reports.Summary
AS
	
WITH Feedback AS (
    SELECT
        s.ID
        , HowEasy
        , HowClear
        , HowLikely
		, ROW_NUMBER() OVER (PARTITION BY PortalUserId ORDER BY FeedbackDateTime DESC) AS RowNumber
    FROM
        PortalUserFeedbacks puf
    INNER JOIN
        PortalUsers u
	ON
		puf.PortalUserId = u.Id
	INNER JOIN
		Subjects s
	ON
		u.PatientID = s.PatientID
)

SELECT
    DATEDIFF(yy, p.DateOfBirth, s.RegistrationDateTime) AS Age
    , s.RegistrationDateTime
    , CASE p.Gender WHEN 0 THEN 'Male' WHEN 1 THEN 'Female' ELSE NULL END AS Gender
    , dbo.GetRaceEthnicity(p.ID) AS RaceEthnicity
    , FamilyMemberAlzheimers
    , ConcernedMemoryProblem
    , SleepProblems
    , t.TestsCompleted
    , t.CompletionRate
    , t.QuestionnairesCompleted
    , t.QuestionnairesCompletedPct
    , t.CogStateCompleted
    , t.LumosityCompleted
    , CASE
            WHEN t.CogStateCompleted > 0 AND t.LumosityCompleted > 0 THEN 'Both'
            WHEN t.CogStateCompleted = 0 AND t.LumosityCompleted > 0 THEN 'Lumosity'
            WHEN t.CogStateCompleted > 0 AND t.LumosityCompleted = 0 THEN 'CogState'
            ELSE 'Neither'
        END AS TestStatus
    , f.HowEasy
    , f.HowClear
    , f.HowLikely
    , r.Title AS ReferralSource
FROM
    Subjects s
INNER JOIN
	Patients p
ON
	s.PatientID = p.ID
LEFT OUTER JOIN
	ReferralSources r
ON
	s.ReferralSourceID = r.ID
LEFT OUTER JOIN
( 
    SELECT
      s.ID
      , SUM(CASE WHEN p.Status = 3 THEN 1 ELSE 0 END) AS TestsCompleted
      , MAX(CASE WHEN p.Status = 3 AND pt.Title = 'Card Cognitive Test' THEN 1 ELSE 0 END) AS CogStateCompleted
      , MAX(CASE WHEN p.Status = 3 AND pt.Title = 'Brain Performance Test' THEN 1 ELSE 0 END) AS LumosityCompleted
      , SUM(CASE WHEN p.Status = 3 AND pt.Title NOT IN ('Brain Performance Test', 'Card Cognitive Test') THEN 1 ELSE 0 END) AS QuestionnairesCompleted
      , CAST(CAST(SUM(CASE WHEN p.Status = 3 AND pt.Title NOT IN ('Brain Performance Test', 'Card Cognitive Test') THEN 1 ELSE 0 END) AS FLOAT)/CAST(10 AS FLOAT) AS DEC(3,2)) AS QuestionnairesCompletedPct
      , CAST(CAST(SUM(CASE WHEN p.Status = 3 THEN 1 ELSE 0 END) AS FLOAT)/CAST(COUNT(1) AS FLOAT) AS DEC(3,2)) AS CompletionRate
    FROM
      Procedures p
    INNER JOIN
      ProcedureTypes pt
    ON
      p.TypeID = pt.ID
    INNER JOIN
      Subjects s
    ON
      p.SubjectID = s.ID
    WHERE
      pt.Title NOT IN ('Initial CogState Test')
    GROUP BY
      s.ID
) t
ON
    s.ID = t.ID
LEFT OUTER JOIN
(
	SELECT * FROM Feedback WHERE RowNumber = 1
) f
ON
    s.ID = f.ID
LEFT OUTER JOIN
	(
		SELECT 
			p.SubjectID
			, CASE QID4 WHEN 1 THEN 'Yes' WHEN 2 THEN 'No' ELSE NULL END AS FamilyMemberAlzheimers
			, CASE QID2 WHEN 1 THEN 'Yes' WHEN 2 THEN 'No' ELSE NULL END  AS ConcernedMemoryProblem
			, CASE QID10 WHEN 1 THEN 'Yes' WHEN 2 THEN 'No' ELSE NULL END  AS SleepProblems
		FROM
			Qualtrics.SV_bNiZN77psPOU4rH q
		INNER JOIN
			(
				QualtricsResponses r
			INNER JOIN
				Procedures p
			ON
				r.ProcedureID = p.ID
			)
		ON
			q.ResponseID = r.ResponseID

		UNION 

		SELECT
			sc.SubjectID
			, Family_Members_has_Alzheimer__c
			, Memory_problem_concerns__c
			, Has_Sleep_Problems__c
		FROM
			SF.Contact c
		INNER JOIN
			SubjectCodes sc
		ON
			c.Id = sc.Code
			) b
ON
	s.ID = b.SubjectID