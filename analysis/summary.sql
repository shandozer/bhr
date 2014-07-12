SELECT
    Age__c
    , CreatedDate
    , Gender__c
    , Has_Initial_Questionnaire_Completed__c
    , Race_Ethnicity_Selected__c
    , Family_Members_has_Alzheimer__c
    , Memory_problem_concerns__c
    , Has_Sleep_Problems__c
    , t.TestsCompleted
    , t.CompletionRate
    , t.QuestionnairesCompleted
    , t.QuestionnairesCompletedPct
    , t.CogStateCompleted
    , t.LumosityCompleted
    , Change_in_memory_in_past_10_years__c
    , Use_Recreational_Drugs__c
    , Health__c
    , Previous_Year_Health__c
    , Alcoholic_drinks_frequency__c
    , Diabetes__c
    , In_good_spirits__c
    , Smoke_cigarettes__c
    , Trouble_remembering__c
    , CASE
            WHEN t.CogStateCompleted > 0 AND t.LumosityCompleted > 0 THEN 'Both'
            WHEN t.CogStateCompleted = 0 AND t.LumosityCompleted > 0 THEN 'Lumosity'
            WHEN t.CogStateCompleted > 0 AND t.LumosityCompleted = 0 THEN 'CogState'
            ELSE 'Neither'
        END AS TestStatus
    , f.HowEasy
    , f.HowClear
    , f.HowLikely
FROM
    Contact c
LEFT OUTER JOIN
( 
    SELECT
      c.Id
      , SUM(CASE WHEN qr.Status__c = 'Completed' THEN 1 ELSE 0 END) AS TestsCompleted
      , MAX(CASE WHEN qr.Status__c = 'Completed' AND s.Name = 'Card Cognitive Test' THEN 1 ELSE 0 END) AS CogStateCompleted
      , MAX(CASE WHEN qr.Status__c = 'Completed' AND s.Name = 'Lumosity Test' THEN 1 ELSE 0 END) AS LumosityCompleted
      , SUM(CASE WHEN qr.Status__c = 'Completed' AND s.Name NOT IN ('Lumosity Test', 'Card Cognitive Test') THEN 1 ELSE 0 END) AS QuestionnairesCompleted
      , CAST(CAST(SUM(CASE WHEN qr.Status__c = 'Completed' AND s.Name NOT IN ('Lumosity Test', 'Card Cognitive Test') THEN 1 ELSE 0 END) AS FLOAT)/CAST(10 AS FLOAT) AS DEC(3,2)) AS QuestionnairesCompletedPct
      , CAST(CAST(SUM(CASE WHEN qr.Status__c = 'Completed' THEN 1 ELSE 0 END) AS FLOAT)/CAST(COUNT(1) AS FLOAT) AS DEC(3,2)) AS CompletionRate
    FROM
      Questionnaire_Response__c qr
    INNER JOIN
      Subtab__c s
    ON
      Subtab__c = s.Id
    INNER JOIN
      Contact c
    ON
      Contact__c = c.Id
    WHERE
      (s.Status__c = 'Active' OR s.Name = 'Lumosity Test')
      AND s.Name NOT IN ('My Profile', 'Feedback')
      AND c.CreatedDate > s.CreatedDate
    GROUP BY
      c.Id
) t
ON
    c.Id = t.Id
LEFT OUTER JOIN
(
    SELECT
        s.ExternalDataReference AS Id
        , QID1_1 AS HowEasy
        , QID2_1 AS HowClear
        , QID3 AS HowLikely
    FROM
        FeedbackSurvey f
    INNER JOIN
        TheBrainInitiative s
    ON
        f.ExternalDataReference = s.ExternalDataReference
) f
ON
    c.Id = f.Id
;