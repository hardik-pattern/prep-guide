Rails OOPS in Ruby
===========================

Ruby | Encapsulation
--------------------
Encapsulation is defined as the wrapping up of data under a single unit. It is the mechanism that binds together code and the data it manipulates. In a different way, encapsulation is a protective shield that prevents the data from being accessed by the code outside this shield.

Technically in encapsulation, the variables or data of a class are hidden from any other class and can be accessed only through any member function of own class in which they are declared.
Encapsulation can be achieved by declaring all the variables in the class as private and writing public methods in the class to set and get the values of variables.

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

Output:

Customer id: 1
Customer name: Mike
Customer address: Wisdom Apartments, Ludhiya
Customer id: 2
Customer name: Jackey
Customer address: New Empire road, Khandala


Explanation: In the above program, the class Demoencapsulation encapsulate the methods of the class. You can only access these methods with the help of objects of the Demoencapsulation class i.e. cust1 and cust2.

Advantages of Encapsulation:
-------------------------------
-->Data Hiding:The user will have no idea about the inner implementation of the class. It will not be visible to the user that how the class is storing values in the variables. He only knows that we are passing the values to a setter method and variables are getting initialized with that value.
-->Reusability: Encapsulation also improves the re-usability and easy to change with new requirements.
-->Testing code is easy:Encapsulated code is easy to test for unit testing.


Data Abstraction in Ruby
-------------------------------
The idea of representing significant details and hiding details of functionality is called data abstraction
Abstraction is trying to minimize information so that the developer can concentrate on a few ideas at a time.

 - example

 The only thing the person knows is that typing the numbers and hitting the dial button will make a phone call, they don’t know about the inner system of the phone or the dial button on the phone. That’s what we call abstraction.

- Data Abstraction in modules
 consider the sqrt() method present in Math module. Whenever we need to calculate the square root of a non negative number, We simply call the sqrt() method present in the Math module and send the number as a parameter without understanding the actual algorithm that actually calculates the square root of the numbers.


Data Abstraction in Classes: we can use classes to perform data abstraction in ruby. The class allows us to group information and methods using access specifiers (private, protected, public). The Class will determine which information should be visible and which is not.

class Geeks
    # defining publicMethod

    public

    def publicMethod
        puts "In Public!"
        # calling privateMethod inside publicMethod
        privateMethod
    end

    # defining privateMethod

    private

    def privateMethod
        puts "In Private!"
    end
end


# creating an object of class Geeks
obj = Geeks.new

# calling the public method of class Geeks
obj.publicMethod

Output:
In Public!
In Private!
In the above program, we are not allowed to access the privateMethod() of Geeks class directly, however, we can call the publicMethod() in the class in order to access the privateMethod().

Advantages of Data Abstraction:

Helps increase the security of a system because only crucial details are made available to the user.
It increases re-usability and prevents redundancy of code.
Could alter the internal class implementation independently without affecting the user.


Polymorphism in Ruby
-------------------------------
Polymorphism is a method where one is able to execute the same method using different objects. In polymorphism, we can obtain different results using the same function by passing different input objects.
 - Polymorphism using Inheritance
  ---> Inheritance is a property where a child class inherits the properties and methods of a parent class. One can easily implement polymorphism using inheritance
 - Polymorphism using Duck-Typing

class Vehicle
    def tyreType
        puts "Heavy Car"
    end
end

# Using inheritance
class Car < Vehicle
    def tyreType
        puts "Small Car"
    end
end

# Using inheritance
class Truck < Vehicle
    def tyreType
        puts "Big Car"
    end
end

# Creating object
vehicle = Vehicle.new
vehicle.tyreType()

# Creating different object calling same function
vehicle = Car.new
vehicle.tyreType()

# Creating different object calling same function
vehicle = Truck.new
vehicle.tyreType()

Output:
-----------
Heavy Car
Small Car
Big Car
The above code is a very simple way of executing basic polymorphism. Here, the tyreType method is called using different objects like Car and Truck. The Car and Truck classes both are the child classes of Vehicle. They both inherit the methods of vehicle class (primarily the tyretype method).


Polymorphism using Duck-Typing
In Ruby, we focus on the object’s capabilities and features rather than its class. So, Duck Typing is nothing but working on the idea of what an object can do rather than what it actually is. Or, what operations could be performed on the object rather than the class of the object.
Here is a small program to represent the before mentioned process.
Example :
filter_none
brightness_4
# Ruby program of polymorphism using Duck typing

# Creating three different classes
class Hotel
  def enters
    puts "A customer enters"
  end

  def type(customer)
    customer.type
  end

  def room(customer)
    customer.room
  end
end

# Creating class with two methods
class Single
  def type
    puts "Room is on the fourth floor."
  end

  def room
    puts "Per night stay is 5 thousand"
  end
end


class Couple
  # Same methods as in class single
  def type
    puts "Room is on the second floor"
  end

  def room
    puts "Per night stay is 8 thousand"
  end

end

# Creating Object
# Performing polymorphism
hotel= Hotel.new
puts "This visitor is Single."
customer = Single.new
hotel.type(customer)
hotel.room(customer)


puts "The visitors are a couple."
customer = Couple.new
hotel.type(customer)
hotel.room(customer)
Output :

This visitor is Single.
Room is on the fourth floor.
Per night stay is 5 thousand
The visitors are a couple.
Room is on the second floor
Per night stay is 8 thousand
In the above example, The customer object plays a role in working with the properties of the customer such as its “type” and its “room”. This is an example of polymorphism.

Ruby | Inheritance
----------------------------------------------
Ruby is the ideal object-oriented language. In an object-oriented programming language, inheritance is one of the most important features. Inheritance allows the programmer to inherit the characteristics of one class into another class. Ruby supports only single class inheritance, it does not support multiple class inheritance but it supports mixins. The mixins are designed to implement multiple inheritances in Ruby, but it only inherits the interface part.

Inheritance provides the concept of “reusability”, i.e. If a programmer wants to create a new class and there is a class that already includes some of the code that programmer wants, then he or she can derive a new class from the existing class. By doing this, it increases the reuse of the fields and methods of the existing class without creating extra code.


===========================
Rails Redis
===========================

What is Redis?

Redis is a kind of in-memory database that has different kinds of data structures you can use.
Redis is a key-value store that stands out from others, like memcached, in that it has built-in support for data structures like lists, sets, and hashes, and that it can persist data to disk. As such, it is quite useful as both a cache store and as a full-fledged, NoSQL data store.

Like:

Key / value storage
Lists
Sets
It has nothing to do with your typical SQL database, like Postgres.

Uses for Redis include:

Caching
Leaderboards
Counting visitors
Fast autocomplete suggestions
Keeping track of active user sessions
Work & message queues
Let’s have a look at how you can use Redis in your Ruby applications!

advantages
-no of request calls reduced
-database load reduced
-recomputation decreased

with the help write back mechanism updated data stored in Redis Storage when update / deletion / creation performed on Database

example -

 - get the list of age 27 students

 - count of Orders/Products expire redis cache when update / deletion / creation performed on Database


 class Event < ApplicationRecord
  def tickets_count
    tickets.count
  end
  def tickets_sum
    tickets.sum(:amount)
  end
end

gem 'redis-rails'

config/environments/development.rb

config.cache_store = :redis_store, {
  expires_in: 1.hour,
  namespace: 'cache',
  redis: { host: 'localhost', port: 6379, db: 0 },
  }


  class Event < ApplicationRecord
  def tickets_count
    Rails.cache.fetch([cache_key, __method__], expires_in: 30.minutes) do
      tickets.count
    end
  end
  def tickets_sum
    Rails.cache.fetch([cache_key, __method__]) do
      tickets.sum(:amount)
    end
  end
end
===========================
Webhook
===========================
Sometimes webhooks are referred to as a reverse API, but this isn’t entirely true. They don’t run backwards, but instead, there doesn’t need to be a request initiated on your end, data is sent whenever there’s new data available.

To implement webhooks all you have to do is register a URL with the company providing the service you’re requesting data from. That URL will accept data and can activate a workflow to turn the data into something useful. In most cases, you can even specify the situations in which your provider will deliver you the data.

Webhooks and APIs differ in how they make requests. For instance, APIs will place calls for data whether there’s been a data update response, or not. While webhooks receive calls through HTTP POSTs only when the external system you’re hooked to has a data update.

When to Use a WebHook?
-------------------------------
Webhooks are commonly used to perform smaller requests and tasks, however, there are situations where a webhook is more appropriate than an entire API.

One common scenario is when your app or platform demands real-time updates, but you don’t want to waste your resources. In this instance, a webhook framework would be beneficial.

Another circumstance to use a webhook over an API would be when the API is very poor, or there isn’t an API to begin with. You could create a workaround solution to give you the data your app requires to function.



===========================
MVC
===========================
The browser issues a request for the /users URL.
Rails routes /users to the index action in the Users controller.
The index action asks the User model to retrieve all users (User.all).
The User model pulls all the users from the database.
The User model returns the list of users to the controller.
The controller captures the users in the @users variable, which is passed to the index view.
The view uses embedded Ruby to render the page as HTML.
The controller passes the HTML back to the browser.5

===========================
Rails Caching
===========================
Cache is a type of memory that is used to increase the speed of data access. Normally, the data required for any process resides in the main memory. However, it is transferred to the cache memory temporarily if it is used frequently enough. The process of storing and accessing data from a cache is known as caching.

=========1.1 Page Caching===========
Page caching is a Rails mechanism which allows the request for a generated page to be fulfilled by the webserver (i.e. Apache or nginx), without ever having to go through the Rails stack at all. Obviously, this is super-fast. Unfortunately, it can’t be applied to every situation (such as pages that need authentication) and since the webserver is literally just serving a file from the filesystem, cache expiration is an issue that needs to be dealt with.

To enable page caching, you need to use the caches_page method.

caches_page :index

============1.2 Action Caching================
One of the issues with Page Caching is that you cannot use it for pages that require to restrict access somehow. This is where Action Caching comes in. Action Caching works like Page Caching except for the fact that the incoming web request does go from the webserver to the Rails stack and Action Pack so that before filters can be run on it before the cache is served. This allows authentication and other restriction to be run while still serving the result of the output from a cached copy.

Clearing the cache works in a similar way to Page Caching, except you use expire_action instead of expire_page.


==================1.3 Fragment Caching=================
Life would be perfect if we could get away with caching the entire contents of a page or action and serving it out to the world. Unfortunately, dynamic web applications usually build pages with a variety of components not all of which have the same caching characteristics. In order to address such a dynamically created page where different parts of the page need to be cached and expired differently, Rails provides a mechanism called Fragment Caching.

Fragment Caching allows a fragment of view logic to be wrapped in a cache block and served out of the cache store when the next request comes in.

As an example, if you wanted to show all the orders placed on your website in real time and didn’t want to cache that part of the page, but did want to cache the part of the page which lists all products available, you could use this piece of code:

The cache block in our example will bind to the action that called it and is written out to the same place as the Action Cache, which means that if you want to cache multiple fragments per action, you should provide an action_suffix to the cache call:

<% cache(:action => 'recent', :action_suffix => 'all_products') do %>
  All available products:


expire_fragment(:controller => 'products', :action => 'recent', :action_suffix => 'all_products')
and you can expire it using the expire_fragment method, like so:


=========================================
Rails filters
=========================================
Rails filters are methods that run before or after a controller's action method is executed. They are helpful when you want to ensure that a given block of code runs with whatever action method is called.

Rails support three types of filter methods:

Before filters
After filters
Around filters


Around Filters
Rails around filters contain codes that are executed both before and after controller's code is executed. They are generally used when you need both before and after filter. Its implementation is little bit different and more complex than other two filters. It is generally defined by a common class which contains both before and after methods.



================================
Is ruby multi therading language.
================================
A multithreaded program has more than one thread of execution. Within each thread, statements are executed sequentially, but the threads themselves may be executed in parallel on a multi-core CPU, for example. Often on a single CPU machine, multiple threads are not actually executed in parallel, but parallelism is simulated by interleaving the execution of the threads.

Ruby makes it easy to write multi-threaded programs with the Thread class. Ruby threads are a lightweight and efficient way to achieve concurrency in your code.

To start a new thread, just associate a block with a call to Thread.new. A new thread will be created to execute the code in the block, and the original thread will return from Thread.new immediately and resume execution with the next statement −

def func1
   i = 0
   while i<=2
      puts "func1 at: #{Time.now}"
      sleep(2)
      i = i+1
   end
end

def func2
   j = 0
   while j<=2
      puts "func2 at: #{Time.now}"
      sleep(1)
      j = j+1
   end
end

puts "Started At #{Time.now}"
t1 = Thread.new{func1()}
t2 = Thread.new{func2()}
t1.join
t2.join
puts "End at #{Time.now}"

Thread Lifecycle
A new threads are created with Thread.new. You can also use the synonyms Thread.start and Thread.fork.

There is no need to start a thread after creating it, it begins running automatically when CPU resources become available.

The Thread class defines a number of methods to query and manipulate the thread while it is running. A thread runs the code in the block associated with the call to Thread.new and then it stops running.

The value of the last expression in that block is the value of the thread, and can be obtained by calling the value method of the Thread object. If the thread has run to completion, then the value returns the thread's value right away. Otherwise, the value method blocks and does not return until the thread has completed.

The class method Thread.current returns the Thread object that represents the current thread. This allows threads to manipulate themselves. The class method Thread.main returns the Thread object that represents the main thread. This is the initial thread of execution that began when the Ruby program was started.

You can wait for a particular thread to finish by calling that thread's Thread.join method. The calling thread will block until the given thread is finished.


========================
Action Pack
========================
Action Pack lies at the heart of Rails applications. It consists of three Ruby modules:

Action Dispatch routes requests to controllers.
Action Controller converts requests into responses.
Action View is used by Action Controller to format those responses.

Dispatching Requests to Controllers
At its simplest, a web application accepts an incoming request from a browser, processes it, and sends a response.

Rails provides two ways to define how to route a request:

define a direct mapping of URLs to actions based on pattern matching, requirements, and conditions(the comprehensive way).
define routes based on resources, such as the models that you define(the convenient way).
you can freely mix and match the two approaches, because the convenient way is built on the comprehensive way.


============================
Blocks
============================
You have seen how Ruby defines methods where you can put number of statements and then you call that method. Similarly, Ruby has a concept of Block.

 A Ruby block is a way of grouping statements

Ruby blocks are little anonymous functions that can be passed into methods.

use of block is you can group the multiple statements in block and it can use multiple times.

The code in the block is not executed at the time it is encountered. Instead, Ruby remembers the context in which the block appears (the local variables, the current object, and so on) and then enters the method.

A block consists of chunks of code.

You assign a name to a block.

The code in the block is always enclosed within braces ({}) and between do..end.

A block is always invoked from a function with the same name as that of the block. This means that if you have a block with the name test, then you use the function test to invoke this block.

You invoke a block by using the yield statement.

def call_block
  puts 'Start of method'
  # you can call the block using the yield keyword
  yield
  yield
  puts 'End of method'
end
# Code blocks may appear only in the source adjacent to a method call
call_block {puts 'In the block'}

def call_block
  yield('hello', 99)
end

call_block {|str, num| puts str + ' ' + num.to_s}


=======================================================================
Rails Strong paramters
=======================================================================

With this plugin Action Controller parameters are forbidden to be used in Active Model mass assignments until they have been whitelisted. This means you'll have to make a conscious choice about which attributes to allow for mass updating and thus prevent accidentally exposing that which shouldn't be exposed.

In addition, parameters can be marked as required and flow through a predefined raise/rescue flow to end up as a 400 Bad Request with no effort.


example
---------------
raw_parameters = { :email => "john@example.com", :name => "John", :admin => true }
parameters = ActionController::Parameters.new(raw_parameters)
user = User.create(parameters.permit(:name, :email))

=======================================================================
method_missing
=======================================================================
method_missing is a method in Ruby that intercepts calls to methods that don’t exist. It handles any messages that an object can’t respond to.

method_missing is a method that ruby gives you access inside of your objects a way to handle situations when you call a method that doesn't exist. It's sort of like a Begin/Rescue, but for method calls. It gives you one last chance to deal with that method call before an exception is raised.

 Let’s take the most basic example
Allow me to create a random object from an animal class and pass it a method

method missing has 3 parameters.


m ~ This is the name of the missing method called on an object. It’s a symbol usually converted to a string before it’s used. It is a required parameter.

*args ~ This sponges up any other remaining arguments. It’s an optional parameter.

&blocks ~ This includes blocks called within the method. It’s also an optional parameter.


================================
rails method overloading and overriding
================================

What is method overloading?
You want to create two different versions of a method with the same name: two methods that differ in the arguments they take. However, a Ruby class can have only one method with a given name (if you define a method with the same name twice, the latter method definition prevails as seen in example p038or.rb in topic Ruby Overriding Methods). Within that single method, though, you can put logic that branches depending on how many and what kinds of objects were passed in as arguments.

class Rectangle
  def initialize(*args)
    if args.size < 2  || args.size > 3
      # modify this to raise exception, later
      puts 'This method takes either 2 or 3 arguments'
    else
      if args.size == 2
        puts 'Two arguments'
      else
        puts 'Three arguments'
      end
    end
  end
end
Rectangle.new([10, 23], 4, 10)
Rectangle.new([10, 23], [14, 13])


===========================
method overriding
===========================
Method overriding, in object oriented programming, is a language feature that allows a subclass to provide a specific implementation of a method that is already provided by one of its superclasses. The implementation in the subclass overrides (replaces) the implementation in the superclass.

class A
  def a
    puts 'In class A'
  end
end

class B < A
  def a
    puts 'In class B'
  end
end

b = B.new
b.a

The method a in class B overrides the method a in class A.

----------------------------------------------------------------
Rails super
----------------------------------------------------------------
The way super handles arguments is as follows:

When you invoke super with no arguments Ruby sends a message to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. It automatically forwards the arguments that were passed to the method from which it's called.
Called with an empty argument list - super()-it sends no arguments to the higher-up method, even if arguments were passed to the current method.
Called with specific arguments - super(a, b, c) - it sends exactly those arguments.



======================================
Proc and lambda
======================================

A lambda is a way to define a block & its parameters with some special syntax.

You can save this lambda into a variable for later use.

Defining a lambda won’t run the code inside it, just like defining a method won’t run the method, you need to use the call method for that

say_something = -> { puts "This is a lambda" }
say_something.call


 A Proc object is an encapsulation of a block of code, which can be stored in a local variable, passed to a method or another Proc, and can be called. Proc is an essential concept in Ruby and a core of its functional programming features.

square = Proc.new {|x| x**2 }
square.call(3)

There are only two main differences.

First, a lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

Second, when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc # prints "Batman will win!"

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda # prints "Iron Man will win!"

================================================================================
rack Middleware
================================================================================

What is Rack

Rack is a layer between the framework (Rails) & the application server (Puma).
The characteristics of a Rack application is that the application object responds to the call method. The call method takes in the environment object as argument and returns the Rack response object.

What's Middleware?

Middleware is a dreadful term which refers to any software component/library which assists with but is not directly involved in the execution of some task. Very common examples are logging, authentication and the other common, horizontal processing components. These tend to be the things that everyone needs across multiple applications but not too many people are interested (or should be) in building themselves.

Rack middleware is more than a way to filter a request and response - its an implementation of the pipeline design pattern for web servers using Rack.

It very cleanly separates out the different stages of processing a request - separation of concerns being a key goal of all well designed software products.

For example with Rack I can have separate stages of the pipeline doing:

Authentication: when the request arrives, are the users login details correct? How do I validate this OAuth, HTTP Basic Authentication, name/password?
  Authorization: is the user authorized to perform this particular task?, i.e. role-based security.
  Caching: have I processed this request already, can I return a cached result?
  Decoration: how can I enhance the request to make downstream processing better?
  Performance & Usage Monitoring: what stats can I get from the request and response?
  Execution: actually handle the request and provide a response.

Being able to separate the different stages (and optionally include them) is a great help in developing well structured applications.


What's Middleware?
Middleware is a dreadful term which refers to any software component/library which assists with but is not directly involved in the execution of some task. Very common examples are logging, authentication and the other common, horizontal processing components. These tend to be the things that everyone needs across multiple applications but not too many people are interested (or should be) in building themselves.


================================================
Rails Association
================================================
https://guides.rubyonrails.org/association_basics.html

==================================================
Strong Parameters
==================================================
4.5 Strong Parameters
With strong parameters, Action Controller parameters are forbidden to be used in Active Model mass assignments until they have been permitted. This means that you ll have to make a conscious decision about which attributes to permit for mass update. This is a better security practice to help prevent accidentally allowing users to update sensitive model attributes.

In addition, parameters can be marked as required and will flow through a predefined raise/rescue flow that will result in a 400 Bad Request being returned if not all required parameters are passed in.

====================================================
Action controller
====================================================
https://guides.rubyonrails.org/action_controller_overview.html

===================================================
Active record callback
===================================================
https://guides.rubyonrails.org/active_record_callbacks.html

Callbacks allow you to trigger logic before or after or around an alteration of an object’s state.

after_commit
Called after a new or existing object is committed to the database. An :on argument can be used to specify which action (create, update, or destroy) this callback should apply to.

after_create
Called after a new object is saved.

after_destroy
Called after an existing object is destroyed.

after_rollback
Called after a create, update, or destroy action is rolled back on a new or existing object.

after_save
Called after a new or existing object is saved.

after_update
Called after an existing object is saved.

after_validation
Called after a new or existing object’s validations occur.

around_create
Called before a new object is saved until yield is invoked within the method triggered by the callback. Calling yield causes the object to be saved and then any proceeding code in the method will execute.

around_destroy
Called before an existing object is destroyed until yield is invoked within the method triggered by the callback. Calling yield causes the object to be destroyed and then any proceeding code in the method will execute.

around_save
Called before a new or existing object is saved until yield is invoked within the method triggered by the callback. Calling yield causes the object to be saved and then any proceeding code in the method will execute.

around_update
Called before an existing object is saved until yield is invoked within the method triggered by the callback. Calling yield causes the object to be saved and then any proceeding code in the method will execute.

before_create
Called before a new object is saved.

before_destroy
Called before an existing object is destroyed.

before_save
Called before a new or existing object is saved.

before_update
Called before an existing object is saved.

before_validation
Called before a new or existing object’s validations occur.


Web server/Application server


3.1 Creating an Object
================================
before_validation
after_validation
before_save
around_save
before_create
around_create
after_create
after_save
after_commit/after_rollback

3.2 Updating an Object
================================
before_validation
after_validation
before_save
around_save
before_update
around_update
after_update
after_save
after_commit/after_rollback

3.3 Destroying an Object
================================
before_destroy
around_destroy
after_destroy
after_commit/after_rollback

==============================================
CORS
==============================================
Cross-Origin Resource Sharing (CORS) is a mechanism that uses additional HTTP headers to tell a browser to let a web application running at one origin (domain) have permission to access selected resources from a server at a different origin. A web application executes a cross-origin HTTP request when it requests a resource that has a different origin (domain, protocol, and port) than its own origin.

CORS defines a way in which the browser and the server can interact to determine whether or not to allow the cross-origin request. It is a compromise that allows greater flexibility, but is more secure than simply allowing all such requests.

used when there are projects are separated between 2 or more servers..... like front end and backend servers...............


https://medium.com/@admatbandara/setting-up-cors-to-my-rails-api-a6184e461a0f

================================================
CSRF
================================================

https://medium.com/rubyinside/a-deep-dive-into-csrf-protection-in-rails-19fa0a42c0ef

Cross-Site Request Forgery (CSRF) is an attack that allows a malicious user to spoof legitimate requests to your server, masquerading as an authenticated user. Rails protects against this kind of attack by generating unique tokens and validating their authenticity with each submission.

There are two components to CSRF. First, a unique token is embedded in your site's HTML. That same token is also stored in the session cookie. When a user makes a POST request, the CSRF token from the HTML gets sent with that request. Rails compares the token from the page with the token from the session cookie to ensure they match.

As a Rails developer, you basically get CSRF protection for free. It starts with this single line in application_controller.rb, which enables CSRF protection:

protect_from_forgery with: :exception


Next, there's this single line in application.html.erb:


<%= csrf_meta_tags %>


class User < ActiveRecord::Base
  before_create :set_access_token

  private

  def set_access_token
    self.access_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(access_token: token).exists?
    end
  end
end

rails g migration add_auth_token_to_user auth_token:token

class AddAuthTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :auth_token, :string
    add_index :users, :auth_token, unique: true
  end
end

user = User.first
=> <User id: 11, name: 'John', email: 'john@example.com',
         token: "jRMcN645BQyDr67yHR3qjsJF",
         password_reset_token: "qjCbex522DfVEVd5ysUWppWQ">

>> user.password_reset_token
=> "qjCbex522DfVEVd5ysUWppWQ"

>> user.regenerate_password_reset_token
=> true

>> user.password_reset_token
=> "tYYVjnCEd1LAXvmLCyyQFzbm"

==================================================
sessions
==================================================
Sessions enable the application to maintain user-specific state, while users interact with the application. For example, sessions allow users to authenticate
once and remain signed in for future requests.


=================
rest
=================
What is REST API?
REST suggests to create an object of the data requested by the client and send the values of the object in response to the user. For example, if the user is requesting for a movie in Bangalore at a certain place and time, then you can create an object on the server-side.

So, over here, you have an object and you are sending the state of an object. This is why REST is known as Representational State Transfer.

If I have to define REST, then,  Representational State Transfer a.k.a REST is an architectural style as well as an approach for communications purpose that is often used in various web services development.

The architectural style of REST helps in leveraging the lesser use of bandwidth to make an application more suitable for the internet. It is often regarded as the “language of the internet” and is completely based on the resources.

 Now that you know what it is, let us move on and understand the need for REST API.

Need of REST API
Consider a scenario where you are using the Book My Show app. Now, obviously, this application needs a lot of Input data, as the data present in the application is never static. Either it is movies getting released on a frequent basis, or various cities showing different languages movies at various times of the day. It’s never static which implies the fact that data is always changing in these applications.

Now, where do you think we get this data from?

Well, this data is received from the Server or most commonly known as a Web-server. So, the client requests the server for the required information, via an API, and then, the server sends a response to the client.

Over here, the response sent to the client is in the form of an HTML Web Page. But, do you think this is an apt response that you would expect when you send a request?

Well, I am assuming the fact that you would say NO. Since,  you would prefer the data to be returned in the form of a structured format, rather than the complete Web page.

So, for such reasons, the data returned by the server, in response to the request of the client is either in the format of JSON or XML. Both JSON and XML formats have a proper hierarchical structure of data.

Now, this sounds quite simple, right?

But, the only issue which is present in this framework until now is that you have to use a lot of methods to get the required information. To the fact, using these methods to retrieve information, becomes quite cumbersome when you require complex data.

So, this is where REST API comes into the picture. The REST API creates an object, and thereafter sends the values of an object in response to the client. It breaks down a transaction in order to create small modules. Now, each of these modules is used to address a specific part of the transaction. This approach provides more flexibility but requires a lot of effort to be built from the very scratch.


Moving ahead, let us take a look at the Principles of REST API.

Principles of REST API

Well, there are six ground principles laid down by Dr. Fielding who was the one to define the REST API design in 2000. Below are the six guiding principles of REST:

Stateless
The requests sent from a client to a server will contain all the required information to make the server understand the requests sent from the client. This can be either a part of URL,  query-string parameters, body, or even headers. The URL is used to uniquely identify the resource and the body holds the state of the requesting resource. Once the server processes the request, a response is sent to the client through body, status or headers

Client-Server
The client-server architecture enables a uniform interface and separates clients from the servers.  This enhances the portability across multiple platforms as well as the scalability of the server components.

Uniform Interface
To obtain the uniformity throughout the application, REST has the following four interface constraints:

Resource identification
Resource Manipulation using representations
Self-descriptive messages
Hypermedia as the engine of application state
Cacheable
In order to provide a better performance, the applications are often made cacheable. This is done by labeling the response from the server as cacheable or non-cacheable either implicitly or explicitly. If the response is defined as cacheable, then the client cache can reuse the response data for equivalent responses in the future.

Layered system
The layered system architecture allows an application to be more stable by limiting component behavior.  This type of architecture helps in enhancing the application’s security as components in each layer cannot interact beyond the next immediate layer they are in. Also, it enables load balancing and provides shared caches for promoting scalability.

Code on demand

This is an optional constraint and is used the least. It permits a clients code or applets to be downloaded and to be used within the application. In essence, it simplifies the clients by creating a smart application which doesn’t rely on its own code structure.

Now, that you know the principles behind REST API, next let’s look into the Methods of REST API.

Methods of REST API
All of us working with the technology of the web, do CRUD operations. When I say CRUD operations, I mean that we create a resource, read a resource, update a resource and delete a resource. Now, to do these actions, you can actually use the HTTP methods, which are nothing but the REST API Methods. Refer below.

CRUD Operations - What is REST API - Edureka

Now that you know what is a REST API and what all you need to mind in order to deliver an efficient application, let’s dive deeper and see the process of building REST API.

How to create a REST API?
In this practical demonstration, I will be creating a simple CRUD REST application using Node.js. To build this application, you will need to install the following:

Node.js

Express.js

Joi

nodemon (Node Monitor)

To know, how to install Node.js, you can refer to the article on Installation of Node.js.

For this hands-on, I will be using the WebStorm IDE to write and execute the codes. You can use any IDE or code editor according to your choice. So, let’s get started.

Step 1: Create a project directory, which will consist of all the files present in the project. Then, open commands prompt and navigate to the project directory. Refer below.


========================================
activerecord scopes
========================================

Scopes are custom queries that you define inside your Rails models with the scope method. Every scope takes two arguments: A name, which you use to call this scope in your code. A lambda, which implements the query.

Adds a class method for retrieving and querying objects. The method is intended to return an ActiveRecord::Relation object, which is composable with other scopes. If it returns nil or false, an all scope is returned instead.

A scope represents a narrowing of a database query, such as where(color: :red).select('shirts.*').includes(:washing_instructions).

class Shirt < ActiveRecord::Base
  scope :red, -> { where(color: 'red') }
  scope :dry_clean_only, -> { joins(:washing_instructions).where('washing_instructions.dry_clean_only = ?', true) }
end

The above calls to scope define class methods Shirt.red and Shirt.dry_clean_only. Shirt.red, in effect, represents the query Shirt.where(color: 'red').

A named scope is simply a class method inside of your model that always returns an active record association.


Imagine this application: we have a database of shirts and we want to return all of the shirts that are red. We can do it the following ways:

Both the scope and the method create a very basic filter to simply return all the shirts that are red. In the controller, we can query all of the red shirts by calling one of the methods:

==============How is a scope different from a class method?
Named scopes are really great for two things: Chaining and Readability;
===Chaining====
A scope returns an object relation — which means that even if there are no results, it will not return nil but rather an empty array. Which means that you can string multiple scopes together without worrying about checking for nil, like this:
Article.published.featured.latest_article
======Readability=====
Scopes can be written in just one line. As your application scales, they are a great way to keep your model dry. Think of it as writing a ternary operator instead of an if-statement with multiple lines. Their use is what separates a new programmer from a more experienced developer.
scope :recent, -> { order(:created_at, :desc) }


==========================================
eager loading and lazy loading
==========================================

Eager Loading

One way to improve performance is to cut down on the number of SQL queries. You can do this through eager loading.

User.find(:all, :include => :friends)
Here you are firing only two queries :

1) One for all users.

2) One for all friends of users .

Pro: is that everything's ready to go.

Con: you are using up space/memory.

Lazy Loading :

When you have an object associated with many objects like a User has many Friends and you want to display a list as in Orkut you fire as many queries as there are friends, plus one for the object itself.

users = User.find(:all)
Then query for each user friend , like :

users.each do |user|
  friend = Friend.find_by_user_id(user.id)
end
Here

1) One query for all users.

2) N query for N no. of users friends .

Pro of lazy loading: you don't hit the database until you need to.

Con: You'll be hitting the database N + 1 times.....unless you select exactly the column you want


========================================================
N+1 query
========================================================
#Articles model
class Article < ActiveRecord::Base
  belongs_to :author
end

#Authors model
class Author < ActiveRecord::Base
  has_many :posts
end


#In our controller
@recent_articles = Article.order(published_at: :desc).limit(5)

#in our view file
@recent_articles.each do |article|
    Title: <%= article.title %>
    Author:<%= article.author.name %>
end

Article Load (0.9ms) SELECT 'articles'.* FROM 'articles'
Author Load (0.4ms) SELECT 'authors'.* FROM 'authors' WHERE 'authors'.'id' = ? ORDER BY 'authors'.'id' ASC LIMIT 1 [["id", 1]]
Author Load (0.3ms) SELECT 'authors'.* FROM 'authors' WHERE 'authors'.'id' = ? ORDER BY 'authors'.'id' ASC LIMIT 1 [["id", 2]]
Author Load (0.4ms) SELECT 'authors'.* FROM 'authors' WHERE 'authors'.'id' = ? ORDER BY 'authors'.'id' ASC LIMIT 1 [["id", 3]]
Author Load (0.3ms) SELECT 'authors'.* FROM 'authors' WHERE 'authors'.'id' = ? ORDER BY 'authors'.'id' ASC LIMIT 1 [["id", 4]]
Author Load (0.4ms) SELECT 'authors'.* FROM 'authors' WHERE 'authors'.'id' = ? ORDER BY 'authors'.'id' ASC LIMIT 1 [["id", 5]]

In Rails, ActiveRecord has a method called includes, which ensures that all the associated datas specified are loaded with the minimum number of queries.

#In our controller
#Using includes(:authors) will include authors model.
@recent_articles = Article.order(published_at: :desc).includes(:authors).limit(5)

#in our view file
@recent_articles.each do |article|
    Title: <%= article.title %>
    Author:<%= article.author.name %>
end

Article Load (0.4ms) SELECT 'articles'.* FROM 'articles'
Author Load (0.4ms) SELECT 'authors'.* FROM 'authors' WHERE 'authors'.'id' IN (1,2,3,4,5)


========================================================
includes vs joins
========================================================
Includes uses eager loading whereas joins uses lazy loading. Both are used when certain operations are meant to be performed on associated tables.

Here, we retrieved users in the first line and data is formatted in the each do loop. Here is interesting thing, to retrieve user.company.name, each time a call to database is made. It means, if there are 10k users then 10k separate queries would be fired up.
And this will overkill system when scaled up. Isn’t there is efficient way? Yes, it is Includes.

INCLUDES
If we go through Rails documenting, it clearly says — ‘With includes, Active Record ensures that all of the specified associations are loaded using the minimum possible number of queries’. When we need data to be used from associated tables, includes must be used.

Here, the data from table companies is fetched right in the first line, as it says includes companies. No additional query is fired from the do loop for ‘user.company.name’. Size of users table does not matter now(unless you are not talking about very large dataset that needs efficient data structure as well). It is scalable to any size.



============================================================
Inner joins vs Left outer Joins
============================================================

Assuming you’re joining on columns with no duplicates, which is by far the most common case:

An inner join of A and B gives the result of A intersect B, i.e. the inner part of a venn diagram intersection.
An outer join of A and B gives the results of A union B, i.e. the outer parts of a venn diagram union.
Examples

Suppose you have two Tables, with a single column each, and data as follows:

A    B
-    -
1    3
2    4
3    5
4    6
Note that (1,2) are unique to A, (3,4) are common, and (5,6) are unique to B.

Inner join

An inner join using either of the equivalent queries gives the intersection of the two tables, i.e. the two rows they have in common.

select * from a INNER JOIN b on a.a = b.b;
select a.*,b.*  from a,b where a.a = b.b;

a | b
--+--
3 | 3
4 | 4
Left outer join

A left outer join will give all rows in A, plus any common rows in B.

select * from a LEFT OUTER JOIN b on a.a = b.b;
select a.*,b.*  from a,b where a.a = b.b(+);

a |  b
--+-----
1 | null
2 | null
3 |    3
4 |    4
Full outer join

A full outer join will give you the union of A and B, i.e. All the rows in A and all the rows in B. If something in A doesn’t have a corresponding datum in B, then the B portion is null, and vice versa.

select * from a FULL OUTER JOIN b on a.a = b.b;

 a   |  b
-----+-----
   1 | null
   2 | null
   3 |    3
   4 |    4
null |    6
null |    5

==============================
rails concerns
==============================
So I found it out by myself. It is actually a pretty simple but powerful concept. It has to do with code reuse as in the example below. Basically, the idea is to extract common and / or context specific chunks of code in order to clean up the models and avoid them getting too fat and messy.

example
Consider a Article model, a Event model and a Comment model. An article or an event has many comments. A comment belongs to either Article or Event.

Skin-nizing Fat Models.



==============================
rails helpers
==============================
Basically helpers in Rails are used to extract complex logic out of the view so that you can organize your code better. I’ve seen two benefits for using helpers in my experience so far:

Extract some complexity out of the view
Make view logic easier to test
Let me explain each one of those points.

Helpers contain methods to be used in views.

=================================
Lib folder
=================================
The /lib folder, as the name implies it, is meant to contain libraries. We both know that in Ruby, libraries are packaged as gems 90% of the time (I love to make up statistics). So what is this folder supposed to be used for then? Well, it’s not complicated. It’s for libraries that are not packaged as gems but could be.

Now that you know what to put inside the /app folder, you also know what to put in /lib. All the generic logic you create to do some calculations, transform images or deal with authorization (don’t re-create though, use CanCanCan).

It doesn’t have to be just ruby classes. It can be models, controllers and views as long as it’s generic enough. Now you can put them inside an engine, give it a cool name, package it as a gem and share it with your friends. Congratz!

Once in a while, you should clean up your /lib folder. You should be able to extract a bunch of stuff from there and package them as gems. Note that you don’t necessarily have to. I understand that extracting code means another project to maintain and update. It’s a nice way to give back to the community though.

=========================
Action Cable
=========================
Action Cable seamlessly integrates WebSockets with the rest of your Rails application. It allows for real-time features to be written in Ruby in the same style and form as the rest of your Rails application, while still being performant and scalable. It's a full-stack offering that provides both a client-side JavaScript framework and a server-side Ruby framework. You have access to your full domain model written with Active Record or your ORM of choice.

===================
Asset pipeline
===================
1 What is the Asset Pipeline?
The asset pipeline provides a framework to concatenate and minify or compress JavaScript and CSS assets. It also adds the ability to write these assets in other languages and pre-processors such as CoffeeScript, Sass, and ERB. It allows assets in your application to be automatically combined with assets from other gems.

The asset pipeline is implemented by the sprockets-rails gem, and is enabled by default. You can disable it while creating a new application by passing the --skip-sprockets option.

rails new appname --skip-sprockets
Rails automatically adds the sass-rails gem to your Gemfile, which is used by Sprockets for asset compression:

gem 'sass-rails'
Using the --skip-sprockets option will prevent Rails from adding them to your Gemfile, so if you later want to enable the asset pipeline you will have to add those gems to your Gemfile. Also, creating an application with the --skip-sprockets option will generate a slightly different config/application.rb file, with a require statement for the sprockets railtie that is commented-out. You will have to remove the comment operator on that line to later enable the asset pipeline:

# require "sprockets/railtie"
To set asset compression methods, set the appropriate configuration options in production.rb - config.assets.css_compressor for your CSS and config.assets.js_compressor for your JavaScript:

config.assets.css_compressor = :yui
config.assets.js_compressor = :uglifier

===============================
STI
==============================
1. What is STI(Single Table Inheritance)?

> STI won't work without a "type" field in the table.

> In Single-Table Inheritance (STI), many subclasses inherit from one superclass with all the data in the same table in the database. The superclass has a “type” column to determine which subclass an object belongs to.

> A great way to know when STI is appropriate is when your models have shared data/state. Shared behavior is optional.

Ex. Vehicle being the super class. Car, Bicycle and Motorcycle are subclasses inherit from Vehicle class whose data is in the vehicles table in the database with type column.

STI PROS:

Simple to implement
DRY — saves replicated code using inheritance and shared attributes
Allows subclasses to have own behavior as necessary

STI CONS:

Doesn’t scale well: as data grows, table can become large and possibly difficult to maintain/query
Requires care when adding new models or model fields that deviate from the shared fields
(conditional) Allows creation of invalid objects if validations are not in place
(conditional) Can be difficult to validate or query if many null values exist in table


====================================
getter and setter
====================================
4. How would you create getter and setter methods in Ruby?

a) By defining the setter & getter methods which would be called using the object of the class.

class Vehicle
  def initialize(name, color)
    @name = name
    @color = color
  end
  def color=(new_color)
      @color = new_color
  end
  def color
    @color
  end
end
vehicle = Vehicle.new("Hyundai","white")
vehicle.color = "Blue"

b) By using the attr_reader & attr_writer methods given by ruby which automatically creates the setter & getter methods for us

class VehicleNew
  attr_reader :color
  attr_writer :color
  def initialize(name, color)
    @name = name
    @color = color
  end
end
vehicle = VehicleNew.new("Maruti","white")
vehicle.color = "Red"

c) By using attr_accessor which provides both setter & getter methods automatically. It is equivalent of using attr_reader & attr_writer

class VehicleNew1
  attr_accessor :color
  def initialize(name, color)
    @name = name
    @color = color
  end
end
vehicle = VehicleNew1.new("Mahindra","white")
vehicle.color = "Black"


==========================================
Singleton class
==========================================

6. What is singleton class?

>It is a special class for which there can only exist one instance at anytime.

What is Singleton method?

https://www.ruby-lang.org/en/documentation/faq/8/

https://www.ruby-lang.org/en/documentation/faq/7/#singleton-method

> A Singleton method is a method that is defined only for a single object.

> When you declare a singleton method on an object, Ruby automatically creates a class just to hold that method. This class is called the 'metaclass' of the object. All subsequent singleton methods of this object goes to its metaclass. Whenever you send a message to the object, it first looks to see whether the method exists in its metaclass. If it is not there, it gets propagated to the actual class of the object and if it is not found there, the message traverses the inheritance hierarchy.

I.e. Meta Class => Class of object => Parent Class(if present) => Object Class

A singleton method is an instance method associated with one specific object.

You create a singleton method by including the object in the definition:

class Foo; end

foo = Foo.new
bar = Foo.new

def foo.hello
  puts "Hello"
end

foo.hello

=> Hello

bar.hello

=> NoMethodError: undefined method `hello' for #<Foo:0x007fd0a17d9078>

Singleton methods are useful when you want to add a method to an object and creating a new subclass is not appropriate.


class MySig
include Singleton
  def run
   @run ||= 0
   @run += 1
  end
end

> s1 = MySig.new
NoMethodError: private method `new' called for MySig:Class

> s1 = MySig.instance
=> #<MySig:0x007efcf0a14048>

> s2 = MySig.instance
=> #<MySig:0x007efcf0a14048>


=============================================================
variables
=============================================================
> A variable prefixed with two at signs (@@) is a class variable, accessible within both instance and class methods of the class.

> A class variable (@@) is shared among the class and all of its descendants. I.e. class variables are shared between a class and all its subclasses.

> An instance variable (@) is not shared by the class's descendants.

> Class instance variables(An instance variables) are directly accessible only within class methods of the defining class. i.e class instance variables only belong to one specific class and not subclasses.

Class variable (@@)

Let's have a class Foo with a class variable @@i, and accessors for reading and writing @@i.


================
Database performance
================

How do you improve the database performance?

> a. Adding indexes
   b. Query Optimization
   c. Avoiding Dynamic finder methods ex. Find_by, find_by_name, etc
   > Because each one needs to run through method_missing and parse the filename against the list of columns in database table.
   d. Eager loading

   ===========================
   extend vs include
   ============================
    > include: mixes in specified module methods as instance methods in the target class

    > extend: mixes in specified module methods as class methods in the target class


========================
rails security
=======================
Ruby on Rails Security Checklist:
Always check unauthorized access.
Use authentication practices.
Make it a point to filter passwords and other sensitive data logs.
Use strong parameters to whitelist the values that can be used.
Fix the number of throttling requests per minute.
Use HTTPs for pages that deal with sensitive information.
Use tools like a static analysis security vulnerability scanner for Rails applications.


============================================================
Polymorphic and STI
============================================================

===========STI=====================
Sometimes, you have models that share some common attributes but also have a few different ones. STI is one of Rails’ provisions for such situations.
In an STI setup, you have a model that is parent(or super) to other models. This parent model must contain a field named type with no default value needed. The type field automatically stores the name of the child model(subclass) to which the record belongs. Taking our citizen example:
# migration file to add field type to citizen
def change
 add_column :citizens, :type, :string
end
# app/models/citizen.rb
class Citizen < ApplicationRecord
  self.abstract_class = true # remove this line for STI
  ...
end
# app/models/electorate.rb
class Electorate < Citizen
  ...
end
# app/models/candidate.rb
class Candidate < Citizen
  ...
end
Example
>> c = Candidate.create
>> c.type
=> "Candidate"
>> Citizen.first
=> #<Candidate:0x231456...>
In this case, the electorate and candidate models do not need to have underlying tables. The only table needed is the citizens table. As seen in the example above, for all subclasses, Rails automatically figures out the model to which a record belongs.
Since all subclasses share the same table, you cannot have the same attribute on two subclasses with different datatypes. As the STI table gets bigger and bigger, it might have too many null fields. Fields that exist only on a subclass would be null for other subclasses. There are other pros and cons of STIs but that could be a discussion for another time.

=================Polymorphic Associations============================
There are situations where you have a model that belongs_to more than one other model. Rails provides polymorphic associations for this use case, where the belonging model has an association name that by convention has an able postfix. This model should have two fields that describe the id and type(class) of the associating record— ending in _id and _type. The association can be seen as an interface that this model exposes to other models. Let’s take a look at a Vote model for our citizen example.
# migration file for votes
def change
  create_table :votes do |t|
    ...
    t.references :votable, polymorphic: true, index: true
    ...
  end
end
# app/models/vote.rb
class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  ...
end
# app/models/electorate.rb
class Electorate < ApplicationRecord
  has_many :votes, as: :votable
  ...
end
# app/models/candidate.rb
class Candidate < ApplicationRecord
  has_many :votes, as: :votable
  ...
end
Example
>> c = Candidate.create
>> c.votes
>> [#<Vote:0x0003437fdd79a91d0 id:1, votable_type: "Candidate", votable_id: 1...>]
>> v = Vote.first
>> v.votable
>> #<Candidate:0x02332fed3903e id:1, ...>
The association works on both — the belongs_to and the has_many — sides, taking advantage of the id and the type columns.
Rails and Active Record provide some security by ensuring that the type and id of the record saved on a polymorphic model represent an actual record that belongs to this relationship chain. However, if someone has access to your database, they can create orphan records because polymorphic associations don’t have the foreign key constraint of a typical belongs_to association.



====================
SQL injection
====================

What is a SQL Injection Vulnerability?
SQL Injection is a web application vulnerability that occurs when untrusted data is inserted in a SQL query without any sanitization or escaping. Since databases play a core role in today's web applications, being able to manipulate SQL queries and therefore control the database usually result with the compromise of the target web application's data, or even a complete takeover of the application itself via elevation of the SQL Injection to some sort of remote code execution vulnerability.

Read What is SQL Injection and refer to the SQL Injection cheat sheet for more detailed technical information and examples of the SQL Injection vulnerability.


Preventing SQL Injections When Developing Web Applications with Ruby on Rails?

Use Dynamic Attribute-Based Finders When Possible
When finding/retrieving information from the database, dynamic attribute-based finders should be used to avoid SQL Injection vulnerabilities. These work as parameterized queries and take care of the passed argument. Let's illustrate the point with an example:

User.find_by(name: params[:name]) # Traditional

User.find_by_name(name) # dynamic finder

The find_by method used in the first line can be vulnerable to SQL Injection if not used carefully. In our example, we made sure this is not the case by passing the column name and value explicitly. But on the second line, which uses dynamic finders, didn't really required anything rather than calling the method itself. Active Record knows that the argument is not a column or a table name and added to the SQL query with proper escaping.


Never Pass a String as an Argument Unless It Is a Dynamic Finder
First of all, it is really important to know exactly what the AR method expects as arguments. Some methods accept arguments in multiple forms and accept different formats. This works fine if the input is an integer, but the same method will be vulnerable to SQL Injection when called with a string.

There are many methods that will usually require external input to work with in the Active Record, especially under ActiveRecord::FinderMethods, and ActiveRecord::QueryMethods. User input should not be passed as it is, but rather should be encapsulated in a form that prevents modifying the SQL query. If a string is passed, that would generally be interpreted as Active Record, as an intent to add a fragment to the SQL query.

Let's look at the ActiveRecord::QueryMethods::WhereChain::where method which does the filtering based on the conditions specified in the arguments. This method accepts conditions in several different formats such as string, array, or hash, and goes to the WHERE-part of an SQL statement. If we simply pass user_input directly to this method, this would create a very basic type of SQL Injection because when a string is passed, it will be added to the query as a SQL fragment and providing such opportunity will make attackers really happy! Let's illustrate the point with an example:

User.where("name = '#{params[:name]'") # SQL Injection!

If this particular line of code invoked with name = 'fff', the resulting query will be:

SELECT "users".* FROM "users" WHERE (name = 'fff')
=> #<ActiveRecord::Relation []>

But if it is set to "' OR 1='1":

SELECT "users".* FROM "users" WHERE (name = ' ' OR '1'='1')
=> #<ActiveRecord::Relation [#<User id: 1, name:'jack', …….>]>

As seen above, the attack is the successful inclusion of an OR operator which helped us return all the records from database. More advanced queries could easily be crafted from this point onward. Let's take a look at the injection-proof version.

User.where(["name = ?", "#{params[:name]}"])

SQL Injection is not possible when using the above, because the first element of the array is a template and the latters are parameters to that template.

User.where({ name: params[:name] })

Again, this is free from SQL Injection, because column name is set explicitly to the 'name' and the external input set to the value of it.



===================
Map vs Each
===================
Ruby Map vs Each
What is the difference between map & each?

Each is like a more primitive version of map…

It gives you every element so you can work with it, but it doesn’t collect the results.

Each always returns the original, unchanged object.

While map does the same thing, but…

It returns a new array with the transformed elements.

Example:

array.each { |n| n * 2 }
# [1, 2, 3]
array.map { |n| n * 2 }
# [2, 4, 6]
Ruby Map vs Collect
Map and Collect are exactly the same method.

They are different names for the same thing!

Which one should you use?

If you read open-source projects you’ll find that the most common version is map.

Use that.


====================
Routes
====================
What is Rails Router?
A router in Rails is a directing module that recognizes browser URLs and dispatches them to the controller actions requested. To make it simple, when you enter a url in your domain, the rails router will know which controller and action to handle your url


In the diagram above, a request made by a user to the URL /pages/home goes through the browser to the Rails Router(first blue box above). The router then decides that the request be handled by the pages_controller at the same time being particular on the controller action as home. The controller now renders back HTML to the user as a response.
This answers our next question…Where does users request go? Lets get this right. The Rails application asks the router to match the users request to a corresponding controller action. Rails app’s routes are configured in config/routes.rb. In the above diagram, the matching route is:

================
Rails ORM
================
ORM is Object Relational Mapper. It means you don't have to manually call the database yourself; the ORM handles it for you.

Ruby on Rails uses one called ActiveRecord

ORM allows you to do things such as:

User.find(50).contacts
Instead of manually writing a SELECT statement with JOINs, WHEREs, etc.

ORM stands for Object-Relational-Mapping. It basically means that Active Record takes data which is stored in a database table using rows and columns, which needs to be modified or retrieved by writing SQL statements (if you're using a SQL database), and it lets you interact with that data as though it was a normal Ruby object.

> Represent models and their data.
> Represent associations between these models.
> Represent inheritance hierarchies through related models.
> Validate models before they get persisted to the database.
> Perform database operations in an object-oriented fashion.


==============
Active Record
==============
ActiveRecord is a Ruby library for working with Relational SQL Databases like MySQL and Postgres. It provides an Object Relational Mapping (ORM) with these core features:

a single Ruby object maps to a database table
columns are accessed by methods, and are inferred from the database schema
methods for create, read, update, and delete (CRUD) are defined
a DSL for easily constructing SQL queries in Ruby

The library was started by David Heinemeier Hansson (DHH) as part of of the Rails web framework. It is based on the "Active Record" pattern described in Martin Fowler's book "Patterns of Enterprise Application Architecture". Around the time of authorship DHH was contributing design pattern diagrams to Martin's Catalog of Patterns of Enterprise Application Architecture

It is interesting to note that there are several database patterns other than "Active Record" that may be more suitable for larger codebases. For example: the Data Mapper pattern.

One of the critiques of the Active Record pattern is that is mixes business logic and persistence layer logic. There is significant debate in the Rails and wider Ruby community about this. These issues become relevant around 10k lines of code in a Rails project.


==========================
active model
==========================



==========================
coc
==========================
In Rails, you find yourself looking at controllers, views, and models for your database.

To reduce the need for heavy configuration, Rails implements rules to ease up working with the application. You may define your own rules but for the beginning (and for later on) it's a good idea to stick to conventions that Rails offers.

These conventions will speed up development, keep your code concise and readable, and allow you an easy navigation inside your application.

Conventions also lower the barriers to entry for beginners. There are so many conventions in Rails that a beginner doesn’t even need to know about, but can just benefit from in ignorance. It’s possible to create great applications without knowing why everything is the way it is.

For Example

If you have a database table called orders with the primary key id, the matching model is called order and the controller that handles all the logic is named orders_controller. The view is split in different actions: if the controller has a new and edit action, there is also a new and edit view.

For Example

To create an app you simply run rails new app_name. This will generate roughly 70 files and folders that comprise the infrastructure and foundation for your Rails app.

It includes:

Folders to hold your models (database layer), controllers, and views
Folders to hold unit tests for your application
Folders to hold your web assets like Javascript and CSS files
Default files for HTTP 400 responses (i.e. file not found)
Many others


===========================================================
What is the difference between render and redirect?
===========================================================

-Redirect is a method that is used to issue the error message in case the page is not found or it issues a 302 to the browser. Whereas, render is a method used to create the content.

-Redirect is used to tell the browser to issue a new request. Whereas, render only works in case the controller is being set up properly with the variables that needs to be rendered.

-Redirect is used when the user needs to redirect its response to some other page or URL. Whereas, render method renders a page and generate a code of 200.

-Redirect is used as:
redirect_to: controller => ‘users’, :action => ‘new’

-Render is used as:
render: partial
render: new -> this will call the template named as new.rhtml without the need of redirecting it to the new action.


=================================================
DIFFERENCE BETWEEN MAP, SELECT, COLLECT, INJECT, DETECT AND EACH IN RUBY
=================================================
1) Map
Map takes the enumerable object and a block, evaluates the block for each element and then return a new array with the calculated values.

[1,2,3,4,5,6,7,8,9,10].map{ |e| e * 5 }

# =>  [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
If you are try to use map to select any specific values like where e <= 3 then it will evaluate each element and will output only the result which will be either true or false

[1,2,3,4,5,6,7,8,9,10].map{ |e| e <= 3 }

# =>  [true, true, true, false, false, false, false, false, false, false]
2) Select
Select evaluates the block with each element for which the block returns true.

[1,2,3,4,5,6,7,8,9,10].select{ |e| e > 5 }

# =>  [6 ,7, 8, 9, 10]
and also, select would return a element for which the statement is true.

[1,2,3,4,5,6,7,8,9,10].select{ |e| e * 3 }

# => [1,2,3,4,5,6,7,8,9,10]
3) Collect
Collect is similar to Map which takes the enumerable object and a block, evaluates the block for each element and then return a new array with the calculated values.

[1,2,3,4,5,6,7,8,9,10].collect{ |e| e * 5 }

# =>  [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
If you are try to use collect to select any specific values like where n <= 3 then it will evaluate each element and will output only the result which will be either true or false

[1,2,3,4,5,6,7,8,9,10].collect{ |e| e <= 3 }

# =>  [true, true, true, false, false, false, false, false, false, false]
4) Each
Each will evaluate the block with each array and will return the original array not the calculated one.

[1,2,3,4,5,6,7,8,9,10].each{ |e| print "#{e}!" e * 3 }

1!2!3!4!5!6!7!8!9!10! => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
If you are try to use each to select any specific values like where e <= 3 then it will evaluate each element but returns the original array

[1,2,3,4,5,6,7,8,9,10].each{ |e| e <= 3 }

# => [1,2,3,4,5,6,7,8,9,10]
5) Inject
Takes an accumulator (sum) and changes it as many times as there are elements in the array. Returns the final value of the accumulator.
If you do not explicitly specify an initial value for accumlator, then uses the first element of collection is used as the initial value of accumulator.

[1,2,3,4,5,6,7,8,9,10].inject{ |sum, e| sum += e }
# => 55

[1,2,3,4,5,6,7,8,9,10].inject(15){ |sum, e| sum += e }
# => 70
6) Detect
Detect is equal to select.first, as simple as that. Detect evaluates the block with each element for which the block returns true, but gives back only the first element as the result.

[1,2,3,4,5,6,7,8,9,10].detect{ |e| e > 5 }

# => 6
and also, detect would return the first element for which the statement is true.

[1,2,3,4,5,6,7,8,9,10].detect{ |e| e * 3 }

# => 1

==============================================================================
Pluck Vs Map/Collect Vs Select
==============================================================================
https://rubyinrails.com/2014/06/05/rails-pluck-vs-select-map-collect/


==============================================================================
Ruby open class
==============================================================================
In Ruby, classes are never closed: you can always add methods to an existing class. This applies to the classes you write as well as the standard, built-in classes. All you have to do is open up a class definition for an existing class, and the new contents you specify will be added to whatever's there.

==============================================================================
Access Specifiers
==============================================================================

Public methods can be called by everyone - no access control is enforced. A class's instance methods (these do not belong only to one object; instead, every instance of the class can call them) are public by default; anyone can call them. The initialize method is always private.

Protected methods can be invoked only by objects of the defining class and its subclasses. Access is kept within the family. However, usage of protected is limited.

Private methods cannot be called with an explicit receiver - the receiver is always self. This means that private methods can be called only in the context of the current object; you cannot invoke another object's private methods.

class ClassAccess
  def m1          # this method is public
  end
  protected
    def m2        # this method is protected
    end
  private
    def m3        # this method is private
    end
end
ca = ClassAccess.new
ca.m1

class Person
  def initialize(age)
    @age = age
  end
  def age
    @age
  end
  def compare_age(c)
    if c.age > age
      "The other object's age is bigger."
    else
      "The other object's age is the same or smaller."
    end
  end
  protected :age
end

chris = Person.new(25)
marcos = Person.new(34)
puts chris.compare_age(marcos)
#puts chris.age


============================
Ruby self
============================
At every point when your program is running, there is one and only one self - the current or default object accessible to you in your program. You can tell which object self represents by following a small set of rules.

The class of the main object is Object.

# p063xself1.rb
class S
  puts 'Just started class S'
  puts self
  module M
    puts 'Nested module S::M'
    puts self
  end
  puts 'Back in the outer level of S'
  puts self
end
The output is:

>ruby p063xself1.rb
Just started class S
S
Nested module S::M
S::M
Back in the outer level of S
S
>Exit code: 0



======================================
Singleton
======================================
A singleton class of an object (or a class) is a class created by Ruby only for this specific object. This class is somehow “hidden” to us, but it is there. When calling a method on this object, Ruby will look first into its singleton class, if there is one, to find that method.


car = Vehicle.new(20_000)
def car.start
  puts "starting..."
end


enum
ORM
active model vs active record
eager loading
active model
redis vs mysql
what is the use of redis
multi threading
activerecored
websocket
redis with active user session count
data structure in Ruby
call back sequence in rails
ensure block
dynamic scafolding / static sacffolding
sidekiq server

JWT token


Post.joins(:comments).group('posts.id').having('count(comments.id) > ?', 1)


HTTP codes

observer
define methodes eval
call and send
mail intercepter
call backs



rails observer



====================================
ruby define methods
=====================================
The usual way of defining new methods is to put your intended logic between def & end. And that works perfectly fine for the most part.


class Doctor
  define_method("perform_rhinoplasty") do |argument|
    "performing rhinoplasty on #{argument}"
  end

  define_method("perform_checkup") do |argument|
    "performing checkup on #{argument}"
  end

  define_method("perform_interpretive_dance") do |argument|
    "performing interpretive dance on #{argument}"
  end
end

doctor = Doctor.new
puts doctor.perform_rhinoplasty("nose")
puts doctor.perform_checkup("throat")
puts doctor.perform_interpretive_dance("in da club")


The real power of define_method is realised when we realise we call it like any other code. Here's an example where we call it inside a loop and it achieves the same result as above.


class Doctor
  ["rhinoplasty", "checkup", "interpretive_dance"].each do |action|
    define_method("perform_#{action}") do |argument|
      "performing #{action.gsub('_', ' ')} on #{argument}"
    end
  end
end

doctor = Doctor.new
puts doctor.perform_rhinoplasty("nose")
puts doctor.perform_checkup("throat")
puts doctor.perform_interpretive_dance("in da club")


===================
ruby eval
=============================================
class Demo
  def initialize
    @zen = 42
  end
end

m = Demo.new
puts m.instance_eval("@zen")

Here's how you can use instance_eval to get access to your class' object data. Instance variables are created when you create a new instance from your class.


We learned about eval and its ideas in the last lesson. instance_eval is a similar method on the Object class that takes in Ruby code embedded in a string and two other optional arguments.

One of the major differences between eval and instance_eval is that with instance_eval you have the choice of explicitly handling the context of self. As instance_eval is a method on Object it is scoped by the object you specify.


HABTM VS through
========================
As far as I can remember, has_and_belongs_to_many gives you a simple lookup table which references your two models.

For example,

Stories can belong to many categories. Categories can have many stories.

Categories_Stories Table
story_id | category_id
has_many :through gives you a third model which can be used to store various other pieces of information which don't belong to either of the original models.

For example

Person can subscribe to many magazines. Magazines can have many subscribers.

Thus, we can have a subscription model in the middle, which gives us a similar table to the earlier example, but with additional properties.

Subscriptions Table
person_id | magazine_id | subscription_type | subscription_length | subscription_date
And so on.




=================================
Rails Routes
=================================
2.2 CRUD, Verbs, and Actions
In Rails, a resourceful route provides a mapping between HTTP verbs and URLs to controller actions. By convention, each action also maps to a specific CRUD operation in a database. A single entry in the routing file, such as:

resources :photos
creates seven different routes in your application, all mapping to the Photos controller:

HTTP Verb Path  Controller#Action Used for
GET /photos photos#index  display a list of all photos
GET /photos/new photos#new  return an HTML form for creating a new photo
POST  /photos photos#create create a new photo
GET /photos/:id photos#show display a specific photo
GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
PATCH/PUT /photos/:id photos#update update a specific photo
DELETE  /photos/:id photos#destroy  delete a specific photo


2.5 Singular Resources
Sometimes, you have a resource that clients always look up without referencing an ID. For example, you would like /profile to always show the profile of the currently logged in user. In this case, you can use a singular resource to map /profile (rather than /profile/:id) to the show action:

get 'profile', to: 'users#show'
Passing a String to to: will expect a controller#action format. When using a Symbol, the to: option should be replaced with action:. When using a String without a #, the to: option should be replaced with controller::

get 'profile', action: :show, controller: 'users'
This resourceful route:

resource :geocoder
resolve('Geocoder') { [:geocoder] }
creates six different routes in your application, all mapping to the Geocoders controller:

HTTP Verb Path  Controller#Action Used for
GET /geocoder/new geocoders#new return an HTML form for creating the geocoder
POST  /geocoder geocoders#create  create the new geocoder
GET /geocoder geocoders#show  display the one and only geocoder resource
GET /geocoder/edit  geocoders#edit  return an HTML form for editing the geocoder
PATCH/PUT /geocoder geocoders#update  update the one and only geocoder resource
DELETE  /geocoder geocoders#destroy delete the geocoder resource
Because you might want to use the same controller for a singular route (/account) and a plural route (/accounts/45), singular resources map to plural controllers. So that, for example, resource :photo and resources :photos creates both singular and plural routes that map to the same controller (PhotosController).

3.2 Dynamic Segments
You can set up as many dynamic segments within a regular route as you like. Any segment will be available to the action as part of params. If you set up this route:

get 'photos/:id/:user_id', to: 'photos#show'
An incoming path of /photos/1/2 will be dispatched to the show action of the PhotosController. params[:id] will be "1", and params[:user_id] will be "2".

==================================
7.1 Intercepting Emails
==================================
Interceptors allow you to make modifications to emails before they are handed off to the delivery agents. An interceptor class must implement the :delivering_email(message) method which will be called before the email is sent.

class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.to = ['sandbox@example.com']
  end
end
Before the interceptor can do its job you need to register it with the Action Mailer framework. You can do this in an initializer file config/initializers/sandbox_email_interceptor.rb

if Rails.env.staging?
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end
The example above uses a custom environment called "staging" for a production like server but for testing purposes. You can read Creating Rails environments for more information about custom Rails environments.




module Utils
  def welcome
    puts 'hello'
  end

  def self.welcome
   puts 'hi'
  end
end


class A
  extend Utils
end

a = A.new
a.welcome => ‘hello’
A.welcome => ‘hi’



a.welcome => A.welcome => ‘hello’


super/super method
======================
When you call super with no arguments, Ruby sends a message to the parent of the current object, asking it to invoke a method with the same name as where you called super from, along with the arguments that were passed to that method.

On the other hand, when called with super(), it sends no arguments to the parent.

If the arguments you have don't match what the parent is expecting, then I would say you would want to use super(), or explicitly list parameters in the functional call to match a valid parent constructor.


monkey patching

filters parameters
========================

rails User logins test cases
================================
1 Verify if a user will be able to login with a valid username and valid password.  Positive
2 Verify if a user cannot login with a valid username and an invalid password.  Negative
3 Verify the login page for both, when the field is blank and Submit button is clicked. Negative
4 Verify the ‘Forgot Password’ functionality. Positive
5 Verify the messages for invalid login.  Positive
6 Verify the ‘Remember Me’ functionality. Positive
7 Verify if the data in password field is either visible as asterisk or bullet signs. Positive
8 Verify if a user is able to login with a new password only after he/she has changed the password. Positive
9 Verify if the login page allows to log in simultaneously with different credentials in a different browser. Positive
10  Verify if the ‘Enter’ key of the keyboard is working correctly on the login page. Positive
Other Test Cases
11  Verify the time taken to log in with a valid username and password. Performance & Positive Testing
12  Verify if the font, text color, and color coding of the Login page is as per the standard.  UI Testing & Positive Testing
13  Verify if there is a ‘Cancel’ button available to erase the entered text. Usability Testing
14  Verify the login page and all its controls in different browsers  Browser Compatibility & Positive Testing.


================================
Rails Application Server vs Web Server
================================
A web server accepts and fulfills requests from clients for static content (i.e., HTML pages, files, images, and videos) from a website. Web servers handle HTTP requests and responses only.

An application server exposes business logic to the clients, which generates dynamic content. It is a software framework that transforms data to provide the specialized functionality offered by a business, service, or application. Application servers enhance the interactive parts of a website that can appear differently depending on the context of the request.


Web Server
Deliver static content.
Content is delivered using the HTTP protocol only.

Serves only web-based applications.
No support for multi-threading.

Facilitates web traffic that is not very resource intensive.


Application Server

Delivers dynamic content.
Provides business logic to application programs using several protocols (including HTTP).
Can serve web and enterprise-based applications.
Uses multi-threading to support multiple requests in parallel.
Facilitates longer running processes that are very resource-intensive​.


A server is a central repository where information and computer programs are held and accessed by the programmer within the network. Web server and Application server are kinds of the server which employed to deliver sites and therefore the latter deals with application operations performed between users and back-end business applications of the organization.

Web Server: It is a computer program that accepts the request for data and sends the specified documents. Web server may be a computer where the online content is kept. Essentially internet server is employed to host sites however there exist different web servers conjointly like recreation, storage, FTP, email, etc.

Example of Web Servers:

Apache Tomcat
Resin


Application server: It encompasses Web container as well as EJB container. Application servers organize the run atmosphere for enterprises applications. Application server may be a reasonably server that mean how to put operating system, hosting the applications and services for users, IT services and organizations. In this, user interface similarly as protocol and RPC/RMI protocols are used.


Examples of Application Server:
  Weblogic
  JBoss
  Websphere

Difference between web server and application server:

S.NO  WEB SERVER  APPLICATION SERVER
1.  Web server encompasses web container only.  While application server encompasses Web container as well as EJB container.
2.  Web server is useful or fitted for static content.  Whereas application server is fitted for dynamic content.
3.  Web server consumes or utilizes less resources. While application server utilize more resources.
4.  Web servers arrange the run environment for web applications. While application servers arrange the run environment for enterprises applications.
5.  In web servers, multithreading is not supported.  While in application server, multithreading is supported.
6.  Web server’s capacity is lower than application server. While application server’s capacity is higher than web server.
7.  In web server, HTML and HTTP protocols are used.  While in this, GUI as well as HTTP and RPC/RMI protocols are used.





========================
Rails Sidekiq Gem
========================
In your application you have application tasks that should be performed asynchronously. Like Processing data, sending batch emails, or interacting with external APIs are all examples of work that can be done asynchronously with background jobs. Using background jobs can improve your application’s performance by offloading potentially time-consuming tasks to a background processing queue, freeing up the original request/response cycle.

Sidekiq is one of the more widely used background job frameworks that you can implement in a Rails application. It is backed by Redis, an in-memory key-value store known for its flexibility and performance. Sidekiq uses Redis as a job management store to process thousands of jobs per second.

example -
  - Product creation in Bulk using excel file
  - The removal production in Bulk
  - cleanup all user Data


========================
Rails
========================
Rails CSRF
Includes and Joins
eager loading lazy loading
prepend
Rails Session Management
SQL JOINS
Rails Version Fetures
JWT
Devise Gem
CanCanCan GEM
How to Handle Request(How to secure request)
HABTM and many to many associations
Helpers and concerns
AJAX in Rails

========================
Rails Session Management
========================

what is session?
------------------------

Cookies and Sessions are used to store information. Cookies are only stored on the client-side machine, while sessions get stored on the client as well as a server.

Session
------------------------
A session creates a file in a temporary directory on the server where registered session variables and their values are stored. This data will be available to all pages on the site during that visit.

A session ends when the user closes the browser or after leaving the site, the server will terminate the session after a predetermined period of time, commonly 30 minutes duration.

Cookies
------------------------
Cookies are text files stored on the client computer and they are kept of use tracking purpose. Server script sends a set of cookies to the browser. For example name, age, or identification number etc. The browser stores this information on a local machine for future use.

When next time browser sends any request to web server then it sends those cookies information to the server and server uses that information to identify the user.

Difference
------------------------
-Cookies are client-side files that contain user information, whereas Sessions are server-side files that contain user information.
-Cookie is not dependent on session, but Session is dependent on Cookie.
-Cookie expires depending on the lifetime you set for it, while a Session ends when a user closes his/her browser.
-The maximum cookie size is 4KB whereas in session, you can store as much data as you like.
-Cookie does not have a function named unsetcookie() while in Session you can use Session_destroy(); which is used to destroy all registered data or to unset some

Cookie Vs. Session
------------------------
Cookies are client-side files that contain user information
Sessions are server-side files which contain user information
Cookie ends depending on the lifetime you set for it
A session ends when a user closes his browser
You don't need to start cookie as it is stored in your local machine
In PHP, before using $_SESSION, you have to write session_start(); Likewise for other languages
The official maximum cookie size is 4KB
Within-session you can store as much data as you like. The only limits you can reach is the maximum memory a script can consume at one time, which is 128MB by default
A cookie is not dependent on Session
A session is dependent on Cookie
There is no function named unsetcookie()
Session_destroy(); is used to destroy all registered data or to unset some

Rails example
------------------------
rails g model User email password_digest

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end

class User < ApplicationRecord
  has_secure_password
end


This method is going to tell the user model that that password digest field needs to be encrypted.

Let’s also add a validation that ensures that every User has an email value and that every email is unique this will update the file to look like this:

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
end


class SessionsController < ApplicationController
  def create
    user = User
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end

module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end




Rails CSRF
========================

What is CSRF?

CSRF (Cross-Site Request Forgery) is a method of attack that “works by including malicious code or a link in a page that accesses a web application the user is believed to have authenticated. If the session for that web application has not timed out, an attacker may execute unauthorized commands.” (Cross-Site Request Forgery (CSRF))

The idea is that because a user remains “signed in” even after leaving a site, a “black hat” site can make requests to the signed in site as if it was the user.

example-
Bob browses a message board and views a post from a hacker where there is a crafted HTML image element. The element references a command in Bob’s project management application, rather than an image file: <img src="http://www.webapp.com/project/1/destroy">

Bob’s session at www.webapp.com is still alive, because he didn’t log out a few minutes ago.

By viewing the post, the browser finds an image tag. It tries to load the suspected image from www.webapp.com. As explained before, it will also send along the cookie with the valid session ID.

The web application at www.webapp.com verifies the user information in the corresponding session hash and destroys the project with the ID 1. It then returns a result page which is an unexpected result for the browser, so it will not display the image.

Bob doesn’t notice the attack - but a few days later he finds out that project number one is gone.

Rails JWT
====================================



What Is a JWT Token?

Prathap Givantha Kalansuriya user avatar by Prathap Givantha Kalansuriya · Jan. 24, 20 · Security Zone · Presentation

 Like (9)

  Comment (1)

 Save



A JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed. JWTs can be signed using a secret or a public/private key pair.

What Is the JSON Web Token Structure?

Header

Payload

Signature

Header

The header typically consists of two parts: the type of token, which is JWT, and the hashing algorithm that is used, such as HMAC SHA256 or RSA.

For example:

1
{
2
  "alg": "HS256",
3
  "typ": "JWT"
4
}


Then, this JSON is Base64Url-encoded to form the first part of the JWT.

Payload
The second part of the token is the payload, which contains the claims. Claims are statements about an entity.

Registered claims: These are a set of predefined claims which are not mandatory but recommended, to provide a set of useful, interoperable claims.  refer this for more info Registered Claim Names

Public claims: These can be defined at will by those using JWTs. But to avoid collisions they should be defined

Private claims: These are the custom claims created to share information between parties that agree on using them and are neither registered or public claims.

An example payload is shown below:

1
{
2
  "sub": "1234567890",
3
  "name": "John Doe",
4
  "admin": true
5
}


Signature
To create the signature part, you have to take the encoded header, the encoded payload, a secret, the algorithm specified in the header, and sign that.

1
HMACSHA256(
2
  base64UrlEncode(header) + "." +
3
  base64UrlEncode(payload),
4
  secret)


Then, you have to put it all together. The following shows a JWT that has the previous header and payload encoded, and it is signed with a secret.

Encoded JWT




encora company questions
====================================================================
what you done most challenging task on your project - performance issues(removed n number of queries)
explain the project
present? vs presence
removed nil value form array and Hash(compact)
action dispatcher
presenter, decorator, partials, and helpers
self referncial model rails
how to secure Rails App
difference betn rails versions
post has many comments
find post which not having comment
Type of injection attacks?
What's the difference between event.stopPropagation and event.preventDefault?(related to JS)
submit you form without submit button(Rails)
counter cache
which design patterns you have used?
what is Agile Development process?
what is delegates in rails

1) what you done most challenging task on your project
ans - In my last company A system where there was huge chunks of redundant code in an outdated format no use of helpers, concerns, partials. There are many models which having fatty, and Business logic had written in Controllers. Most complex logic had written in controller and views also. according to rails style guide So I have refactor the project by moving which code is many times used in many models that common code had moved to Concerns and those concerns had includeded in required model to make model skinny, Written helpers for reusable code and moved redundant code which used in many views and moved that code in helpers. And in view there are common details show code has written many times so that code has moved to Partials and that partails had reused. I have used Rule of thumb: your controller actions should be no more than 5–7 lines of code. so all business logic which code written in Controller I have moved that code in model level. Not used action filters or intantiate objects unless it needed.

2)Action Dispatch in rails
 - Action Dispatch routes requests to controllers.Action Controller converts requests into responses.
 - It parses information about the web request, handles routing as defined by the user, and does advanced processing related to HTTP such as MIME-type negotiation, decoding parameters in POST, PATCH, or PUT bodies, handling HTTP caching logic, cookies and sessions.
 - Dispatcher is a small class which is responsible for instantiating the controller and passing along our request, along with an empty response object. It’s invoked when a suitable route is identified for a request. It has no knowledge about how a request arrived on its doorstep, but it knows what to do when it sees our request: instantiate the UsersController and hand it our request. As we’ll see, it acts as an object factory for our controllers, removing the need for us to declare our controller classes anywhere outside of the classes themselves.
 -Dispatcher is our entry point back into Rails land. It knows that a request is served by a controller, and it knows that the way to talk to a Rails controller is to send it a #dispatch method and pass along the action, the request object, and a fresh new ActionDispatch::Response object to write the response into.

 3)Presenter, Decorator, Partials, helpers?
 * Presenter - - presenters is a design pattern commonly reffered to as Model View Presenter(MVP)
               - This is a derivation of the Model View Controller pattern and is used for creating user interfaces.
               - It's useful for the Separation of Concerns for making code more DRY.
               - Presenters are simple classes that sit between the model and the view and provide provide a nice, DRY object oriented way of working with complex display logic.
               - In Rails, the convention is for them to be located in the app/presenters folder
               - Presenters are kind of like helpers in the sense that they are getting some data ready for the view, except helpers usually serve as utility methods for said views, while presenters are more about presenting the actual attributes.
               so for example you wnt to show some data on UI then write Presenter according to controller and in that present fetch data from Model with writing some specific method accroding to your requirement and that presenter class only intialize from your controller action and use methods which have written in presenter in your views to show the data.

* Decorators - ‘In object-oriented programming, the decorator pattern is a design pattern that allows
                behavior to be added to an individual object, dynamically, without affecting the behavior of other objects from the same class.’

                Well this is one way we use this pattern in our rails app. Idea is that you want to stop using model as go to place for every single method you need especially methods you mostly use on view.
                example is method "full_name" which need to show concatenate of "first_name" and "last_name"
                so create on folder as decorators in app directory. create one method in base helper as name as decorate call the decorator class dynamically from it using contantize method then create base decorators and call that decorate method from it and inherit all decorator class from it and use full_name method in your views dynamically.

* helpers -     A helper is a method that is (mostly) used in your Rails views to share reusable code.
                it includes utility methods which are commonly used in views. like format of full name of user.
                Use helpers if you're working in a view (template) and you need to build a complex bit of HTML such as a <table>. Or, if you want to change some presentation data that's not connected to the database.

* Partials -     Partial templates (partials) are a way of breaking the rendering process into more manageable
                chunks.
                Partials allow you to extract pieces of code from your templates to separate files and also reuse them throughout your templates.


4) Self Referentials Model(self joins)
    class Person < ActiveRecord::Base
      belongs_to :parent, :class_name => 'Person'
      has_many :children, :class_name => 'Person', :foreign_key => 'parent_id'
    end

5)



UtilizeCore questions
1) instance variable and class variables
2) What is SaaS
3) what is filters?
4) ActiveRecord Callbacks
5) override method in subclass but wat to call parent class method (super)


puresoftware
=====================================
after_commit vs after_save
sidekiq
assciations in rails
sidekiq
size vs length
filters


tringaapps
==================================
foreign key vs primary key?
RESTful vs REST
span vs div
abstraction
2nd highest salary

string and integer array
return only array of integer
arr = ["shubham", 1, 10, "Amit", "rakesh", 15]
output will be [1,10,15]
def get_integer_array(arr)
  arr.select!{|e| e.is_a?(Integer)}
end
arr = [3,6,9,2,1,0,7,22]
array combination of 2 values divisible by number
number = 3
output [3,0], [6,0], [3,6], [9,6], [3,9], [9,0]
def get_combinations(arr)
  arr.each do |element|
  if (element % n == 0)
    combination << element
  end
end
end
n = 3
arr = [3,6,9,2,1,0,7,22]
combination = []
arr.each do |element|
  if (element % n == 0)
    combination << element
  end
end
combination.each do |element|
  arr <<
end
Employee
Salary
2nd highest salary


Tech9
====================================
1)  MonkeyPatching
2)  Ducktyping
3)  when use class and module
4)  SOLID Design Principles in Ruby
5)  Associations in Applications usages
6)  Rails MVC applications
7)  application server vs Web Server
8)  Asyncronus process(Sidekiq)
9)  Rails 3, Rails 4, Rails 5, Rails 6 features
10) Indexes, Foreign key, Primary Key, horizontal scaling, vertical scaling, Database Sharding
11) what kind of language ruby
12) everything is ruby is an object, explain this
13) method lookup path in ruby


Monkey-Patching
===============
Dynamic modification to class means add or overwrite existing methods runtime. Importance of this is patch buggy class and make its method behave in a manner to solve desired purpose.
Reopening code in this way is often known as monkey patching. We can modify or extend any existing class at runtime, even built in classes like strings and arrays.

basic properties of Monkey Patch:
-If multiple libraries have the same method, the first one will get overwritten.

example
puts "hello shubham".reverse # => mahbuhs olleh

# Apply patching
class String
  def reverse
    "Reversing blocked!!"
  end
end

# After applying patching
puts "Hello shubham" # => "Reversing blocked!!"


Duck-typing
===========
This can be achieved in dynamic type language, here we can pass 2 different types of object which has methods with the same name but can execute different behavior according to requirement. Here we don’t have to check kind_of?

after_create vs after_commit
===================================================================
after_create
This is called after ActiveRecord::Base.save is called on new objects that haven’t been saved yet (meaning that no record exists in the database)

after_save
This is the same thing as after_create but is called whether the object is a new or an existing record in the database.

after_commit
This is called after the database transaction has completed.
---->
the part about after_commit “after the database transaction has completed” for after_commit is important because this will determine whether you will prefer after_commit vs the after_create or after_save. Basically what this means is that after_create or after_save can still run before the changes are actually saved to the database, meaning the database can raise an error if the data you want to commit to the database violates your database constraints (like a uniqueness constraint violation). Thus, in certain situations where you want to work with data that you are sure that has been written to the database, after_commit is preferable to after_create or after_save.

Ruby Method Lookup Path
===============================================
String -> [String, Comparable, Object, Kernel, BasicObject]
[<YourClass>, Object, Kernel, BasicObject]

Ruby Garbage Collection
=======================


Nitor
===========================
1)Garbage Collection in Ruby
2)Rails callbacks vs Observer

Rails callbacks vs Observer
============================
- Rails observers: these are same as callbacks but are used when the method is not directly associated to the life cycle of the object. It lives for a longer duration of time and can be attached or detached at any time.

- Rails callback: the callback methods can only be called at only certain points of time in the life cycle of an object like validation, creation, updating, deletion, etc. Unlike the rails observers, the rails callback lives for only a short period of time.

Rails counter caches ActiveRecord
==================================
Instead of counting the associated records in the database every time the page loads,ActiveRecord’s counter caching feature allows storing the counter and updating it every time an associated object is created or removed.

<% @articles.each do |article| %>
<article>
  <h1><%= article.title %></h1>
  <p><%= article.description %></p>
  <%= article.responses.size %> responses
</article>
<% end %>

N+1 query fired on database
Article Load (0.2ms)  SELECT "articles".* FROM "articles"
  ↳ app/views/articles/index.html.erb:3
  (0.2ms)  SELECT COUNT(*) FROM "responses" WHERE "responses"."article_id" = ?  [["article_id", 2]]
  ↳ app/views/articles/index.html.erb:7
  (0.3ms)  SELECT COUNT(*) FROM "responses" WHERE "responses"."article_id" = ?  [["article_id", 3]]
  ↳ app/views/articles/index.html.erb:7

You can avoid that using joins
@articles = Article.
      joins(:responses).
      select("articles.*", 'COUNT("responses.id") AS responses_count').
      group('articles.id')


class Article
  has_many :responses
end

class Response
  belongs_to :article, counter_cache: true
end

Instead of counting the number of responses every time the articles are displayed, a counter cache keeps a separate response counter which is stored in each article’s database row. The counter updates whenever a response is added or removed.
This allows the article index to render with one database query, without needing to join the responses in the query.
This requires a field to the Article model named responses_count. The counter_cache option makes sure the number in that field automatically updates whenever a response is added or removed.

We need to create a new column in our database to store the count.


Rails size vs count
===================
#size, as #count will always do a COUNT query, while #size will skip the query if the responses are already loaded.

-Main Comapanies
================
1)  Coupa
2)  Talentica
3)  GoJek
4)  ThaughtWorks
5)  AirBnb
6)  here
7)  Pattern
8)  Dassault
