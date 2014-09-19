

CREATE VIEW
	Reports.Growth
AS

WITH Daily(Day, N)
AS (
    SELECT
        CAST(RegistrationDateTime AS DATE) AS Day
        , COUNT(1) AS N
    FROM
        Subjects s
	INNER JOIN
		Studies st
	ON
		s.StudyID = st.ID
	WHERE
		st.Code = 'BHR'
    GROUP BY 
        CAST(RegistrationDateTime AS DATE)
)
SELECT
	Day
	, ( SELECT SUM(N) FROM Daily WHERE Day <= d.Day) AS TotalN
	, N AS DailyN
FROM
	Daily d

