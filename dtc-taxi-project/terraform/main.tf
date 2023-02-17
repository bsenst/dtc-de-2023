resource "google_storage_bucket" "dtc_de_nyctaxi_bucket_20230131" {
  name                     = "dtc-de-nyctaxi-bucket-20230131"
  project                  = "dtc-de-nyctaxi-20230131"
  location                 = "US"
  storage_class            = "STANDARD"
  force_destroy            = false
}

resource "google_bigquery_dataset" "dtc_de_nyctaxi_dataset_20230131" {
  dataset_id                 = "dtc_de_nyctaxi_dataset_20230131"
  project                    = "dtc-de-nyctaxi-20230131"
  location                   = "US"
}