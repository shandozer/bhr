CREATE VIEW
  Reports.EnrolledPopulation_BayArea
AS
SELECT
    County
    , COUNT(1) AS Total
    , MIN(tot.Over20) AS Population
    , CAST(COUNT(1) AS FLOAT) / CAST(MIN(tot.Over20) AS FLOAT) AS PopulationPct
    , SUM(CASE WHEN s.Age >= 55 THEN 1 ELSE 0 END) AS Over55
    , MIN(o55.Over55) AS PopulationOver55
    , CAST(SUM(CASE WHEN s.Age >= 55 THEN 1 ELSE 0 END) AS FLOAT) / CAST(MIN(o55.Over55) AS FLOAT) AS Over55Pct
FROM
    Subjects s
INNER JOIN
    (SELECT CTYNAME, SUM(TOT_POP) AS Over20 FROM census2013 WHERE YEAR = 6 AND AGEGRP >= 5 GROUP BY CTYNAME) tot
ON
    s.county = tot.CTYNAME
    INNER JOIN
        (SELECT CTYNAME, SUM(TOT_POP) AS Over55 FROM census2013 WHERE YEAR = 6 AND AGEGRP >= 12 GROUP BY CTYNAME) o55
    ON
        s.county = o55.CTYNAME
WHERE
    county IN (
        --'Mendocino County'
        --, 'Lake County'
        'San Francisco County'
        , 'Napa County'
        , 'Sonoma County'
        , 'Marin County'
        --, 'Yolo County'
        , 'San Mateo County'
        --, 'Santa Cruz County'
        --, 'Monterey County'
        , 'Solano County'
        --, 'Sacramento County'
        --, 'Yuba County'
        --, 'Placer County'
        --, 'El Dorado County'
        --, 'San Joaquin County'
        --, 'Stanislaus County'
        --, 'Merced County'
        --, 'Fresno County'
        , 'Santa Clara County'
        , 'Alameda County'
        , 'Contra Costa County'
        --, 'San Benito County'
        --, 'Kings County'
    )
    AND state = 'CA'
GROUP BY
    county
