select 
    cast(dispatching_base_num as string) as dispatching_base_num,
    cast(Affiliated_base_number as string) as Affiliated_base_number,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropOff_datetime,
    -- cast(PUlocationID as string) as PUlocationID,
    -- cast(DOlocationID as string) as DOlocationID,
    cast(SR_Flag as string) as SR_Flag,
from {{ source('dtc_de_nyctaxi_dataset_20230131', 'external_fhv_tripdata') }}