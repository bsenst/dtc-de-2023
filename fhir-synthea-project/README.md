# FHIR Synthea Project

## Problem statement
* About FHIR
* About Synthea - work with health data and avoid privacy issues with synthetic data
* About Healthcare data: identify polypharmacy among medication, diagnosing obesity from BMI, ...

[include image showing overview of pipeline]()

## Google cloud implementation
* Terraform

[Create google cloud resources using terraform](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/terraform/terraform.tf)

## Batch data ingestion
* prefect 

[Data ingestion script source to Bucket with prefect](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/prefect/web_to_gcs.py)

[Data ingestion script Bucket to Warehouse with prefect](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/prefect/web_to_gcs.py)

## Data warehouse
* BigQuery
* Referred table
* Partition & Clusters

[Load patient data to BigQuery Data Warehouse](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/bigquery/patients.sql)

## Transformations
* dbt

[dbt transformation workflow](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/dbt)

## Dashboard
* Looker

[Explore Patient Report](https://lookerstudio.google.com/reporting/a22f12ec-7b4c-4ec5-bfdb-41be63140b39)

![image](https://user-images.githubusercontent.com/8211411/223867127-2a8bcb6e-ca2f-45eb-9bc2-2e38d0f57638.png)

## Reproducibility
* Clone the repo using the cloud shell.
* Run terraform.
* Run prefect.
* Run dbt.
* Create Looker dashboard.

## Extra mile
* Tests
* Using make
* CI/CD pipeline
