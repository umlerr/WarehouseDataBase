CREATE FUNCTION Wrhs.CheckRoom
    (@RoomID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsAvailable BIT
    DECLARE @CurrentCapacity INT
    DECLARE @MaxCapacity INT
    
    SET @CurrentCapacity = ISNULL((SELECT COUNT(*) FROM Wrhs.Shelves WHERE RoomID = @RoomID), 0)
    SET @MaxCapacity = (SELECT Capacity FROM Wrhs.Rooms WHERE RoomID = @RoomID)
    
    IF (@CurrentCapacity IS NULL)
        SET @CurrentCapacity = 0
    
    DECLARE @AvailableSpace INT
    SET @AvailableSpace = @MaxCapacity - @CurrentCapacity
    
    IF (@AvailableSpace >= 1)
        SET @IsAvailable = 1
    ELSE
        SET @IsAvailable = 0
    
    RETURN @IsAvailable
END