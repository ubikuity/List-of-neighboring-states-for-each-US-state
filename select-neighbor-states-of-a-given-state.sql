DECLARE @MY_STATE AS CHAR(2)

SET @MY_STATE='MO' -- Missouri
SELECT 
    CASE WHEN T1.StateCode<>@MY_STATE THEN T1.StateCode
    ELSE NeighborStateCode END AS NeighborStateCode,
    CASE WHEN T1.StateCode<>@MY_STATE THEN T2.StateName
    ELSE T3.StateName END AS NeighborStateName
FROM NeighborStates T1
INNER JOIN UsaStates T2 ON T1.StateCode=T2.StateCode
INNER JOIN UsaStates T3 ON T1.NeighborStateCode=T3.StateCode
WHERE T1.StateCode=@MY_STATE OR T1.NeighborStateCode=@MY_STATE
/*
NeighborStateCode	NeighborStateName
AR	Arkansas
IA	Iowa
IL	Illinois
KS	Kansas
KY	Kentucky
NE	Nebraska
OK	Oklahoma
TN	Tennessee
*/

-- ALTERNATIVE SOLUTION USING UNION
SET @MY_STATE='TN' -- Tennessee
SELECT StateCode AS NeighborStateCode,
    StateName AS NeighborStateName
FROM UsaStates
WHERE StateCode IN
(
    SELECT NeighborStateCode FROM NeighborStates WHERE StateCode=@MY_STATE
    UNION
    SELECT StateCode FROM NeighborStates WHERE NeighborStateCode=@MY_STATE
)
/*
NeighborStateCode	NeighborStateName
AL	Alabama
AR	Arkansas
GA	Georgia
KY	Kentucky
MO	Missouri
MS	Mississippi
NC	North Carolina
VA	Virginia
*/