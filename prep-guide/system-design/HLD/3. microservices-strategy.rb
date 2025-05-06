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


# ------------------------------------------
      # Database in microservice:
        # 1. database per service: each microservice has its own database
        # 2. shared database: all microservices share the same database

      # database per service:
      #     1. here the scaling is an issue.
      #     2. We can easily join the data and retrieve the data from the database.
      #     3. we can easily maintain the ACID properties.

      # shared database:
      #     1. here the scaling is not an issue.
      #     2. Here we can't easily maintain the ACID properties. but this issue is solved by SAGA pattern.
      #     3. we can't easily join the data and retrieve the data from the database. this issue is solved by CQRS pattern.
# ------------------------------------------


# Decomposing the microservices patterns:
  1. Strangler pattern:
      We use strangler pattern if we want to refactoring to microservice
        Consider the below diagram:

            # monolith-----------+---------------microservices
            #                    |
            #                 controller (it decides which service to call by % of traffic)
            #                    |
            #                   traffic

#  Here controller decides which service to call by % of traffic.
#      We are in transition phase and controller decides which service to call either monolith or microservice based on the % of traffic

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

  2. SAGA pattern (sequence of local transactions):
      There are two types of SAGA pattern:
        1. Choreography based SAGA
        2. Orchestration based SAGA

  #* Choreography based SAGA:
    # In this pattern, the control flow is defined by the services themselves.

        # service 1 --------> service 2 --------> service 3 --------> service 4
        # |            |            |            |                       |
          # --------------------------------------------------------------
                      # Success Queue            Failure Queue

    # consider the below scenario:
        # service 1 creates an order then it updates the data in the local database and publish the event in the success queue.
        # service 2 listens to the success queue and updates the data in the local database.
        # service 3 listens to the success queue and updates the data in the local database. (but the service 3 fails) then it adds the message in the failure queue.
        # service 4 listens to the failure and do not updates the data in the local database.
        # service 3 listens to the failure queue and revert the data in the local database.
        # service 2 listens to the failure queue and revert the data in the local database.
        # service 1 listens to the failure queue and revert the data in the local database.

  #* Orchestration based SAGA:
    # In this pattern, the control flow is defined by the orchestrator.

        # #              --------> service 1
        #   orchestrator --------> service 2
        #                --------> service 3
        #                --------> service 4

    # Here orchestrator is responsible for the control flow.
    # consider the below scenario:
      # orchestrator will call service 1 and wait for the response.
      # if service 1 fails then orchestrator will not call service 2
      # if service 1 succeeds then orchestrator will call service 2 and wait for the response. and go on like this.

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

  3. CQRS pattern(Command Query Responsibility Segregation):
    # CQRS is a pattern that separates the read and write operations for a data store. and we use this pattern to solve the issue of joins in the database.

    # consider the below scenario:

                        #  service 1 -> database 1                            service 2 -> database 2
                        #               |                                        |
                        #               ------------------------------------------
                        #                           <event queues>
                        #                                |
                        #                           view database

          #  Here we simply do the write operation (create, update, delete) in local databases and all read operation in view database.
          #  Here we can't do the write operation in view database.

    # service 1 does all operation in local database and publish the event in the event queue. same for service 2
    # based on the event queue view database updates and create, update, deletes the data in own database and all the read operation in view database.
