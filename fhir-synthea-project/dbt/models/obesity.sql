
with obesity as (

    SELECT Patient, CAST(Value as FLOAT64) as BMI, Date 
    FROM fhir_bq_dataset_20230803.observations 
    WHERE Description = "Body Mass Index"
    LIMIT 300
    
)

select * from obesity