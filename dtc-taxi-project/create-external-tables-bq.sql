CREATE OR REPLACE EXTERNAL TABLE `dtc_de_nyctaxi_dataset_20230131.external_yellow_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dtc-de-nyctaxi-bucket-20230131/yellow/yellow_tripdata_2019-*.parquet', 'gs://dtc-de-nyctaxi-bucket-20230131/yellow/yellow_tripdata_2020-*.parquet']
);

CREATE OR REPLACE EXTERNAL TABLE `dtc_de_nyctaxi_dataset_20230131.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dtc-de-nyctaxi-bucket-20230131/greeen/green_tripdata_2019-*.parquet', 'gs://dtc-de-nyctaxi-bucket-20230131/green/green_tripdata_2020-*.parquet']
);

CREATE OR REPLACE EXTERNAL TABLE `dtc_de_nyctaxi_dataset_20230131.external_fhv_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dtc-de-nyctaxi-bucket-20230131/fhv/fhv_tripdata_2019-*.parquet', 'gs://dtc-de-nyctaxi-bucket-20230131/fhv/fhv_tripdata_2020-*.parquet']
);

CREATE OR REPLACE TABLE `dtc_de_nyctaxi_dataset_20230131.yellow_tripdata_ml` (
  `passenger_count` INTEGER,
  `trip_distance` FLOAT64,
  `PULocationID` STRING,
  `DOLocationID` STRING,
  `payment_type` STRING,
  `fare_amount` FLOAT64,
  `tolls_amount` FLOAT64,
  `tip_amount` FLOAT64
) AS (
  SELECT passenger_count, trip_distance, CAST(PULocationID AS STRING), CAST(DOLocationID AS STRING), CAST(payment_type AS STRING), fare_amount, tolls_amount, tip_amount
  FROM `dtc_de_nyctaxi_dataset_20230131.external_yellow_tripdata`
  WHERE fare_amount != 0
);