CREATE VIEW
  InitialQuestionnaire
AS
SELECT
  k.SubjectCode
	, CASE Alcoholic_drinks_6_per_day__c WHEN 'false' THEN 0 WHEN 'true' THEN 1 ELSE NULL END AS AlcoholicDrinks_6PerDay
	, Health__c AS Health
	, Medications__c AS Medications
	, Previous_Year_Health__c AS PreviousYearHealth
	, CASE Sleep_apnea__c WHEN 'false' THEN 0 WHEN 'true' THEN 1 ELSE NULL END AS SleepApnea
	, Smoke_cigarettes__c AS SmokeCigarettes
	, CASE Use_Recreational_Drugs__c WHEN 'false' THEN 0 WHEN 'true' THEN 1 ELSE NULL END AS UseRecreationalDrugs
	, Alcoholic_drinks_frequency__c AS AlcoholicDrinksFrequency
	, Change_in_memory_in_past_10_years__c AS ChangeInMemoryPastDecade
	, Diabetes__c AS Diabetes
	, Family_Members_has_Alzheimer__c AS FamilyHistoryAlzheimers
	, Has_Dropped_Interests_or_Activities__c AS HasDroppedInterestsOrActivities
	, Has_Hypertension_High_Blood_Pressure__c AS HasHypertensionOrHighBloodPressure
	, Has_Sleep_Problems__c AS HasSleepProblems
	, In_good_spirits__c AS InGoodSpirits
	, Is_English_First_Language__c AS IsEnglishFirstLanguage
	, Memory_problem_concerns__c AS MemoryProblemConcerns
	, Smoked_Regularly__c AS SmokedRegularly
	, Took_Sleep_Medications__c AS TookSleepMedications
	, Trouble_remembering__c AS TroubleRemembering
FROM
  CodeKey k
INNER JOIN
  SF.Contact c
ON
  k.SalesforceID = c.Id
AND
  IsDeleted = 'false'