select
	*
from {{ source('dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131', 'external_fhv_tripdata') }}
limit 10