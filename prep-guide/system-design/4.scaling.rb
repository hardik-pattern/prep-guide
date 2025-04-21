# # How to scale a system from 0 to million users

# 1. single server
# 2. application and DB server separation
# 3. load balancer + multiple application servers
# 4. database replication
# 5. caching & CDN
# 6. data warehousing
# 7. message queues
# 8. database scaling -> sharding

# ## 1. Single Server
# - Start with a single server that runs both the application and the database.
# - This is the simplest and cheapest option for small applications.
# - Pros: Easy to set up, low cost, no network latency.
# - Cons: Limited resources, single point of failure, not scalable.

# ## 2. Application and DB Server Separation
# - Separate the application server and the database server.
# - This allows for better resource allocation and performance.
# - Pros: Better performance, easier to scale, more reliable.
# - Cons: More complex setup, higher cost.

# ## 3. Load Balancer + Multiple Application Servers
# - Add a load balancer in front of multiple application servers.
# - This allows for better distribution of traffic and improved performance.
# - Pros: Better performance, improved reliability, easier to scale.
# - Cons: More complex setup, higher cost.

# ## 4. Database Replication
# - Use database replication to create multiple copies of the database.
# - This allows for better performance and reliability.
# - Pros: Improved performance, better reliability, easier to scale.

# 5. Caching & CDN
# - Implement caching to store frequently accessed data in memory.
# - Use a Content Delivery Network (CDN) to serve static assets closer to users.

# 6. Data Warehousing
# - Use a data warehouse for analytics and reporting.
# - This allows for complex queries without impacting the main database.

# 7. Message Queues
# - Use message queues to decouple services and handle asynchronous tasks.
# # Scaling a system from 0 to million users
