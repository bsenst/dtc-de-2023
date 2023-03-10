from google.cloud import bigquery, storage

# https://cloud.google.com/storage/docs/samples/storage-list-files#storage_list_files-python
def list_blobs(bucket_name):
    """Lists all the blobs in the bucket."""
    # bucket_name = "your-bucket-name"

    storage_client = storage.Client()

    # Note: Client.list_blobs requires at least package version 1.17.0.
    blobs = storage_client.list_blobs(bucket_name)

    # Note: The call returns a response only when the iterator is consumed.
    # for blob in blobs:
    #     print(blob.name)
    return [blob.name for blob in blobs]

client = bigquery.Client()

bq_dataset = "fhir-project-20230308.fhir_bq_dataset_20230803"

job_config = bigquery.LoadJobConfig(
    autodetect=True,
    skip_leading_rows=1,
    source_format=bigquery.SourceFormat.CSV,
)

bucket = "fhir-bucket-20230308"

for csv in list_blobs(bucket):
    uri = "gs://"+bucket+"/"+csv
    table_id = bq_dataset+"."+csv[:-4]

    load_job = client.load_table_from_uri(
        uri, table_id, job_config=job_config
    )

    load_job.result()

    destination_table = client.get_table(table_id)
    print("Loaded {} with {} rows.".format(csv, destination_table.num_rows))
