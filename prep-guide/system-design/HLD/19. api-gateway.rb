# what is an API Gateway?
  # >>  API Gateway is the service which routes the traffic to the correct micro-service.
  # >> load balancer is the server which equally distributes the traffic among the server

# consider the scenario:
  # - We are running a application where we want to list our products.
  # - Now for mobile we show limited information since mobile device are slower and have less bandwidth.
  # - But for desktops we show more information and other stuffs. so here someone must be there to take the decision so API Gateway comes into the picture.

      #                                    -------------> Product System
      #  client -------------> API Gateway -------------> Invoice System
      #                                    -------------> Rating and Review System
      #                                    -------------> Recommendation System

  #  - Features of API Gateway
  #     - API Composition (eg given above)
  #     - Authentication (used in OAuth)
  #     - Rate limiting
  #     - Service Discovery:
            # since microservices keeps on scale up or down. Or it register or de register itself so there must be someone to keep track of them
            # service discovery plays the role here

# If API Gateway is the single entry point then how it handles millions of requests?
  # > before understanding the api gateway structure first look at AZ (availability zone)

    #  client ------------->  API Gateway -------------> Load Balancer -------------> Service
    #                            |
    #                            |
    #                            v
    #                         service discovery
                    #     |-----------------------| availability zone |-----------------------|

  # >> now understand this that for every small region like (mumbai, pune) etc we have availability zone
  # >> and we have also replica of the availability zone.

  #                                               -----> region 1
  #                           +-----> api gateway -----> region 1 (copy)
  #                           |
  #                           |
  # client -----> |DNS| ----->|
  #                           |
  #                           |
  #                           +-----> api gateway -----> region 2
  #                                                      region 2 (copy)

  # here DNS has DNS based load balancing which has the API gateway IP so it distributes the load at its level
