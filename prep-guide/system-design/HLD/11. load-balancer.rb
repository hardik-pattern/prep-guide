# design a load balancer and different algorithms to do the load balancing

#                                    load balancer
#                                          |
#            +-----------------------------+-----------------------------+
#            |                                                           |
#        Network Load Balancer                                       Application Load Balancer (works on application layer)
# it can only access port, protocol, ip                             #  (it has more features like SSL termination, compression, caching, etc.)
# (it is fast but with limited features)                            #  but it is slower than network load balancer.
#             |
# +-----------+------------+
# |           |            |
# Static algo           Dynamic algo
# - Round Robin                 - Least Connections
# - Weighted Round Robin        - Weighted Least Connections
# - IP Hash                     - Least Response Time


# Static Load Balancing:

# Round Robin:
          server 1 -> packet 1, packet 3, packet 5
          server 2 -> packet 2, packet 4, packet 6

    # advantages:
        # - simple to implement
        # - fair distribution of load
    # disadvantages:
        # - not fair to the servers with different capacities

# Weighted Round Robin:
          server 1 (capacity 3) -> packet 1, packet 2, packet 3, packet 5, packet 6, packet 7
          server 2 (capacity 1) -> packet 4, packet 8

      # advantages:
        # - fair distribution of load
      # disadvantages:
        # - if request has different processing time then it is not fair to the server with less capacity

# IP Hash:
    # Here for each IP address load balancer calculate the hash value and based on that it will send the request to the server.

    client 1 ->                         hash value 1 -> server 1
    client 2 ->       load-balancer     hash value 2 -> server 2
    client 3 ->                         hash value 3 -> server 3

    # advantages:
      # - Here we implement this if we want to divert the traffic from particular client to particular server.
      # - easy to implement
    # disadvantages:
        # - if the client used proxy then for the proxy server hash value will be same so all the load could go to the same server.

# ------------------------------------------------------------------------------------------------

# Dynamic Load Balancing:

# Least Connections:
        # Load balancer check which server has least active connections and send the request to that server.
        # advantages:
            # - fair distribution of load
        # disadvantages:
            # - TCP connection can be active but it still could be possible it don't have any traffic. so others get more load.

# Weighted Least Connections:
        # Load balancer check which server has (least active connections / capacity) and send the request to that server.

# Least Response Time:
        # Load balancer check which server has (least response time) * (least active connections) and send the request to that server.
        # least response time = time from connection is established to the first byte is received.

        # advantages:
            # - fair distribution of load
        # disadvantages:
            # - it is not fair to the server with less capacity.
