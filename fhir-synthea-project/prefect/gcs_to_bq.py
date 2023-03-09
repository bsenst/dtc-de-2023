from google.cloud import bigquery

client = bigquery.Client()

table_id = "fhir-project-20230308.fhir_bq_dataset_20230803.allergies"

job_config = bigquery.LoadJobConfig(
    autodetect=True,
    skip_leading_rows=1,
    source_format=bigquery.SourceFormat.CSV,
)

uri = "gs://fhir-bucket-20230308/allergies.csv"

load_job = client.load_table_from_uri(
    uri, table_id, job_config=job_config
)

load_job.result()

destination_table = client.get_table(table_id)
print("Loaded {} rows.".format(destination_table.num_rows))
