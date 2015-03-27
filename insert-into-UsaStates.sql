BULK
INSERT UsaStates
FROM 'C:\GitHub\List-of-neighboring-states-for-each-US-state\usa-states.csv'
WITH
(
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO