https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_2_workflow_orchestration/homework.md

# Question 1. Load January 2020 data

How many rows does that dataset have?

	In [10]: df.shape
	Out[10]: (447770, 20)

# Question 2. Scheduling with Cron

create a deployment to run on the first of every month at 5am UTC

https://docs-v1.prefect.io/core/concepts/schedules.html#cron-clocks

	0 0 5 1 *

# Question 3. Loading data to BigQuery

Make sure you have the parquet data files for Yellow taxi data for Feb. 2019 and March 2019 loaded in GCS. Run your deployment to append this data to your BiqQuery table. How many rows did your flow code process?

	14,851,920

	In [7]: feb.shape
	Out[7]: (7019375, 19)
	In [9]: mar.shape
	Out[9]: (7832545, 19)

# Question 4. Github Storage Block

Run your deployment in a local subprocess (the default if you don’t specify an infrastructure). Use the Green taxi data for the month of November 2020.

How many rows were processed by the script?

	88,605

	In [13]: nov.shape
	Out[13]: (88605, 20)

# Question 5. Email or Slack notifications

Run the deployment used in Q4 for the Green taxi data for April 2019. Check your email to see the notification.

How many rows were processed by the script?


	514,392

	In [15]: apr.shape
	Out[15]: (514392, 20)

# Question 6. Secrets

Prefect Secret blocks provide secure, encrypted storage in the database and obfuscation in the UI. Create a secret block in the UI that stores a fake 10-digit password to connect to a third-party service. Once you’ve created your block in the UI, how many characters are shown as asterisks (*) on the next page of the UI?

	8

	Aws Secret Access Key
	********