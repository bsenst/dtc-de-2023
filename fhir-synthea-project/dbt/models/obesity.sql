
with obesity as (

    SELECT Patient, AVG(CAST(Value as FLOAT64)) as BMI
    FROM fhir_bq_dataset_20230803.observations 
    WHERE Description = "Body Mass Index"
    GROUP BY Patient
    
),

conditions as (

    SELECT Patient, COUNT(Patient) as Condition_Count
    FROM fhir_bq_dataset_20230803.conditions
    GROUP BY Patient

)

SELECT obesity.Patient, obesity.BMI, conditions.Condition_Count
FROM obesity
INNER JOIN conditions ON obesity.Patient = conditions.Patient