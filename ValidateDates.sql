CREATE FUNCTION Wrhs.ValidateDates
(
    @StartDateStr VARCHAR(10),
    @EndDateStr VARCHAR(10)
)
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT = 1;
    DECLARE @StartDate DATE;
    DECLARE @EndDate DATE;

    SET @StartDate = TRY_CAST(@StartDateStr AS DATE);
    SET @EndDate = TRY_CAST(@EndDateStr AS DATE);

    IF (@StartDate IS NULL)
        SET @IsValid = 0;

    IF (@EndDate IS NULL)
        SET @IsValid = 0;
    ELSE IF (@EndDate < @StartDate)
        SET @IsValid = 0;

    RETURN @IsValid;
END;