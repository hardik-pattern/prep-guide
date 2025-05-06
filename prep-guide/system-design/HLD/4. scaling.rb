
# How to scale the system from single user to millions of users?
    # 1. single server
    # 2. application and database separation
    # 3. load balancer + multiple application servers + database
    # 4. database replication
    # 5. cache
    # 6. CDN
    # 7. Data Center
    # 8. Message Queue
    # 9. Database scaling

1. single server: In this case the application and database are running on the same server.
  this is ideal for small scale applications with low traffic.

    # client
    #   |
    #   v
    # server + database (same server)

2. application and database separation: In this case the application and database are running on different servers.
  this is ideal for medium scale applications with moderate traffic.

    # client
    #   |
    #   v
    # server ------> database (separate server)


3. load balancer + multiple application servers + database: In this case the application and database are running on different servers.
  this is ideal for large scale applications with high traffic.

#                client
#                  |
#                  v
#             load balancer
#     |--------|-----------|--------------|
#     v        v           v              v
# server 1   server 2    server 3    server 4
#     |        |           |              |
#     v        v           v              v
#                database

4. database replication: In this case the database is replicated on multiple servers.
  this is ideal for large scale applications with high traffic.

#                client
#                  |
#                  v
#             load balancer
#     |--------|-----------|--------------|
#     v        v           v              v
# server 1   server 2    server 3    server 4
#     |        |           |              |
#     v        v           v              v
# database (master) (supports read and update operations) -----------> database (slave) (supports only read operations)

5. cache: In this case the data is cached in the cache server. we use cache like redis to store the data.

#                client
#                  |
#                  v
#             load balancer
#     |--------|-----------|--------------|
#     v        v           v              v
# server 1   server 2    server 3    server 4        -----> cache (redis)
#     |        |           |              |
#     v        v           v              v
# database (master) (supports read and update operations) -----------> database (slave) (supports only read operations)

6. CDN: In this case the content is cached in the CDN server. we use CDN like cloudflare to store the content.
    # we store the static content like images, videos, css, js, etc. in the CDN server.
    # when the data not found in the CDN server, the data fetched from nearest CDN server. If not found in the nearest CDN server, then the data fetched from the database.
    # CDN also saves us from DDoS attack.

7. Data Center: In this case the data is stored in the data center according to the region. we use data center like AWS to store the data.
    # we store the static content like images, videos, css, js, etc. in the CDN server.
    # when the data not found in the CDN server, the data fetched from nearest CDN server. If not found in the nearest CDN server, then the data fetched from the database.

                                                          #   client
                                                          #     |
                                                          #     v
                                                          # load balancer
                                                          #     |
                                                          #     v
                #  (data center India)                                                                         (data center USA)
#     |--------|-----------|--------------|                                                   #     |--------|-----------|--------------|
#     v        v           v              v                                                   #     v        v           v              v
# server 1   server 2    server 3    server 4                                                 # server 1   server 2    server 3    server 4
#     |        |           |              |                                                   #     |        |           |              |
#     v        v           v              v                                                   #     v        v           v              v
# database (master) (supports read and update operations)                                     # database (master) (supports read and update operations)


8. Message Queue: In this case the message is stored in the message queue. we use message queue like rabbitmq to store the message.
    # we store the message in the message queue.
    # when the message not found in the message queue, the message fetched from the database.

        # Working of messaging queue:
        # 1. Producer: Producer is the one who produces the message.
        # 2. Consumer: Consumer is the one who consumes the message.
        # 3. Queue: Queue is the one who stores the message.
        # 4. Message: Message is the one who is stored in the queue.

        # Binding (message to specific queue): Here the application sends the message to the message queue. along with the binding key. If the binding key matches the message, then the message is stored in the queue.
        # FANOUT (message to all queues): Here the application sends the message to all the queues.
        # TOPIC (message to multiple queues): Here the application sends the message to the message queue. along with the topic name. If the topic name matches the message, then the message is stored in the queue.


9. Database scaling: In this case the database is scaled horizontally. we use database like mysql to store the data.
    # Horizontal scaling: In this case the database is scaled horizontally. we use database like mysql to store the data.
        # 1. Sharding: In this case the database is sharded. we use database like mysql to store the data.

        # Horizontal sharding: (sharding by rows)
        #             Table 1 contains 1 to 1000 rows
        # Table 2 {contains 1 to 100}           Table 2 {contains 100 to 200}  ...

        # Vertical sharding: (sharding by columns)
        #             Table 1 contains 1 to 50 columns
        # Table 2 {contains 1 to 25 columns}           Table 2 {contains 26 to 50 columns}

    # Vertical scaling: In this case the database is scaled vertically. we use more powerful server to store the data.
