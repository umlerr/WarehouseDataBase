CREATE VIEW Wrhs.ContractsToday AS
SELECT *
FROM Wrhs.Contracts
WHERE GETDATE() BETWEEN StartDate AND EndDate;