Q. Kubernetes and Docker?

https://aws.amazon.com/compare/the-difference-between-kubernetes-and-docker/

SYSTEM DESIGN AND DATA ARCHITECTURE -

Q. Data Sources -
1. Structured Data Sources - Structured data sources in data architecture refer to data that is organized in a predefined manner, usually in a tabular format with rows and columns. This data is easily searchable and can be efficiently managed and queried using structured query languages like SQL.

Relational Databases (OLTP - Online Transactional Processing) ->
Examples: MySQL, PostgreSQL, Oracle, SQL Server
Description: Data is stored in tables with predefined schemas. Each table has columns with specified data types and constraints, such as primary keys and foreign keys, which enforce data integrity and relationships between tables.
Use Cases: Transactional applications, such as e-commerce platforms, banking systems, and inventory management.

Data Warehouses (OLAP - Online Analytical Processing) ->
Examples: Amazon Redshift, Google BigQuery, Snowflake
Description: Designed for analytical processing, data warehouses store structured data optimized for query performance. They use schemas like star and snowflake schemas to organize data for efficient querying and reporting.


Q. Database Sharding In depth -

- Sharding, derived from the term “shard,” signifies a fraction of a complete entity
- Despite maintaining identical schema and columns, each shard houses different rows, ensuring that the data within each shard remains unique and non-overlapping.
- it’s like having smaller buckets instead of one big bucket to carry water – each bucket is easier to manage than one large, heavy bucket.
Improved Scalability: Sharding allows you to add more servers to your database, spreading the load and enabling more traffic and faster processing.
Increased Operation Capacity: By distributing your database into multiple shards, you can increase both read and write operation capacity if the tasks are performed within one shard at a time.
Localized Indexes: Indexes are smaller and more efficient on each shard, as they only need to cover a subset of the data, resulting in faster search operations.
Fault Isolation: Sharding can provide fault isolation. If one shard fails, it does not affect the other shards, ensuring that the system remains operational even in the case of partial failures.
Simplified Maintenance: Maintenance tasks, such as backups and upgrades, can be performed on individual shards without affecting the entire database, making these tasks more manageable and less risky.
Easier Data Distribution: Data can be distributed based on specific criteria (e.g., geographic location, customer ID), optimizing access patterns and reducing latency for users accessing data from different regions.
Cost-Effective Scaling: Sharding enables the use of multiple smaller, less expensive servers instead of a single large, costly server, making it a cost-effective way to scale the database.
Resource Optimization: By distributing the data and workload across multiple servers, sharding helps optimize resource usage, reducing the risk of overloading any single server.

Techniques of Scaling Database Sharding-

  1. Vertical Partitioning -
    Divides a table based on columns.
    Useful for tables with many columns, where some columns are rarely used.
    Improves query performance by reducing I/O and allowing efficient indexing of relevant columns.
    May require joins to retrieve data from multiple partitions.

  2. Horizontal Partitioning-
    Divides a table based on rows.
    Useful for table with many rows, where data can be divided based on some criteria.
    Improves query performance by reducing the number of rows to be scanned for specific queries.
    Joins between partitions are typically not required because they contain disjoint sets of rows.

Architecture of Sharding -

  1. Key-Based Sharding/Hash based Sharding:
    It uses a hash function to distribute data across shards. A specific data value, such as a user ID, IP address, ZIP code, or Region, is used as input to the hash function. The output is a Shard ID, which determines where the data will be stored.
    This method helps distribute data evenly across all shards, reducing the risk of data hotspots.
    Choose a Key: Select a key for sharding, such as a user ID or order ID.
    Apply Hash Function: Apply a hash function to the key to generate a hash value.
    Modulo Operation: Use the modulo operation to map the hash value to one of the shards. The number of shards determines the modulo divisor.
    Store/Retrieve Data: Based on the result of the modulo operation, store or retrieve the data in the appropriate shard.

    # A hash function example
    def simple_hash_function(key)
      key.sum % 4
    end

    puts simple_hash_function("1001")  # => 2
    puts simple_hash_function("1002")  # => 3
    puts simple_hash_function("1003")  # => 0
    puts simple_hash_function("1004")  # => 1

  2. Range-Based Sharding:
    This is a technique that divides data into shards based on a specific range of values
    For example, in a product’s database, the products could be sharded based on their price ranges. Products with prices between $0 and $100 could be stored in one shard, while products with prices between $100 and $200 could be stored in another shard.
    Range-based sharding can cause uneven data distribution, leading to “database hotspots” where some shards receive more traffic than others.

  3. Directory Based Sharding:
    This is a database strategy that utilizes a lookup table to dictate data storage locations.
    It assigns each key to a specific shard, using the lookup table that contains fixed data location information. It is adaptable and simplifies the process of adding new shards.
    It uses a central directory for managing data-to-shard mapping, optimizing query performance, and enabling efficient load balancing
    However, it can potentially slow down operations due to lookup table access for each query or write.
    It can also create a single point of failure, making the entire database inaccessible if the lookup table fails

    # lookup table ->
    User ID Range	      Shard
    1 - 1000	          Shard 1
    1001 - 2000	        Shard 2
    2001 - 3000	        Shard 3

    e.g - Here the location based sharding can be done, as in the lookup table we can store country_code and corresponding shard number.


  Scenario -
  # https://guides.rubyonrails.org/active_record_multiple_databases.html

  class ApplicationRecord < ActiveRecord::Base
    primary_abstract_class

    connects_to database: {
      primary: { writing: :primary, reading: :primary_replica }
    }
  end

  class Shard < ApplicationRecord
    has_many :users
    validates :country_code, presence: true

    connects_to shards: {
      usa_shard: { writing: :usa_shard, reading: :usa_shard_replica }
      ind_shard: { writing: :ind_shard, reading: :ind_shard_replica }
      eng_shard: { writing: :eng_shard, reading: :eng_shard_replica }
    }

    def self.get_shard(country_code = "IND")
      case country_code
      when 'IND'
        :ind_shard
      when 'USA'
        :usa_shard
      when 'ENG'
        :eng_shard
      else
        raise 'Invalid Country Code'
      end
    end

  end

  class User < ApplicationRecord
    belongs_to :shard
    # ...
  end

  class UsersController < ApplicationController
    def create
      required_shard = Shard.get_shard(params[:country_code])
      ApplicationRecord.connected_to(role: :writing, shard: required_shard) do @user = User.new(params[:user])
      if @user.save
        redirect_to @user, notice: 'User Created Successfully'
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end
  end

  Factors to Considered before Sharding:

  Database Size: Sharding is typically used for large databases that have outgrown the capacity of a single server.
  Traffic Patterns: If your database experiences uneven traffic patterns, sharding may be beneficial.
  Growth Projections: If your database is expected to scale significantly in the future, sharding may be a good option.
  Complexity: Sharding adds complexity to your database architecture and requires careful planning and maintenance.
  Cost: Sharding can be expensive, as it requires additional hardware resources and infrastructure to support multiple servers.


Q. What is CI/CD -

  CI/CD stands for Continuous Integration and Continuous Deployment/Delivery.
  Its a set of practices and tools that automate the process of software development, from coding through testing to deployment.

  Continuous Integration (CI)
  - Continuous Integration is the practice of integrating code changes into a shared repository several times a day
  - Each integration is verified by an automated build and automated tests to detect integration errors as quickly as possible.
  - Tools like Jenkins, Travis CI, CircleCI, and GitHub Actions are used to automate the CI process.

  Continuous Delivery (CD)
  - Continuous Delivery extends CI by automating the release process so that new changes to the software can be released to production at any time.
  - Automates the deployment process to staging and testing environments.
  - Release Pipeline: A series of automated steps to prepare a build for release, including testing, packaging, and deploying.
  - Various checks (e.g., performance tests, security scans) are incorporated into the pipeline to ensure only high-quality releases.
  - Deployment to production requires manual approval, ensuring a final check before live deployment.

  Continuous Deployment (CD)
  - Continuous Deployment takes Continuous Delivery a step further by automating the entire release process, including deployment to production, without requiring manual approval.
  - Every change that passes the automated tests is automatically deployed to production.
  - Automated monitoring of the production environment and automated rollback mechanisms in case of failures.
  - Feature Flags: Use of feature flags to control the visibility of new features, allowing for safe deployment and gradual rollout.

  CI/CD Pipeline -
  - A CI/CD pipeline is a sequence of steps that code changes go through to be built, tested, and deployed.
  Commit: Developers commit code changes to the version control repository.
  Build: An automated build process compiles the code and creates artifacts.
  Unit Tests: Automated unit tests are run to validate individual components.
  Integration Tests: Automated integration tests are run to validate interactions between components.
  Staging Deployment: The application is deployed to a staging environment identical to production.
  Acceptance Tests: Automated acceptance tests are run in the staging environment.
  Production Deployment: (For Continuous Deployment) The application is automatically deployed to production, or (For Continuous Delivery) a manual approval step is required before deployment.
  Monitoring and Feedback: Post-deployment monitoring and feedback mechanisms are in place to ensure the application runs smoothly in production.



Q. CAP Theorem(Brewers Theorem) -

  It states that it is impossible for a distributed data store to simultaneously provide more than two out of the following three guarantees:

  - Consistency (C): Every read receives the most recent write or an error. This means that all nodes in a distributed system see the same data at the same time. If you perform a read operation, you will always get the latest data written to the system.
  - Availability (A): Every request (read or write) receives a (non-error) response, but without any guarantee that it contains the most recent write. This means that the system is always operational and responsive.
  - Partition Tolerance (P): The system continues to operate despite arbitrary partitioning due to network failures. This means the system can handle any number of communication breakdowns between nodes and still keep working.

  - According to the CAP theorem, a distributed system can only achieve two out of the three properties at any given time. Here’s a breakdown of the trade-offs:

  CA (Consistency and Availability, without Partition Tolerance):
  Scenario: In the absence of network partitions, the system ensures consistency and availability.
  Example: Traditional relational databases (like SQL databases) on a single server.
  Limitation: This configuration is not practical for distributed systems where network partitions can occur.

  CP (Consistency and Partition Tolerance, without Availability):
  Scenario: The system remains consistent and tolerates partitions, but may not always be available.
  Example: Distributed databases like HBase or MongoDB in certain configurations.
  Limitation: During network partitions, the system may become unavailable to ensure consistency.

  AP (Availability and Partition Tolerance, without Consistency):
  Scenario: The system remains available and tolerates partitions, but may not always be consistent.
  Example: NoSQL databases like Cassandra or DynamoDB.
  Limitation: The system may return outdated data during network partitions to ensure availability.

  Trade-offs in Distributed System Design:
  High Consistency Needs: Systems requiring strong consistency (e.g., banking systems) may choose CP, sacrificing availability during network partitions.
  High Availability Needs: Systems requiring high availability (e.g., social media platforms) may choose AP, tolerating eventual consistency to remain always responsive.
  Network Partition Considerations: Given that network partitions can occur, truly distributed systems usually prioritize partition tolerance (P) and then make a trade-off between consistency and availability.


Q. Caching and CDNs for decreasing request response latency on cloud based applications

  Caching -
  - Caching involves storing copies of files or data in temporary storage locations (caches) so that future requests can be served faster without reprocessing or retrieving data from the original source.
  Types of Caching:
    1. Browser Caching: Stores web resources (HTML, CSS, JavaScript, images) in the users browser cache. Reduces load times for returning users by avoiding repeated downloads of the same resources. Achieved through HTTP headers like Cache-Control, Expires, and ETag.
    2. Proxy Caching: Intermediate caches that store copies of responses from the server to be reused for future requests.
      - Reverse Proxy Caching: Caches content on servers like Nginx or Varnish.
      - Forward Proxy Caching: Caches content on client-side proxies.
    3. Server-Side Caching: Stores data on the server side to reduce processing time for repeated requests. Often done using tools like Redis, Memcached, or built-in features of web frameworks.
    4. Database Caching: Stores frequently accessed database query results in memory to speed up read operations. Redis, Memcached, and database-specific caching mechanisms.


  Content Delivery Networks (CDNs) -
  - A CDN is a network of distributed servers that cache and deliver content (such as web pages, images, videos, and other resources) from locations closer to the end user.
  - By distributing content across multiple geographic locations, CDNs reduce latency and improve the speed and reliability of content delivery.

  How CDN works -
  - CDNs replicate content from the origin server and store it on multiple edge servers distributed across various geographic locations.
  - When a user requests content, the CDN directs the request to the nearest edge server that has the cached content.
  - The edge server delivers the content quickly, reducing the distance the data must travel and thus improving load times.
  - CDNs periodically refresh their caches to ensure that content remains up-to-date.



Low Level Design (please watch: https://www.youtube.com/watch?v=tv54FY48Vio&list=PLliXPok7ZonlZJuAN0hvUnf5ovFepjxU0)

There are 3 main types of Design Patterns
  1. Creational design pattern (How objects are created)
      a. Factory
      b. Abstract Factory
      c. Singleton
  2. Structural Design Pattern (How objects are composed)
      a. Bridge
      b. Adaptive/Adapter
      c. Composite
      d. Decorator
  3. Behavioral Design Pattern (How objects communicate)
      a. Interpreter
      b. Strategy
      c. Observer

1. Factory Design Pattern: >> Encapsulates the logic of object creation without exposing it to the client.
                        >> Used when you don’t know what concrete class you’ll need at runtime.

class PaymentFactory
  def self.create(type, amount)
    case type
    when 'credit_card'
      CreditCardPayment.new(amount)
    when 'upi'
      UPIPayment.new(amount)
    else
      raise "Invalid payment type"
    end
  end
end

# Usage:
payment = PaymentFactory.create('credit_card', 1000)
payment.process


2. Singleton Design Pattern: >> Ensures that only one instance of a class is created and provides a global point of access to it.

class Logger
  @@instance = nil

  def self.instance
    @@instance ||= Logger.new
  end

  def log(message)
    puts "[LOG]: #{message}"
  end

  private_class_method :new # Prevents direct instantiation
end

# Usage
logger1 = Logger.instance
logger2 = Logger.instance
logger1.log("Starting app...")

puts logger1.object_id == logger2.object_id # true (Same instance)


4. Decorator Pattern >> Allows adding new functionality to an object without modifying its structure.

class Coffee
  def cost
    5
  end
end

class MilkDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 2
  end
end

# Usage:
coffee = Coffee.new
coffee_with_milk = MilkDecorator.new(coffee)
puts coffee_with_milk.cost


Adapter Pattern: >> Allows incompatible interfaces to work together. Acts as a bridge between two incompatible classes.


class LegacyPrinter
  def print_text(text)
    puts "Printing: #{text}"
  end
end

class ModernPrinter
  def initialize(legacy_printer)
    @legacy_printer = legacy_printer
  end

  def print(text)
    @legacy_printer.print_text(text)
  end
end

# Usage:
legacy = LegacyPrinter.new
printer = ModernPrinter.new(legacy)
printer.print("Hello, World!")



Strategy Pattern >> Encapsulates different algorithms and lets you switch between them dynamically.

class CreditCardPayment
  def pay(amount)
    puts "Paid ₹#{amount} using Credit Card"
  end
end

class UPIPayment
  def pay(amount)
    puts "Paid ₹#{amount} using UPI"
  end
end

class PaymentContext
  def initialize(payment_strategy)
    @payment_strategy = payment_strategy
  end

  def execute_payment(amount)
    @payment_strategy.pay(amount)
  end
end

# Usage:
payment = PaymentContext.new(CreditCardPayment.new)
payment.execute_payment(1000)


Observer Pattern >> Defines a one-to-many relationship where multiple objects are notified when the state of one object changes.

class Publisher
  def initialize
    @subscribers = []
  end

  def subscribe(subscriber)
    @subscribers << subscriber
  end

  def notify
    @subscribers.each(&:update)
  end
end

class Subscriber
  def update
    puts "Notified!"
  end
end

# Usage:
publisher = Publisher.new
subscriber = Subscriber.new
publisher.subscribe(subscriber)
publisher.notify



# ---------------------------------------------------------------------------------------------------------------------
# Design Patterns Majorly used in Rails:
# ---------------------------------------------------------------------------------------------------------------------

#     1. Singleton classes (Creational Design Patterns)
#         Often required to create classes with only one objects
#         Eg, Logger DBConnection
#         In ruby we can include Singleton module in any class to make it a singleton class
#     2. Factory method (Creational Design Patter)
#         An interface is treated as a Factory and its methods are overriden by child class
#         Eg, Notification class will have send method which accepts two arguments type and content,
#         now if I want to send notification I will use Notification.new.send(:email, 'Content') rather than calling
#         EmailNotification.send which is called by Notification.send internally
#     3. Abstract Factory (Creational Design Pattern): basically it gives you an object of factory from which you can create another object based on condition
#         It is basically categorical interfaces to categorize every class/module in higher level
#         Interface Vehicle will be inherited by Class TwoWheeler and For Wheeler
#     4. Builder (Creational Design Pattern)
#         It is used to create complex objects step by step
#         Eg, if I want to build custom report the responsibility of building dimesions metrics and filters are
#         distributed among various builders
#     5. Prototype (Creational Design Pattern)
#         It is a design pattern where class implements the prototype interface which has method called as clone()
#         So lets say we have Robot as a class and we want to create the clone of it so instead creating assigning value in clone object
#         we can create an clone method in Robot instance method and return the object of clone


#     6. Decorator (Structural Design Pattern)
#         It is used to add new functionality to an existing object without modifying its structure
#         Eg, if I want to add a new functionality to a class I can create a decorator class which will inherit
#         the original class and override the methods to add new functionality for example as_json
#     7. Composite (Structural Design Pattern)
#         It is used to treat individual objects and compositions of objects uniformly
#         Eg, if I want to create a tree structure where each node can be a leaf or a composite node
#         I can create a class which will inherit from the base class and override the methods to add new functionality


#     8. Observer (Behavioral Design Pattern)
#         It is used to notify multiple objects when a state of an object changes
#         Eg, if I want to notify all the observers when a user is created I can use observer pattern
#         where I will create a class which will inherit observable and then I can call notify_observers
#         whenever a user is created
#     9. Policy (Behavioral Design Pattern)
#         It is used to define a family of algorithms, encapsulate each one, and make them interchangeable
#         Eg, if I want to create a class which will have different policies for different users
#         I can create a class which will inherit from the base class and override the methods to add new functionality

# ---------------------------------------------------------------------------------------------------------------------

# HLD - High Level Design
# ---------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# Q. How to handle rate limiting?
# ---------------------------------------------------------------------------------------------------------------------

  # There are several ways to handle rate limiting in a web application, including:
    # Token Bucket Algorithm
    #   A bucket holds a fixed number of tokens that are added at a constant rate.
    #   Each incoming request consumes a token.
    #   If the bucket is empty (no tokens available), the request is either delayed or rejected.
    #   This algorithm allows for bursts of traffic as long as there are tokens.

    # Leaky Bucket Algorithm
    #   Requests enter a queue (the "bucket") and are processed at a fixed rate.
    #   If the bucket overflows (i.e., too many incoming requests), excess requests are dropped.
    #   This smooths out bursts, ensuring a consistent processing rate.

    # Fixed Window Counter
    #   A counter tracks the number of requests within a fixed time window (e.g., 100 requests per minute).
    #   Once the limit is reached, further requests within that window are rejected.
    #   Simple to implement but can cause bursts at window edges ("thundering herd" problem).

    # Sliding Window Log or Counter
    #   A more accurate version of fixed window.
    #   Maintains a log or rolling count of request timestamps in the current sliding window (e.g., past 60 seconds).
    #   Allows more precise rate limiting without the burstiness of fixed windows.

# ---------------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------------
#* What is OAuth (Open Authorization)?
# ---------------------------------------------------------------------------------------------------------------------

#  It is authorization framework, It enables third party access to protected resources without sharing credentials.
# There are 4 roles in OAuth:
  # 1. Resource Owner: The user who owns the data and grants access to it.
  # 2. Client: The application requesting access to the resource owner's data.
  # 3. Authorization Server: The server that issues access tokens to the client after successfully authenticating the resource owner.
  # 4. Resource Server: The server hosting the protected resources that the client wants to access.

  # Consider the following example:
    # I am a user (Hardik) who wants to sign-in the leetcode using gmail account:
    #  Hardik is the resource owner,
    # leetcode is the client,
    # google authenticating is the authorization server
    # Gmail is the resource server.

# Authorization Code Flow:

# Resource Owner(Hardik)                       Client(leetcode)                     Gmail Auth Server                      Gmail
#     |                                          |                                    |                                      |
#     |                                          |         1. Registration            |                                      |
#     |                                          +----------------------------------->+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |   2. Client Id And Client Secret   |                                      |
#     |                                          +<-----------------------------------+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     | 3. Sign In Using Google                  |                                    |                                      |
#     +----------------------------------------->+                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |4. Redirect to authorization server |                                      |
#     |                                          +----------------------------------->+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |                             5. User authenticate and                      |
#     |                                          |                                    provide consent                        |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |  6. Provides auth code             |                                      |
#     |                                          +<-----------------------------------+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          | 7. Request token using auth code   |                                      |
#     |                                          +----------------------------------->+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          | 8. Gets access token and refresh token                                    |
#     |                                          +<-----------------------------------+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          | 9. Request resources or data       |                                      |
#     |                                          +-------------------------------------------------------------------------->|
#     |                                          |                                    |                                      |
