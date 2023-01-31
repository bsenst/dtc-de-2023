# question-1-knowing-docker-tags

https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_1_docker_sql/homework.md#question-1-knowing-docker-tags

	docker build --help
	--iidfile string	Write the image ID to the file

# question-2-understanding-docker-first-run

https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_1_docker_sql/homework.md#question-2-understanding-docker-first-run

https://stackoverflow.com/questions/25101596/docker-interactive-mode-and-executing-script

	benjamin_senst@cloudshell:~$ docker images
	REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
	python       3.9       8f1c967991c4   6 days ago   915MB
	python       latest    afe5735f16e1   6 days ago   932MB
	benjamin_senst@cloudshell:~$ docker run python
	benjamin_senst@cloudshell:~$ ls
	README-cloudshell.txt
	benjamin_senst@cloudshell:~$ docker exec -it python:3.9 bash
	Error: No such container: python:3.9
	benjamin_senst@cloudshell:~$ docker ps
	CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
	benjamin_senst@cloudshell:~$ docker create -it --name python-container python:3.9
	fe9d901e9464b84aa15e8b1ff478503428337f3f3cdd7d692cbf64aa3788f340
	benjamin_senst@cloudshell:~$ docker start python-container
	python-container
	benjamin_senst@cloudshell:~$ docker exec -it python-container bash
	root@fe9d901e9464:/# pip list
	Package    Version
	---------- -------
	pip        22.0.4
	setuptools 58.1.0
	wheel      0.38.4
	WARNING: You are using pip version 22.0.4; however, version 22.3.1 is available.
	You should consider upgrading via the '/usr/local/bin/python -m pip install --upgrade pip' command.

# question-3-count-records

https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_1_docker_sql/homework.md#question-3-count-records

	taxi_df[(taxi_df.lpep_pickup_datetime.between("2019-1-15 00:00:00", "2019-1-15 23:59:59")) & (taxi_df.lpep_dropoff_datetime.between("2019-1-15 00:00:00", "2019-1-15 23:59:59"))]
	20530

# question-4-largest-trip-for-each-day

https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_1_docker_sql/homework.md#question-4-largest-trip-for-each-day

	grouped = taxi_df.groupby(by="date_pickup").trip_distance.max()
	grouped.sort_values()
	2019-01-15    117.99
	Name: trip_distance, dtype: float64

# question-5-the-number-of-passengers

https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_1_docker_sql/homework.md#question-5-the-number-of-passengers

	print(len(taxi_df[(taxi_df.passenger_count==2) & (taxi_df.lpep_pickup_datetime.between("2019-1-1 00:00:00", "2019-1-1 23:59:59"))]))
	print(len(taxi_df[(taxi_df.passenger_count==3) & (taxi_df.lpep_pickup_datetime.between("2019-1-1 00:00:00", "2019-1-1 23:59:59"))]))
	1282
	254

# question-6-largest-tip

https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2023/week_1_docker_sql/homework.md#question-6-largest-tip

	zone_df[zone_df.LocationID==taxi_df[taxi_df.PULocationID==int(zone_df[zone_df.Zone=="Astoria"].LocationID)].groupby(by="DOLocationID").tip_amount.max().sort_values().index[-1]].Zone
	145    Long Island City/Queens Plaza

	