CREATE PROCEDURE Wrhs.AddContract
(
    @CompanyID INT,
    @StartDateStr VARCHAR(10),
    @EndDateStr VARCHAR(10)
)
AS
BEGIN
	DECLARE @StartDate DATE;
    DECLARE @EndDate DATE;
    IF (Wrhs.ValidateDates(@StartDateStr, @EndDateStr) = 1)
    BEGIN
		SET @StartDate = TRY_CAST(@StartDateStr AS DATE);
		SET @EndDate = TRY_CAST(@EndDateStr AS DATE);
        INSERT INTO Wrhs.Contracts (CompanyID, StartDate, EndDate)
        VALUES (@CompanyID, @StartDate, @EndDate);
        SELECT 'Запись успешно добавлена.' AS [Результат];
    END
    ELSE
    BEGIN
        SELECT 'Невалидные даты. Запись не добавлена.' AS [Результат];
    END
END;
