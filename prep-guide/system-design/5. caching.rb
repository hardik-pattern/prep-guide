What is caching?
  1. Caching is a technique used to store frequently accessed data in a temporary storage area (cache) to improve performance and reduce latency.

  2. By storing copies of data that are expensive to fetch or compute, caching allows applications to retrieve that data more quickly when needed, rather than having to recompute or fetch it from a slower source (like a database or an external API).

# Caching strategies
  # 1. Cache-aside (Lazy Loading): application first check the cache for the data, if not found, it fetches it from the database and stores it in the cache for future requests.

  # 2. Read-through caching: Application reads data from the cache, if not found, it (cache) fetches it from the database and stores it in the cache. (Here cache takes the responsibility to store and fetch the data)

  # 3. Write-around caching: Application writes data to the database and mark the cache as invalidate. Read operation will fetch the data from the cache

  # 4. Write-through caching: Application writes data to the cache and database simultaneously. This ensures that the cache is always up-to-date with the latest data.

  # 5. Write back(or behind) caching: First write the data in cache and then write it to the database asynchronously. This can improve performance but can lead to data loss if the cache fails before the data is written to the database.
