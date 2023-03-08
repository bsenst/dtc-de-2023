import os
import pandas as pd
from prefect import flow, task
from prefect.tasks import task_input_hash
from google.cloud import storage
from urllib.request import urlopen
from zipfile import ZipFile

@task(log_prints=True)
def load_zip(url):
    # https://svaderia.github.io/articles/downloading-and-unzipping-a-zipfile/
    # Download the file from the URL
    zipresp = urlopen(url)
    # Create a new file on the hard drive
    tempzip = open("/tmp/tempfile.zip", "wb")
    # Write the contents of the downloaded file into the new file
    tempzip.write(zipresp.read())
    # Close the newly-created file
    tempzip.close()
    # Re-open the newly-created file with ZipFile()
    zf = ZipFile("/tmp/tempfile.zip")
    # Extract its contents into <extraction_path>
    # note that extractall will automatically create the path
    zf.extractall(path = '.')
    # close the ZipFile instance
    zf.close()
    
    return os.listdir("csv")

@task(log_prints=True)
def extract(url):
    df = pd.read_csv(url)
    return df

@task(log_prints=True)
def transform(df):
    return df

@task
def load(df, file):
    storage_client = storage.Client()
    bucket_name = "fhir-bucket-20230308"

    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(file)
    
    blob.upload_from_string(df.to_csv(), 'text/csv')

@flow
def flow_web_to_gcs():
    files = load_zip("https://synthetichealth.github.io/synthea-sample-data/downloads/synthea_sample_data_csv_apr2020.zip")
    for file in files:
        print(file)
        df = extract("csv/"+file)
        df_transformed = transform(df)
        load(df_transformed, file)

flow_web_to_gcs()
