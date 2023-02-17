-- SELECT
--  COUNT(*) AS record_count
-- from {{ source('dtc_de_nyctaxi_dataset_20230131', 'external_fhv_tripdata') }}

select 
    -- cast(PUlocationID as integer) as PUlocationID,
    -- cast(PUlocationID as integer) as PUlocationID,
    -- cast(PUlocationID as integer) as PUlocationID,
    -- cast(PUlocationID as integer) as PUlocationID,
    cast(DOlocationID as integer) as DOlocationID,
    cast(PUlocationID as integer) as PUlocationID,
    -- cast(Affiliated_base_number as integer) as Affiliated_base_number,
from {{ source('dtc_de_nyctaxi_dataset_20230131', 'external_fhv_tripdata') }}
limit 5