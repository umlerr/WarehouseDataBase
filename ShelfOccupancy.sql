CREATE VIEW ShelfOccupancy AS
SELECT
    S.ShelfID,
    S.Capacity,
    (S.Capacity - COALESCE(SUM(P.Quantity), 0)) AS FreeSpace
FROM
    Wrhs.Shelves S
LEFT JOIN
    Wrhs.Products P ON S.ShelfID = P.ShelfID
GROUP BY
    S.ShelfID,
    S.Capacity;