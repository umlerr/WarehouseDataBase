CREATE PROCEDURE Wrhs.AddShelfToRoom(
    @RoomID INT,
    @Capacity INT
)
AS
BEGIN
    IF (Wrhs.CheckRoom(@RoomID) = 1)
    BEGIN
        INSERT INTO Shelves (RoomID, Capacity)
        VALUES (@RoomID, @Capacity)
		SELECT 'Запись успешно добавлена.' AS [Результат];
    END
    ELSE
    BEGIN
        SELECT 'Ошибка! Запись не добавлена. Помещение может быть переполнено' AS [Результат];
    END
END