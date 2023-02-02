# https://github.com/padilha/de-zoomcamp/blob/master/week2/etl_web_to_gcs.py
# https://cloud.google.com/appengine/docs/legacy/standard/python/googlecloudstorageclient/read-write-to-cloud-storage

import pandas as pd
from prefect import flow, task
from prefect.tasks import task_input_hash
from google.cloud import storage

@task(log_prints=True)
def extract(url):
    df = pd.read_csv(url)
    return df

@task(log_prints=True)
def transform(df):
    df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
    df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
    df = df[df['passenger_count'] != 0]
    return df

@task
def load(df):
    storage_client = storage.Client()
    bucket_name = "dtc-de-nyctaxi-bucket-20230131"

    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob("yellow_tripdata_2019-02.csv")
    
    blob.upload_from_string(df.to_csv(), 'text/csv')

schedule = IntervalSchedule(interval=timedelta(minutes=2))

@flow
def flow_taxi_to_gcs():
    df = extract("https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2019-02.csv.gz")
    df_transformed = transform(df)
    load(df_transformed)

flow_taxi_to_gcs()