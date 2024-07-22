CREATE PROCEDURE Wrhs.AddProductToShelf
    @ShelfID INT,
    @ContractID INT,
    @Name NVARCHAR(20),
    @Type NVARCHAR(20),
    @Quantity INT
AS
BEGIN
	DECLARE @IsAvailable BIT;
	SET @IsAvailable = Wrhs.CheckShelf(@ShelfID, @Quantity)
    IF (@IsAvailable = 1)
    BEGIN
        INSERT INTO Wrhs.Products (ShelfID, ContractID, Name, Type, Quantity)
        VALUES (@ShelfID, @ContractID, @Name, @Type, @Quantity);
		SELECT '����� ������� �������� �� �����.' AS [���������];
    END
    ELSE
    BEGIN
		SELECT '������������ ����� �� ����� ��� ���������� ������.' AS [���������];
    END
END