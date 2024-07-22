CREATE VIEW OccupancyView AS
SELECT
    R.RoomID,
    R.Capacity AS RoomCapacity,
    COUNT(S.ShelfID) AS OccupiedShelves,
    R.Capacity - COUNT(S.ShelfID) AS FreeShelves
FROM
    Wrhs.Rooms R
LEFT JOIN
    Wrhs.Shelves S ON R.RoomID = S.RoomID
GROUP BY
    R.RoomID,
    R.Capacity;