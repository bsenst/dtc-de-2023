with patients as (

    select
        Id as patient_id,
        BIRTHDATE,
        RACE

    from `fhir-project-20230308.fhir_bq_dataset_20230803.patients`

)

select * from patients limit 5