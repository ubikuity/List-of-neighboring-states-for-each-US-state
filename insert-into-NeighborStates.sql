BULK
INSERT NeighborStates
FROM 'C:\GitHub\List-of-neighboring-states-for-each-US-state\neighbors-states.csv'
WITH
(
    FIRSTROW=2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
)
GO