LOAD DATA OVERWRITE fhir_bq_dataset_20230803.patients
FROM FILES (
  format = 'CSV',
  uris = ['gs://fhir-bucket-20230308/patients.csv']);

SELECT * FROM  `fhir_bq_dataset_20230803.patients` LIMIT 10;
