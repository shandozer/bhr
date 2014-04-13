
WITH
Daily(Day, N)
AS (
    SELECT
        date(CreatedDate) AS Day
        , COUNT(1) AS N
    FROM
        Contact
    GROUP BY
        date(CreatedDate)
)
SELECT
Day
, N AS DailyN
, ( SELECT SUM(N) FROM Daily WHERE Day <= d.Day) AS TotalN
FROM
Daily d
;
