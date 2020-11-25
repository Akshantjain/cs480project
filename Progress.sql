-- SELECT ALL THE DATA FROM GREEN TRIPS
SELECT * 
FROM greentrips;

-- SELECT THE TRIPS WITH TIME DIFFERENCE OF LESS THAN 5 MINUTES
SELECT G1.lpep_pickup_datetime, G2.lpep_pickup_datetime
FROM greentrips AS G1, greentrips AS G2
WHERE G1.RIDE_ID != G2.RIDE_ID
AND (MINUTE(TIMEDIFF(G1.lpep_pickup_datetime, G2.lpep_pickup_datetime))) < 5;

-- COUNT THE NUMBER OF TRIPS WITH TIME DIFFERENCE OF LESS THAN 5 MINUTES
SELECT COUNT(*)
FROM greentrips AS G1, greentrips AS G2
WHERE G1.RIDE_ID != G2.RIDE_ID
AND (MINUTE(TIMEDIFF(G1.lpep_pickup_datetime, G2.lpep_pickup_datetime))) < 5;

-- SELECT THE TRIPS WITH TIME DIFFERENCE OF LESS THAN 5 MINUTES AND PASSANGER COUNT OF LESS THAN 4
SELECT G1.lpep_pickup_datetime, G2.lpep_pickup_datetime
FROM greentrips AS G1, greentrips AS G2
WHERE G1.RIDE_ID != G2.RIDE_ID
AND MINUTE(TIMEDIFF(G1.lpep_pickup_datetime, G2.lpep_pickup_datetime)) < 5
AND (G1.Passenger_count + G2.Passenger_count ) <=3;

-- COUNT THE TRIPS WITH TIME DIFFERENCE OF LESS THAN 5 MINUTES AND PASSANGER COUNT OF LESS THAN 4
SELECT COUNT(*)
FROM greentrips AS G1, greentrips AS G2
WHERE G1.RIDE_ID != G2.RIDE_ID
AND MINUTE(TIMEDIFF(G1.lpep_pickup_datetime, G2.lpep_pickup_datetime)) < 5
AND (G1.Passenger_count + G2.Passenger_count ) <=3;

-- GET THE DISTANCE BETWEEN TWO PICKUP POINTS WITH DISTANCE OF LESS THAN 1 MILE
SELECT G1.RIDE_ID,G2.RIDE_ID, G1.lpep_pickup_datetime, G2.lpep_pickup_datetime, ( 3963 * acos( sin( radians(G1.Pickup_latitude) ) * sin( radians( G2.Pickup_latitude ) ) + cos( radians(G1.Pickup_latitude) ) * cos( radians( G2.Pickup_latitude ) ) * cos( radians( G2.Pickup_longitude ) - radians(G1.Pickup_longitude) ) ) ) AS distance 
FROM greentrips as G1, greentrips as G2
WHERE G1.RIDE_ID != G2.RIDE_ID
HAVING distance < 1;

-- SELECT THE TRIPS WITH TIME DIFFERENCE OF LESS THAN 5 MINUTES AND PASSANGER COUNT OF LESS THAN 4
-- AND WITH PICKUP DISTANCE OF LESS THAN A MILE
SELECT 	g1.lpep_pickup_datetime, 
		g2.lpep_pickup_datetime, 
        (g1.Passenger_count + g2.Passenger_count) AS "Total Passangers",
		( 3963 * acos(sin(radians(G1.Pickup_latitude)) * sin(radians(G2.Pickup_latitude)) + 
		 cos(radians(G1.Pickup_latitude)) * cos(radians(G2.Pickup_latitude)) * 
		 cos(radians(G2.Pickup_longitude) - radians(G1.Pickup_longitude)))) AS distance

FROM greentrips as g1, greentrips as g2
WHERE g1.RIDE_ID != g2.RIDE_ID
AND MINUTE(TIMEDIFF(g1.lpep_pickup_datetime, g2.lpep_pickup_datetime)) < 5
AND (g1.Passenger_count + g2.Passenger_count) <= 3
HAVING distance < 1;

-- CREATE A NEW COLUMN WITH THE AVG. SPEED OF THE DRIVER DURING EACH TRIP


-- GET THE SPEED OF THE DRIVER FOR THE JOURNEY (BEST OF THE TWO DRIVERS FROM THE TWO TRIPS)


-- GET THE PICKUPS WHICH COULD BE COVERED IN LESS THAN 5 MINUTES ACCORDING TO
-- THE DISTANCE AND AVG. SPEED OF THE BEST DRIVER FROM THE LAST QUERY.


-- GET THE SAVINGS ACCORDING TO THE APPENDIX NO.4 TO SEE WHICH TRIPS ARE MERGEABLE