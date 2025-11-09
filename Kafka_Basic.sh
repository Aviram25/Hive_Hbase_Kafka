 # Start Zookeeper (required by Kafka)
zookeeper-server-start.sh config/zookeeper.properties

# Start Kafka broker
kafka-server-start.sh config/server.properties

# Stop Kafka broker
kafka-server-stop.sh

# Stop Zookeeper
zookeeper-server-stop.sh
| Purpose          | Command                                                                                                           |
| ---------------- | ------------------------------------------------------------------------------------------------------------------|
| Create a topic   | kafka-topics.sh --create --topic my-topic --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1 |
| List topics      | kafka-topics.sh --list --bootstrap-server localhost:9092                                                          |
| Describe a topic | kafka-topics.sh --describe --topic my-topic --bootstrap-server localhost:9092                                     |
| Delete a topic   | kafka-topics.sh --delete --topic my-topic --bootstrap-server localhost:9092                                       |


kafka-console-producer.sh --topic my-topic --bootstrap-server localhost:9092
# Consume messages from the beginning
kafka-console-consumer.sh --topic my-topic --from-beginning --bootstrap-server localhost:9092

# Consume messages as they come (live stream)
kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9092
| Purpose              | Command                                                                                |
| -------------------- | ---------------------------------------------------------------------------------------|
| List consumer groups | kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list                      |
| Describe a group     | kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-group |
| Delete a group       | kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group my-group   |


| File                         | Description                                         |
| ---------------------------- | -----------------------------------------------------|
| config/producer.properties | Configure producer (acks, retries, compression, etc.)  |
| config/consumer.properties | Configure consumer (group.id, auto.offset.reset, etc.) |


kafka-console-producer.sh --topic test --bootstrap-server localhost:9092 --producer.config config/producer.properties
# Reset offsets to the earliest
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group my-group --topic my-topic --reset-offsets --to-earliest --execute

# Reset offsets to latest
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group my-group --topic my-topic --reset-offsets --to-latest --execute


| Purpose          | Command                                                      |
| ---------------- | -------------------------------------------------------------|
| List brokers     | zookeeper-shell.sh localhost:2181 ls /brokers/ids            |
| Describe cluster | kafka-topics.sh --bootstrap-server localhost:9092 --describe |


| Concept          | Description                                              |
| -----------------| ---------------------------------------------------------|
| *Broker*         | A Kafka server that stores data and serves clients.      |
| *Topic*          | A category or feed name to which messages are published. |
| *Partition*      | A split of a topic for scalability and parallelism.      |
| *Offset*         | A unique ID for each message in a partition.             |
| *Producer*       | Sends messages to topics.                                |
| *Consumer*       | Reads messages from topics.                              |
| *Consumer Group* | A set of consumers sharing work on the same topic.       |


# 1️⃣ Start Zookeeper and Kafka broker
zookeeper-server-start.sh config/zookeeper.properties
kafka-server-start.sh config/server.properties

# 2️⃣ Create a topic
kafka-topics.sh --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

# 3️⃣ Start a producer
kafka-console-producer.sh --topic test-topic --bootstrap-server localhost:9092

# 4️⃣ Start a consumer
kafka-console-consumer.sh --topic test-topic --from-beginning --bootstrap-server localhost:9092
