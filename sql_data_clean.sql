-- Query 1
SELECT COUNT(*) AS 'Total Trips'
FROM cs480project.greentrips;

-- Query 2
CREATE TABLE dataset
AS (SELECT VendorID, 
			lpep_pickup_datetime, 
            Lpep_dropoff_datetime, 
            Pickup_longitude, 
            Pickup_latitude, 
            Dropoff_longitude, 
            Dropoff_latitude, 
            Passenger_count, 
            Trip_distance
	FROM greentrips);

-- Query 3
DELETE FROM dataset
WHERE dataset.Trip_distance = 0;

-- Query 4
DELETE FROM dataset
WHERE dataset.lpep_pickup_datetime = dataset.Lpep_dropoff_datetime;

-- Query 5
DELETE FROM dataset
WHERE dataset.Passenger_count >= 3;

-- Query 6
ALTER TABLE cs480project.dataset
CHANGE COLUMN lpep_pickup_datetime lpep_pickup_datetime DATETIME NULL DEFAULT NULL,
CHANGE COLUMN Lpep_dropoff_datetime Lpep_dropoff_datetime DATETIME NULL DEFAULT NULL;

-- Query 7
ALTER TABLE cs480project.dataset
ORDER BY lpep_pickup_datetime ASC, Lpep_dropoff_datetime ASC;

-- Query 8
CREATE TABLE finalDataset
AS (SELECT VendorID, 
	lpep_pickup_datetime, 
    Lpep_dropoff_datetime, 
    Pickup_longitude, 
    Pickup_latitude, 
    Dropoff_longitude, 
    Dropoff_latitude, 
    Passenger_count, 
    Trip_distance, 
    (Trip_distance)/(TIMEDIFF(Lpep_dropoff_datetime, lpep_pickup_datetime)/(100*60)) AS 'Average'
FROM cs480project.dataset
ORDER BY lpep_pickup_datetime ASC);