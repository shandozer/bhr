ALTER VIEW
  MedicalHistory
AS
SELECT
  s.SubjectCode
	, [Score-sum] AS Score_Sum
	, [Score-weightedAvg] AS Score_Avg
	, [Score-weightedStdDev] AS Score_SD

	, case when [QID1_1] = 2 then 'no' when [QID1_1] = 1 then 'yes' end 
		AS 'Dx_Parkinsons'
	, case when [QID1_2] = 2 then 'no' when [QID1_2] = 1 then 'yes' end  
		AS 'Dx_MovementDisorder'
	, case when [QID1_3] = 2 then 'no' when [QID1_3] = 1 then 'yes' end 
		AS 'Dx_Stroke'
	, case when [QID1_4] = 2 then 'no' when [QID1_4] = 1 then 'yes' end 
		AS 'Dx_MotorNeuronDisease'
	, case when [QID1_5] = 2 then 'no' when [QID1_5] = 1 then 'yes' end
		AS 'Dx_Dementia'
	, [QID1_6]
	, [QID1_7]
	, [QID1_8]
	, case when [QID1_9] = 2 then 'no' when [QID1_9]  = 1 then 'yes' end
		AS 'Dx_Diabetes'
	, case when [QID1_10] = 2 then 'no' when [QID1_10]  = 1 then 'yes' end
		AS 'Dx_Cancer' 
	, case when [QID1_11] = 2 then 'no' when [QID1_11]  = 1 then 'yes' end
		AS 'Dx_Schizo'
	, case when [QID1_12] = 2 then 'no' when [QID1_12] = 1 then 'yes' end
		AS 'Dx_Alzheimers'
	, case when [QID1_13] = 2 then 'no' when [QID1_13] = 1 then 'yes' end
		 AS 'Dx_MCI'
	, case when [QID1_14] = 2 then 'no' when [QID1_14] = 1 then 'yes' end
		AS 'Dx_TBI'
	, [QID1_15]
	, [QID1_16]
	, [QID1_17]
	, [QID1_18]
	, case when [QID1_19] = 2 then 'no' when [QID1_19] = 1 then 'yes' end
		AS 'EpilipsyOrSeizures'
	, [QID1_20]
	, [QID2] AS 'CronicPain' 
	, [QID3_1] AS 'PainRating'
	, case when [QID4] = 2 then 'no' when [QID4] = 1 then 'yes' end 
		AS 'SleepApnea'
	, [QID5] AS 'ToldSnoringLoud'
	, case when [QID6]  = 2 then 'no' when [QID6]  = 1 then 'yes' end
		AS 'HasAllergies'
	, [QID7_1_TEXT] AS 'Allergy1'
	, [QID7_2_TEXT] AS 'Allergy2'
	, [QID7_3_TEXT] AS 'Allergy3'
	, [QID7_4_TEXT] AS 'Allergy4'
	, [QID7_5_TEXT] AS 'Allergy5'
	, case when [QID9] = 2 then 'no' when [QID9] = 1 then 'yes' end 
		 AS 'AlcAbuse'
	, case when [QID13] like '%years%' then REPLACE([QID13],'%years%', '') else [QID13] end 
		AS 'YearsAlcAbuse'
	, [QID15] AS 'YearsSinceAlcAbuse'
	, [QID16] AS 'NumberDailyDrinksWhenAbused'
	, case when [QID17] = 2 then 'no' when [QID17] = 1 then 'yes' end  
		AS 'DrugAbuse'
	, [QID18] AS 'YearsDrugAbuse'
	, [QID19] AS 'YearsSinceDrugAbuse'
	, case when [QID20] = 2 then 'no' when [QID20] = 1 then 'yes' end  
		 AS 'Smoker'
	, [QID21] AS 'YearsAsSmoker'
	, [QID22] AS 'YearsSinceSmoker'
	, [QID23] AS 'DailyCigs'
	, [QID26] 
	, [QID28#1_1] AS QID28_1_1
	, [QID28#1_2] AS QID28_1_2
	, [QID28#1_3] AS QID28_1_3
	, [QID28#1_4] AS QID28_1_4
	, [QID28#1_5] AS QID28_1_5
	, [QID28#1_6] AS QID28_1_6
	, [QID28#1_7] AS QID28_1_7
	, [QID28#1_8] AS QID28_1_8
	, [QID28#1_9] AS QID28_1_9
	, [QID28#1_10] AS QID28_1_10
	, [QID28#1_11] AS QID28_1_11
	, [QID28#1_12] AS QID28_1_12
	, [QID28#1_13] AS QID28_1_13
	, [QID28#1_14] AS QID28_1_14
	, [QID28#1_15] AS QID28_1_15
	, [QID28#2_1] AS QID28_2_1
	, [QID28#2_2] AS QID28_2_2
	, [QID28#2_3] AS QID28_2_3
	, [QID28#2_4] AS QID28_2_4
	, [QID28#2_5] AS QID28_2_5
	, [QID28#2_6] AS QID28_2_6
	, [QID28#2_7] AS QID28_2_7
	, [QID28#2_8] AS QID28_2_8
	, [QID28#2_9] AS QID28_2_9
	, [QID28#2_10] AS QID28_2_10
	, [QID28#2_11] AS QID28_2_11
	, [QID28#2_12] AS QID28_2_12
	, [QID28#2_13] AS QID28_2_13
	, [QID28#2_14] AS QID28_2_14
	, [QID28#2_15] AS QID28_2_15

FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  Q.MedicalHistory_MedicalHistory d
ON
  k.SalesforceID = d.ExternalDataReference
