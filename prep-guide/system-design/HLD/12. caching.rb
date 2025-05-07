# What is caching?
  # 1. Caching is a technique used to store frequently accessed data in a temporary storage area (cache) to improve performance and reduce latency.
  # 2. By storing copies of data that are expensive to fetch or compute, caching allows applications to retrieve that data more quickly when needed, rather than having to recompute or fetch it from a slower source (like a database or an external API).

                #                                      caching
                #                                        |
                #    +-----------------------------------+-----------------------------------+
                #    |                                                                       |
                # server side caching                                                  distributed caching

# Here is the representation of server side caching flow:
   client -----> load balancer -----> application server -----> cache (redis) -----> database


# Here is the representation of distributed caching flow:
  # Each server has the cache client and cache client takes the redis server from the redis server pool
  # Here we have the redis server pool and cache client.

      #                                                    -----> redis server
      #  client has(cache client) -----> cache server pool -----> redis server
      #                                                    -----> redis server
  # Here it uses consistent hashing to distribute the cache server pool. (cache server are arranged in a circle and the cache client is placed in the circle)

# ------------------------------------------------------------------------------------------------
# Caching strategies
  # 1. Cache-aside (Lazy Loading): application first check the cache for the data, if not found, it fetches it from the database and stores it in the cache for future requests.
                                   (if found)
             client ------> server -------> cache              database
                                   <-------

                                   (if not found) (please note that *application* takes the responsibility to fetch the data from database)
             client ------> server -------> cache    ------->   database
                                   <-------  (store) <-------

  # pros:
  #     1. it is efficient for read heavy operations.
  #     2. simple to implement
  #     3. even cache server is down, the application will still work.
  # cons:
  #     1. there will be always cache miss for the time (we can overcome this by using write through caching)
  #     2. if not handled properly during write operation, cache will be inconsistent.

  # 2. Read-through caching: Application reads data from the cache, if not found, it (cache) fetches it from the database and stores it in the cache. (Here cache takes the responsibility to store and fetch the data)

                                   (if found)
             client ------> server -------> cache              database
                                   <-------

                                   (if not found) (please note that *cache* takes the responsibility to fetch the data from database)
             client ------> server -------> cache    ------->   database
                                   <-------  (store) <-------

  # 3. Write-around caching: Application writes data to the database and mark the cache as invalidate. Read operation will fetch the data from the cache

  # 4. Write-through caching: Application writes data to the cache and database simultaneously. This ensures that the cache is always up-to-date with the latest data.

  # 5. Write back(or behind) caching: First write the data in cache and then write it to the database asynchronously. This can improve performance but can lead to data loss if the cache fails before the data is written to the database.
