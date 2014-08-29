Use BHR 
GO

SELECT 
	iq.SubjectCode
	, HasSleepProblems AS 'IQ_SleepProblems'
	, iq.SleepApnea AS 'IQ_HasApnea'
	, med.SleepApnea AS 'MedHistory_HasApnea'
	, case when sleep.OverallSleepQuality = 0 then 'good' when sleep.OverallSleepQuality = 1 then 'fairly good' when sleep.OverallSleepQuality = 2 then 'fairly bad' when sleep.OverallSleepQuality = 3 then 'bad' end
		AS 'SleepHistory_OverallQuality'
	, iq.TookSleepMedications
	, case when sleep.FrequencyTakenSleepMeds = 1 then 'None' when sleep.FrequencyTakenSleepMeds = 2 then 'less than once' when sleep.FrequencyTakenSleepMeds = 3 then 'once or twice' when sleep.FrequencyTakenSleepMeds = 4 then '3 or more' end
		AS 'Sleep_WeeklyMedsTaken'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	Sleep sleep
ON
	sleep.SubjectCode = iq.SubjectCode
INNER JOIN
	MedicalHistory med
ON
	med.SubjectCode = iq.SubjectCode


---COUNTS?
SELECT alias.IQ_SleepProblems, alias.IQ_HasApnea, alias.MedHistory_HasApnea, alias.SleepHistory_OverallQuality, alias.TookSleepMedications, alias.Sleep_WeeklyMedsTaken, COUNT (1) as Totals

FROM (
SELECT 
	iq.SubjectCode
	, HasSleepProblems AS 'IQ_SleepProblems'
	, iq.SleepApnea AS 'IQ_HasApnea'
	, med.SleepApnea AS 'MedHistory_HasApnea'
	, case when sleep.OverallSleepQuality = 0 then 'good' when sleep.OverallSleepQuality = 1 then 'fairly good' when sleep.OverallSleepQuality = 2 then 'fairly bad' when sleep.OverallSleepQuality = 3 then 'bad' end
		AS 'SleepHistory_OverallQuality'
	, iq.TookSleepMedications
	, case when sleep.FrequencyTakenSleepMeds = 1 then 'None' when sleep.FrequencyTakenSleepMeds = 2 then 'less than once' when sleep.FrequencyTakenSleepMeds = 3 then 'once or twice' when sleep.FrequencyTakenSleepMeds = 4 then '3 or more' end
		AS 'Sleep_WeeklyMedsTaken'
	
FROM 
InitialQuestionnaire iq

INNER JOIN
	Sleep sleep
ON
	sleep.SubjectCode = iq.SubjectCode
INNER JOIN
	MedicalHistory med
ON
	med.SubjectCode = iq.SubjectCode

) alias

GROUP BY
	 alias.IQ_SleepProblems, alias.IQ_HasApnea, alias.MedHistory_HasApnea, alias.SleepHistory_OverallQuality, alias.TookSleepMedications, alias.Sleep_WeeklyMedsTaken
	
ORDER BY 
	Totals desc
	