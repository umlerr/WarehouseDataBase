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
		SELECT '������ ������� ���������.' AS [���������];
    END
    ELSE
    BEGIN
        SELECT '������! ������ �� ���������. ��������� ����� ���� �����������' AS [���������];
    END
END