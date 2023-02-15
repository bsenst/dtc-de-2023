# https://cloud.google.com/bigquery/docs/loading-data-cloud-storage-csv#python

from google.cloud import storage

@flow
def flow_taxi_to_bq():
    # df = extract("https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-01.csv.gz")
    # df_transformed = transform(df)
    # load(df_transformed)
    print("empty")
 
flow_taxi_to_bq()