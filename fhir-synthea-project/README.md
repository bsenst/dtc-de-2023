# FHIR Synthea Project

## Problem statement
* About FHIR
* About Synthea
* About Healthcare data: identify polypharmacy among medication, diagnosing obesity from BMI, ...

[include image showing overview of pipeline]()

## Google cloud implementation
* Terraform

## Batch data ingestion
* prefect 

[ingestion script]()

## Data warehouse
* BigQuery
* Referred table
* Partition & Clusters

[include bq sql with partitioning and clustering]()

## Transformations
* dbt

[include dbt repo]()

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
