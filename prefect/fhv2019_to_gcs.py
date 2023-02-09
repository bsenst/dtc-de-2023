# https://stackoverflow.com/questions/73663848/gzip-a-file-in-python-before-uploading-to-cloud-storage

import io
import gzip
import pandas as pd
from prefect import flow, task
from prefect.tasks import task_input_hash
from google.cloud import storage
from google.cloud.storage import fileio 

fhv_2019_files = [
	"fhv_tripdata_2019-01.csv.gz",
	"fhv_tripdata_2019-02.csv.gz",
	"fhv_tripdata_2019-03.csv.gz",
	"fhv_tripdata_2019-04.csv.gz",
	"fhv_tripdata_2019-05.csv.gz",
	"fhv_tripdata_2019-06.csv.gz",
	"fhv_tripdata_2019-07.csv.gz",
	"fhv_tripdata_2019-08.csv.gz",
	"fhv_tripdata_2019-09.csv.gz",
	"fhv_tripdata_2019-10.csv.gz",
	"fhv_tripdata_2019-11.csv.gz",
	"fhv_tripdata_2019-12.csv.gz",
]

root = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/"

@task(log_prints=True)
def load(file):
    storage_client = storage.Client()
    bucket_name = "dtc-de-nyctaxi-bucket-20230131"

    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(file)
    
    # Set blog meta data for decompressive transcoding
    blob.content_encoding = 'gzip'
    blob.content_type = 'application/csv'
    
    df = pd.read_csv(root+file)
    print(len(df))

    with io.StringIO() as buf:
        df.to_csv(buf, index=False)
        blob.upload_from_string(gzip.compress(bytes(buf.getvalue(), 'utf-8')), "application/csv")

@flow
def flow_taxi_to_gcs():
    for file in fhv_2019_files:
        load(file)
    print(record_count)

flow_taxi_to_gcs()
