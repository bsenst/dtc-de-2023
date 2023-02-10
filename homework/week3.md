# Week 3 Homework
https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_3_data_warehouse/homework.md

## Question 1:
What is the count for fhv vehicle records for year 2019?

	SELECT
	 COUNT(*) AS record_count
	FROM `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.fhv_2019` 

	[{
	  "record_count": "43244696"
	}]

## Question 2:
Write a query to count the distinct number of affiliated_base_number for the entire dataset on both the tables.
What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

	SELECT
	 COUNT(DISTINCT Affiliated_base_number) AS distinct_aff_base_nr
	FROM `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.fhv_2019` 

	[{
	  "distinct_aff_base_nr": "3163"
	}]

	0 MB for the External Table and 317.94MB for the BQ Table

## Question 3:
How many records have both a blank (null) PUlocationID and DOlocationID in the entire dataset?

	dispatching_base_num	STRING	NULLABLE			
	pickup_datetime	TIMESTAMP	NULLABLE			
	dropOff_datetime	TIMESTAMP	NULLABLE			
	PUlocationID	FLOAT	NULLABLE			
	DOlocationID	FLOAT	NULLABLE			
	SR_Flag	STRING	NULLABLE			
	Affiliated_base_number	STRING	NULLABLE		

	SELECT COUNT(1)
	FROM `dtc-de-nyctaxi-20230131.dtc_de_nyctaxi_dataset_20230131.fhv_2019`
	WHERE PUlocationID IS NULL and DOlocationID IS NULL
	
	717,748

## Question 4:
What is the best strategy to optimize the table if query always filter by pickup_datetime and order by affiliated_base_number?
	
	... 

## Question 5:

	...

## Question 6:
Where is the data stored in the External Table you created?

	GCP Bucket

## Question 7:
It is best practice in Big Query to always cluster your data:

	It is best practice in Big Query to always cluster your data.

## (Not required) Question 8:
A better format to store these files may be parquet. Create a data pipeline to download the gzip files and convert them into parquet. Upload the files to your GCP Bucket and create an External and BQ Table.

	...