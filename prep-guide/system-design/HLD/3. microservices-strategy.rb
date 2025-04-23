# what is monolith application?
# when all the logic of the application is in a single codebase then we say that the application is a monolith.

# disadvantages of monolith application
  # 1. overloads IDE
  # 2. scaling is hard
  # 3. code is tightly coupled. so it has impact on the whole codebase.
  # 4. deployment is hard. if you want to deploy a single service then you have to deploy the whole codebase.

# advantages of monolith application
  # It is fast to develop.
  # It is budget friendly

# what is microservices application?
  # When the application is divided into multiple services and each service is responsible for a single functionality then we say that the application is a microservices

  # all the disadvantages of monolith application are the advantages of microservices application.
  # disadvantages of microservices application:
    # It is hard to develop, maintain if not handled properly.
    # It is expensive and complicated
    # It brings latency, and difficult to debug and monitor.
    # Transaction management is hard.


#* Patterns in microservices

 1.** Decomposition **: If we want to break/decompose the monolith application into microservices then we have to decompose the application
    so there we can decompose application by:
    1. Decompose by business capability
          1. for order management system we can have:
            1. order service
            2. payment service
            3. inventory service
            4. shipping service
            5. notification service
            6. user service
    2. Decompose by sub domain
        decompose by domain and domain further decompose by microservices

 2. **Database per service**: Each microservice should have its own database. This is to ensure that the microservices are loosely coupled and can be developed, deployed, and scaled independently. This also allows for different databases to be used for different microservices, depending on their specific needs.
