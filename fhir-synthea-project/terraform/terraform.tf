resource "google_storage_bucket" "fhir_bucket_20230308" {
  force_destroy = false
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age        = 30
      with_state = "ANY"
    }
  }
  location                    = "US-CENTRAL1"
  name                        = "fhir-bucket-20230308"
  project                     = "fhir-project-20230308"
  public_access_prevention    = "inherited"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "fhir_bq_dataset_20230803"
  project = "fhir-project-20230308"
  location = "US-CENTRAL1"
}
