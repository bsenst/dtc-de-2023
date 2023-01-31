-- Preparation: Show table columns.
SELECT
    * EXCEPT(is_generated, generation_expression, is_stored, is_updatable)
  FROM
    `dtc-de-nyctaxi-20230131`.dtc_de_nyctaxi_dataset_20230131.INFORMATION_SCHEMA.COLUMNS
  WHERE
    table_name = 'green_2019_01';

-- Question 3. Count records: How many taxi trips were totally made on January 15? Tip: started and finished on 2019-01-15.
SELECT 
    COUNT(*)
  FROM 
    `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.green_2019_01` 
  WHERE 
    EXTRACT(DAY FROM lpep_pickup_datetime) = 15 AND
    EXTRACT(DAY FROM lpep_dropoff_datetime) = 15 ;

-- Question 4. Largest trip for each day: Which was the day with the largest trip distance Use the pick up time for your calculations.
SELECT 
    MAX(trip_distance)
  FROM 
    `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.green_2019_01` ;

SELECT 
    EXTRACT(DAY FROM lpep_pickup_datetime) as day_max_trip_distance
  FROM 
    `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.green_2019_01` 
  WHERE 
    trip_distance = 117.99 ;

-- Question 5. The number of passengers: In 2019-01-01 how many trips had 2 and 3 passengers?
SELECT 
    COUNT(*)
  FROM 
    `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.green_2019_01` 
  WHERE
    EXTRACT(DAY FROM lpep_pickup_datetime) = 1 AND
    passenger_count = 2 ;

SELECT 
    COUNT(*)
  FROM 
    `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.green_2019_01` 
  WHERE
    EXTRACT(DAY FROM lpep_pickup_datetime) = 1 AND
    passenger_count = 3 ;

-- Question 6. Largest tip: For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip? We want the name of the zone, not the id. Note: it's not a typo, it's tip , not trip
-- Preparation: Show table columns.
SELECT
    * EXCEPT(is_generated, generation_expression, is_stored, is_updatable)
  FROM
    `dtc-de-nyctaxi-20230131`.dtc_de_nyctaxi_dataset_20230131.INFORMATION_SCHEMA.COLUMNS
  WHERE
    table_name = 'zone_lookup';

SELECT
    LocationID
  FROM
    `dtc-de-nyctaxi-20230131`.dtc_de_nyctaxi_dataset_20230131.zone_lookup
  WHERE
    Zone = "Astoria" ;

SELECT
    DOLocationID
  FROM
    `dtc-de-nyctaxi-20230131`.dtc_de_nyctaxi_dataset_20230131.green_2019_01
  WHERE
    PULocationID = 7 AND
    tip_amount = 88.0 ;

SELECT
    Zone
  FROM
    `dtc-de-nyctaxi-20230131`.dtc_de_nyctaxi_dataset_20230131.zone_lookup
  WHERE
    LocationID = 146 ;