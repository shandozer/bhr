CREATE VIEW
  BPT
AS
SELECT
  s.SubjectCode
	, [Go.no.go.32.raw.score] AS GoNoGo_Raw
	, [Go.no.go.32.raw.time] AS GoNoGo_Time
	, [Go.no.go.32.percentile] AS GoNoGo_Percentile
	, [Go.no.go.32.scaled.score] AS GoNoGo_Scaled
	, [go.no.go.pnormed] AS GoNoGo_PNormed
	
	, [Memory.span.28.raw.score] AS MemorySpan_Raw
	, [Memory.span.28.raw.time] AS MemorySpan_Time
	, [Memory.span.28.percentile] AS MemorySpan_Percentile
	, [Memory.span.28.scaled.score] AS MemorySpan_Scaled
	, [memory.span.pnormed] AS MemorySpan_PNormed

	, [Reverse.memory.span.33.raw.score] AS ReverseMemorySpan_Raw
	, [Reverse.memory.span.33.raw.time] AS ReverseMemorySpan_Time
	, [Reverse.memory.span.33.percentile] AS ReverseMemorySpan_Percentile
	, [Reverse.memory.span.33.scaled.score] AS ReverseMemorySpan_Scaled
	, [reverse.memory.span.pnormed] AS ReverseMemorySpan_PNormed

	, [Trail.making.b.40.raw.score] AS TrailsB_Raw
	, [Trail.making.b.40.raw.time] AS TrailsB_Time
	, [Trail.making.b.40.percentile] AS TrailsB_Percentile
	, [Trail.making.b.40.scaled.score] AS TrailsB_Scaled
	, [trail.making.b.pnormed] AS TrailsB_PNormed

	, [sum_score] AS SumScore
	, [grand.index.pnormed] AS GrandIndexPNormed

FROM
  LL.BPT b
INNER JOIN
  CodeKey c
ON
  b.bhr_user_id = c.SalesforceID
INNER JOIN
  Subjects s
ON
  c.SubjectCode = s.SubjectCode
WHERE
  b.[Completed.at] IS NOT NULL