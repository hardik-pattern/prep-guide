# !Q. what is proxy server?
# !Q. What are different types of proxy servers?
  # !Q. What is forward proxy?
  # !Q. What is reverse proxy?
# !Q. Proxy vs VPN
# !Q. Proxy vs Load Balancer
# !Q. Proxy vs Firewall

# >>> What is a proxy?
  # Consider the analogy a child wants a chocolate. It asks his mom to buy it. And mom buys it from the store and gives it to the child.
  # Here child is the client, mom is the proxy server, and the store is the server.
  # proxy is a server which takes the request to server on behalf of client.

    #  client ------------>
    #  client ------------>
    #  client ------------>  proxy  ------------> server
    #  client ------------>
    #  client ------------>

# What are different types of proxy servers?
  #  1. forward proxy: It takes the request from the client and sends it to the internet then it reaches the server. (the above example is forward proxy)
                    #  It is hiding the client's identity from the server.
                    #  advantages:
                        # - It provides security to the client.
                        # - It can perform grouping of the requests.
                        # - We can bypass the regional restrictions. since forward proxy can be located in the different region.
                        # - It can cache the content and serve it to the client from the cache.
                    #  disadvantages:
                        # - It works on application layer of OSI model.
  # *Here is the diagram:
    #  client ------------>
    #  client ------------>
    #  client ------------>  forward proxy ------------> Internet  ------------> server
    #  client ------------>
    #  client ------------>


  #  2. reverse proxy: It takes the request from the internet sent by the client and sends it to the server.
                        # - It hides server identity from the client
                        # advantages:
                            # - It can protect the server from the DDoS attack.
                            # - CDN is the example of reverse proxy.
                            # - It can be set to the nearest client region. so resulting in reducing the latency.
                            # - It can act as a load balancer.
# *Here is the diagram:
    #  client ------------>
    #  client ------------>
    #  client ------------>  Internet  ------------> reverse proxy ------------> server
    #  client ------------>
    #  client ------------>

# !Q Proxy vs VPN
  # Proxy:
    # - It is a server that acts as an intermediary between a client and a server.
    # - It does not perform encryption of the data.
  # VPN: It creates a tunnel between the client and the server. When client sends the data to the server, it encrypts the data and sends it to the server.
        # At the other end, the server decrypts the data and sends it to the client.
    # - It is a network that connects two or more networks and allows the data to flow between them.

#!Q Reverse Proxy vs Load Balancer: Reverse proxy can be act as a load balancer but load balancer can not be act as a reverse proxy.
    # load balancer is use-less when we have single server. but we might need reverse proxy even we have single server.

#!Q Proxy vs Firewall:
    # Firewall is like a wall that protects the network from the outside world. It checks the incoming and outgoing *packets* based on the rules.
    # Proxy is like a gatekeeper that allows the traffic and it works on the application layer of the OSI model.
