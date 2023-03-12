# FHIR Synthea Project
This project is a contribution to the [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) offered by the [DataTalksClub Community](https://datatalks.club). 

### Problem statement
Health data is vast, diverse and complex. Even though extracting knowledge from health data promises advantages for healthcare service provision and medical advancement, barriers exist to implement the necessary technologies. This project explores Synthea synthetic patient data. According to the DIKW pyramide data is refined to information and knowledge. The patient cohort shall be grouped by the presence of obesity. The information of obesity is diagnosed by the body mass index (BMI) and needs to be calculated from body weight and body height data. Finally correlating obesity to concomittant diseases gives us further knowledge on the problem of the metabolic syndrome.

### Background information

FHIR is the Fast Healthcare Interoperability Standard maintained by HL7. It is a syntactic standard to exchange healthcare information between systems.

SyntheaTM is an open-source, synthetic patient generator that models the medical history of synthetic patients. 

Jason Walonoski, Mark Kramer, Joseph Nichols, Andre Quina, Chris Moesel, Dylan Hall, Carlton Duffett, Kudakwashe Dube, Thomas Gallagher, Scott McLachlan, Synthea: An approach, method, and software mechanism for generating synthetic patients and the synthetic electronic health care record, Journal of the American Medical Informatics Association, Volume 25, Issue 3, March 2018, Pages 230–238, https://doi.org/10.1093/jamia/ocx079

Lee, C. H., & Yoon, H. J. (2017). Medical big data: promise and challenges. Kidney research and clinical practice, 36(1), 3–11. https://doi.org/10.23876/j.krcp.2017.36.1.3

Ristevski, B., & Chen, M. (2018). Big Data Analytics in Medicine and Healthcare. Journal of integrative bioinformatics, 15(3), 20170030. https://doi.org/10.1515/jib-2017-0030

Peek, N., Holmes, J. H., & Sun, J. (2014). Technical challenges for big data in biomedicine and health: data sources, infrastructure, and analytics. Yearbook of medical informatics, 9(1), 42–47. https://doi.org/10.15265/IY-2014-0018

## Project Implementation with Google Cloud

![fhir-synthea-data-pipeline](https://user-images.githubusercontent.com/8211411/224420140-7135a727-bbaf-4560-a9a1-2b91ab6c3672.jpg)

### Cloud resources
* Terraform

[Create google cloud resources using terraform](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/terraform/terraform.tf)

### Batch data ingestion
* prefect 

[Data ingestion script source to Bucket with prefect](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/prefect/web_to_gcs.py)

[Data ingestion script Bucket to Warehouse](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/prefect/web_to_gcs.py)

### Data warehouse
* BigQuery
* Referred table
* Partition & Clusters

[Load patient data to BigQuery Data Warehouse using SQL](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/bigquery/patients.sql)

### Transformations
* dbt

[dbt transformation workflow](https://github.com/bsenst/dtc-de-2023/blob/main/fhir-synthea-project/dbt)

### Dashboard
* Looker

[Explore Patient Report](https://lookerstudio.google.com/reporting/a22f12ec-7b4c-4ec5-bfdb-41be63140b39)

![image](https://user-images.githubusercontent.com/8211411/223867127-2a8bcb6e-ca2f-45eb-9bc2-2e38d0f57638.png)

## Reproducibility

Go to https://shell.cloud.google.com/

  `cloudshell:~$ gcloud projects create fhir-project-20230308`
  
  `cloudshell:~$ gcloud config set project fhir-project-20230308`

Set the billing account https://console.cloud.google.com/billing/projects

  `cloudshell:~ (fhir-project-20230308)$ git clone https://github.com/bsenst/dtc-de-2023`
  
  `cloudshell:~ (fhir-project-20230308)$ terraform init dtc-de-2023/fhir-synthea-project/terraform`
  
  `Terraform has been successfully initialized!`
  
  `cloudshell:~ (fhir-project-20230308)$ terraform apply dtc-de-2023/fhir-synthea-project/terraform`
  
  `Apply complete! Resources: 1 added, 0 changed, 0 destroyed.`

Set up connection to https://app.prefect.cloud/

  `cloudshell:~ (fhir-project-20230308)$ prefect cloud login`
  
  `cloudshell:~ (fhir-project-20230308)$ python3 fhir/web_to_gcs.py`
  
  `cloudshell:~ (fhir-project-20230308)$ python3 fhir/gcs_to_bq.py`

Set up https://cloud.getdbt.com/

  `...`

Visualize the data using https://lookerstudio.google.com/

## Extra mile
- [ ] Tests
- [ ] Using make
- [ ] CI/CD pipeline
