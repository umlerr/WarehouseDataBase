CREATE FUNCTION Wrhs.CheckShelf
    (@ShelfID INT, @ProductSize INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsAvailable BIT
    DECLARE @CurrentCapacity INT
    DECLARE @MaxCapacity INT
    
    SET @CurrentCapacity = (SELECT SUM(Quantity) FROM Wrhs.Products WHERE ShelfID = @ShelfID)
    SET @MaxCapacity = (SELECT Capacity FROM Wrhs.Shelves WHERE ShelfID = @ShelfID)
    
    IF (@CurrentCapacity IS NULL)
        SET @CurrentCapacity = 0
    
    DECLARE @AvailableSpace INT
    SET @AvailableSpace = @MaxCapacity - @CurrentCapacity
    
    IF (@AvailableSpace >= @ProductSize)
        SET @IsAvailable = 1
    ELSE
        SET @IsAvailable = 0
    
    RETURN @IsAvailable
END