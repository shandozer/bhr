CREATE VIEW
  CogState
AS
SELECT
  s.SubjectCode
  , Sessn
	, TCode
	, GMLidx
	, mps
	, dur
	, ter
	, ler
	, rer
	, per
	, lmn
	, lsd
	, acc
	, cor
	, err
	, presnt
	, cmv
	, rth
	, sti
	, cfo
	, res
FROM
  CodeKey k
INNER JOIN
  Subjects s
ON
  k.SubjectCode = s.SubjectCode
INNER JOIN
  CS.extract d
ON
  k.SalesforceID = d.SubjID
