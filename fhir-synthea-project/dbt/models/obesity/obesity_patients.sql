{{ config(materialized='view') }}

select *
from {{ source('synthea','patients') }}
limit 5