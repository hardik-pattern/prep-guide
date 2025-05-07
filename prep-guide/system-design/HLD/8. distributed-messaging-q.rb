
# Q. What is messaging Queue? why it is needed?
# Q. What is point to point and pub-sub messaging?
# Q. How messaging queue works? ==> Kafka & RabbitMQ
# Q. What happens when queue size exceeds?
# Q. What happens to message if, when queue goes down?
# Q. What happens when consumer not able to process message?
# Q. How retry works different ways to retry message?
# Q. How distributed messaging works?
# Q. What is dead letter queue?

# !Q. what is messaging queue?
# >> messaging queue is the mechanism to send and receive messages between different components of a system.
#   Here is the example:

    # Producer(creates messages) --------------> Message Queue --------------> Consumer(listens to the queue)

# !Q. why we need messaging queue?
# >> We use messaging queue to bring the async behavior in our system. this helps to reduce latency
# >> it brings retry capability in our system
# >> pace matching between producer and consumer

# !Q. what is point to point and pub-sub messaging?
# >> in point to point messaging, there is one producer and one consumer.
            # producer -----(publish message)------>  Queue -------------------> consumer

# >> in pub-sub messaging, there is one producer and multiple consumers.
            # producer -----(publish message)------>  Queue -------------------> consumer1, consumer2, consumer3
            #* producer uses exchange logic to publish the message

# !Q. how messaging queue works?
# >>Kafka
# here are the components of kafka:
  # 1. Producer: Producer is the component that produces the message and sends it to the kafka cluster.
  # 2. Consumer: Consumer is the component that consumes the message from the kafka cluster.
  # 3. Consumer Group: Consumer Group is the group of consumers that consume the message from the same topic.
  # 4. Topic: Topic is the name of the message queue.
  # 5. Partition: Partition is the part of the topic. (it is the queue in kafka)
  # 6. Offset: Offset is the position of the message in the partition. (you can call it the node of the queue)
  # 7. Broker: Broker is the kafka server. (the name of the kafka server is called as broker)
  # 8. Cluster: Cluster is the group of brokers that stores the message in the kafka cluster.
  # 9. Zookeeper: Zookeeper is the component that stores the metadata of the kafka cluster.

# lets see the working of each components (kafka)


#                                            *Broker*                                                                  *Consumer Group - 1*
#                                      has multiple topics                                                         has multiple consumers
#                                           - topic 1                                                                      - consumer 1
#                                               topic has multiple partitions                                              - consumer 2 (access to partition 1)
#                                               - partition 1 -> partition is the queue                                    - consumer 3 (access to partition 2)
#                                               - partition 2 -> |1|2|3|4|5|6|7|8|9|10| -> offset 10
# producer --------------->                     - partition 3                                                          *Consumer Group - 2*
#                                           - topic 2                                                                      - consumer 1 (access to partition 1)
#                                               - partition 1
#                                               - partition 2
#                                               - partition 3
#                                           - topic 3...


# ** note: consumer is same group cannot access the same partition. eg: consumer 1 from topic 1 can access partition 1
#                                                                       consumer 2 from topic 1 cannot access partition 1
#                                                                       consumer 1 from topic 1 can access partition 1 etc




# consider the scenario on broader perspective now


#                                     (we call this as the cluster)
#  producer --------------->  *Broker 1* (running on machine 1)
#           --------------->  *Broker 2* (running on machine 2)                   {zookeeper} maintains the metadata and communication between the brokers of different clusters
#           --------------->  *Broker 3* (running on machine 3)


# lets go deep into the kafka now:
    Q. what is message? -> message is the data that is sent from the producer to the consumer.
        #  what messages has: (* means mandatory)
            # - key: key is the identifier of the message. (based on the key, it computes the hash of it and identifies where it has to put the message)
            # - value(*): value is the data of the message.
            # - partition (if key is not provided, it will put the message in the random partition): this is just the queue which belongs to the topic.
            # - topic(*): topic is the name of the message queue.
            # - offset: offset is the position of the message in the partition.
# if both key and partition is provided, then the message will choose the partition based on round robin.




cluster has multiple brokers, each broker can have different server.

# so if one of the broker goes down then the traffic will be redirected to other broker. so we save the replica of one topic to another broker.
# the primary partition is known as leader and the other partition is known as follower.
# whenever leader goes down the replica will promote to leader.
# zookeeper tracks the leader and follower along with the offset and metadata of the message.

# !Q what if the message size is reached?
# >> for that we have multiple replicas of the same topic. so zookeeper will redirect the traffic to another other broker.

# !Q what if the consumer goes down?
# >> for this we have replica of the consumer in group so another consumer will take over the consumer role.

# !Q what if the consumer unable to process the message?
# >> for this we have retry mechanism. so for each topic we have retry count. if the retry count is reached then the message will be moved to dead letter queue.

# kafka is pull based system. and rabbitmq is push based system.
# in kafka consumer will pull the message from the queue. and in rabbitmq producer will push the message to the queue.

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

# Working of RabbitMQ:
    Here there are components of rabbitmq:
        - Producer: Producer is the component that produces the message and sends it to the rabbitmq cluster.
        - Consumer: Consumer is the component that consumes the message from the rabbitmq cluster.
        - Queue: Queue is the name of the message queue.
        - Exchange: Exchange is the component that routes the message to the queue.

# lets see the working of each components (rabbitmq)

                  #  Producer -------------> Exchange 1 -------------> Queue -------------> Consumer
                  #           -------------> Exchange 2
                  #           -------------> Exchange 3
                  #           -------------> Exchange 4

        # Here exchange is the component that routes the message to the queue. based on the hash value
        # there are different types of exchange:
            # 1. direct exchange: it routes the message to the specific queue based on the hash value.
            # 2. topic exchange: it routes the message to the queue based on the wild card characters eg: messaging-*.
            # 3. fanout exchange: it routes the message to all the queues.








