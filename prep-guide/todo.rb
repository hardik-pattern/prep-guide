# Learn about action cable
# Learn about turbo-rails
# Multi-tenancy in Rails (e.g., Apartment gem, schema-based vs. row-based approach)
# Rails Scalability (Horizontal vs. Vertical Scaling, Caching Strategies, Load Balancing)
# Microservices & Rails API (When to split a monolith, inter-service communication)
# Advanced ActiveRecord Optimizations (Bulk inserts, Query Caching, Arel)
# Security in Rails (SQL Injection, Mass Assignment, JWT Authentication)
# Concurrency & Background Jobs (Sidekiq best practices, race conditions)
# Performance Tuning (Profiling with Bullet, Rack Middleware, DB indexing)


# : What is the difference between optimistic and pessimistic locking in Rails?
# > In a multi-user environment, two users might try to update the same record at the same time. This can cause data conflicts.
    # To prevent conflicts, Rails provides two types of   locking:
      # Optimistic Locking (default in Rails) using lock_version
      # Pessimistic Locking (manual implementation)

    # Optimistic Locking
      # order1 = Order.find(1) # User A loads Order
      # order2 = Order.find(1) # User B loads the same Order

      # order1.update!(status: "shipped") # Success! Updates `lock_version`
      # order2.update!(status: "delivered") # Fails! lock_version has changed.

    # Pessimistic Locking
      # Order.transaction do
      #   order = Order.lock.find(1) # Locks the row
      #   order.update!(status: "shipped") # Others must wait
      # end
#






SOLID Principle:
Single Responsibility Principle (SRP): A class or module should have only one reason to change, meaning it should have a single, well-defined responsibility.

Open/Closed Principle (OCP): Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.

Liskov Substitution Principle (LSP): Subtypes should be substitutable for their base types without altering the correctness of the program.

Interface Segregation Principle (ISP): Clients should not be forced to depend on methods they do not use. Interfaces should be small and focused, with clients depending only on the methods they need.

Dependency Inversion Principle (DIP): High-level modules should not depend on low-level modules. Both should depend on abstractions (interfaces or abstract classes). Abstractions should not depend on details. Details (concrete classes) should depend on abstractions.



Single Responsibility Principle (SRP):  A class should have only one reason to change.

# Wrong implementation

class User
  def initialize(name)
    @name = name
  end

  def save
    puts "Saving user to database..."
  end

  def send_email
    puts "Sending email to #{@name}..."
  end
end

Problem:
  This class handles both data and business logic (saving + sending emails).
  Violates SRP because it has more than one reason to change.

# Fix:

class User
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class UserRepository
  def save(user)
    puts "Saving user to database..."
  end
end

class EmailService
  def send_email(user)
    puts "Sending email to #{user.name}..."
  end
end

# User – Data only.
# UserRepository – Handles persistence.
# EmailService – Handles communication.


2. Open/Closed Principle (OCP): A class should be open for extension but closed for modification.
                              You should add new functionality without modifying existing code.

#  Bad Example: Every time you add a new notification type, you modify the class.

class Notification
  def send(type, message)
    if type == "email"
      puts "Sending Email: #{message}"
    elsif type == "sms"
      puts "Sending SMS: #{message}"
    end
  end
end

class Notification
  def send(message)
    raise NotImplementedError, "Subclasses must implement `send`"
  end
end

class EmailNotification < Notification
  def send(message)
    puts "Sending Email: #{message}"
  end
end

class SMSNotification < Notification
  def send(message)
    puts "Sending SMS: #{message}"
  end
end


3. Liskov Substitution Principle (LSP):
  # Subclasses should be able to replace parent classes without affecting functionality.
  #   The child class should behave like the parent class.

# Wrong: Penguin violates LSP because it breaks the expected behavior of Bird.

class Bird
  def fly
    puts "Flying"
  end
end

class Penguin < Bird
  def fly
    raise "Penguins can't fly!"
  end
end

bird = Penguin.new
bird.fly # ❌ Breaks behavior!

Fix:
class Bird
  def move
    puts "Moving"
  end
end

class FlyingBird < Bird
  def fly
    puts "Flying"
  end
end

class Penguin < Bird
  def swim
    puts "Swimming"
  end
end

bird = FlyingBird.new
bird.fly # ✅ Works

penguin = Penguin.new
penguin.swim # ✅ Works without breaking behavior


Interface Segregation Principle (ISP): A class should not be forced to implement methods it does not use.

# Problem: Robot is forced to implement eat, which it doesn’t need.

class Worker
  def work
    puts "Working"
  end

  def eat
    puts "Eating"
  end
end

class Robot < Worker
  def eat
    raise "Robots don't eat!"
  end
end


#  Fixed Example:
module Workable
  def work
    puts "Working"
  end
end

module Eatable
  def eat
    puts "Eating"
  end
end

class Human
  include Workable
  include Eatable
end

class Robot
  include Workable
end

# Dependency Inversion Principle (DIP):  High-level modules should depend on abstractions, not concrete implementations.

# Problem: User class depends on EmailService directly — hard to test or replace.

class EmailService
  def send_email
    puts "Sending email"
  end
end

class User
  def notify
    EmailService.new.send_email
  end
end


# Fix: User depends on an abstraction (send_notification) — easy to switch services.

class User
  def initialize(notification_service)
    @notification_service = notification_service
  end

  def notify
    @notification_service.send_notification
  end
end

class EmailService
  def send_notification
    puts "Sending email"
  end
end

email_service = EmailService.new
user = User.new(email_service)
user.notify

