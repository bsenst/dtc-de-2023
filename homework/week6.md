# Week 6 Homework - Streaming

## Question 1
* Kafka Nodes & Kafka Topics https://medium.com/@abhisheksharma_59226/how-kafka-stores-data-37ee611c89a2
* Zookeeper https://redpanda.com/guides/kafka-tutorial/kafka-without-zookeeper
* Retention configuration https://medium.com/@sunny_81705/kafka-log-retention-and-cleanup-policies-c8d9cb7e09f8
* Group-Id https://www.confluent.io/blog/configuring-apache-kafka-consumer-group-ids

## Question 2 - Reliability & Availability
* Topic Replication
* Topic Partitioning
* Consumer Group Id
* Ack All

## Question 3 - Scaling
* Topic Partitioning https://medium.com/event-driven-utopia/understanding-kafka-topic-partitions-ae40f80552e8
* Consumer Group Id

## Question 4 - Partitioning key
* payment_type
* vendor_id
* passenger_count
* total_amount
* tpep_pickup_datetime
* tpep_dropoff_datetime

## Question 5 - Configuration: Kafka Consumer vs Kafka Producer
* Deserializer Configuration
* Topics Subscription
* Bootstrap Server
* Group-Id
* Offset
* Cluster Key and Cluster-Secret

## Exercise
*Please implement a streaming application, for finding out popularity of PUlocationID across green and fhv trip datasets. Please use the datasets https://github.com/DataTalksClub/nyc-tlc-data/releases/tag/fhv and https://github.com/DataTalksClub/nyc-tlc-data/releases/tag/green*

https://docs.confluent.io/confluent-cli/current/overview.html#getting-started

`$ curl -sL --http1.1 https://cnfl.io/cli | sh -s -- latest`

`$ confluent update`

`...`

