Use BHR 
GO

SELECT 
	iq.SubjectCode
	, iq.AlcoholicDrinksFrequency AS IQ_AlcDrinksFrequency
	, iq.AlcoholicDrinks_6PerDay AS IQ_6DrinksPerDay
	, med.AlcAbuse AS Med_AlcAbuse
	, med.YearsAlcAbuse AS Med_YearsAlcAbused
	, med.NumberDailyDrinksWhenAbused AS Med_NumberDailyDrinksWhenAbused
	, iq.Diabetes AS IQ_Diabetes
	, med.Dx_Diabetes AS Med_Diabetes
	, iq.HasHypertensionOrHighBloodPressure AS IQ_HighBloodPressure
	, med.Dx_HighBloodPressure AS Med_HighBloodPressure
	, iq.SmokeCigarettes AS IQ_Smoker
	, med.Smoker AS Med_Smoker
	, iq.SmokedRegularly AS IQ_SmokedRegularly
	, med.YearsAsSmoker AS Med_YearsSmoker
	, iq.UseRecreationalDrugs
	, med.DrugAbuse AS Med_DrugAbuse
	, med.YearsDrugAbuse AS Med_YearsDrugAbuse
	, iq.TookSleepMedications AS IQ_TookSleepMeds
	
FROM 
	InitialQuestionnaire iq

LEFT OUTER JOIN
	MedicalHistory med
ON
	med.SubjectCode = iq.SubjectCode


---COUNTS?
SELECT alias.IQ_AlcDrinksFrequency, Med_AlcAbuse, IQ_Diabetes, Med_Diabetes, IQ_HighBloodPressure, Med_HighBloodPressure, IQ_Smoker, Med_Smoker,COUNT (1) as Totals

FROM (
SELECT 
	iq.SubjectCode
	, iq.AlcoholicDrinksFrequency AS IQ_AlcDrinksFrequency
	, iq.AlcoholicDrinks_6PerDay AS IQ_6DrinksPerDay
	, med.AlcAbuse AS Med_AlcAbuse
	, med.YearsAlcAbuse AS Med_YearsAlcAbused
	, med.NumberDailyDrinksWhenAbused AS Med_NumberDailyDrinksWhenAbused
	, iq.Diabetes AS IQ_Diabetes
	, med.Dx_Diabetes AS Med_Diabetes
	, iq.HasHypertensionOrHighBloodPressure AS IQ_HighBloodPressure
	, med.Dx_HighBloodPressure AS Med_HighBloodPressure
	, iq.SmokeCigarettes AS IQ_Smoker
	, med.Smoker AS Med_Smoker
	, iq.SmokedRegularly AS IQ_SmokedRegularly
	, med.YearsAsSmoker AS Med_YearsSmoker
	, iq.UseRecreationalDrugs
	, med.DrugAbuse AS Med_DrugAbuse
	, med.YearsDrugAbuse AS Med_YearsDrugAbuse
	, iq.TookSleepMedications AS IQ_TookSleepMeds

	
FROM 
	InitialQuestionnaire iq

LEFT OUTER JOIN
	MedicalHistory med
ON
	med.SubjectCode = iq.SubjectCode
) alias

GROUP BY
	 alias.IQ_AlcDrinksFrequency, Med_AlcAbuse, IQ_Diabetes, Med_Diabetes, IQ_HighBloodPressure, Med_HighBloodPressure, IQ_Smoker, Med_Smoker
	
ORDER BY 
	Totals desc
	