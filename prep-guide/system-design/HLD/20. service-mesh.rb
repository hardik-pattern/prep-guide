# How microservices communicates with each other?
# to answer this question one must understands that what are the things we need to make them communicate
    # - Service Discovery: If 2 micro services wants to communicate they need IP and port of each other.
    # - Load Balancing- Since microservices could have multiple instances running so in order to know which one to pick based on load we need microservice level load balancing
    # - Authorization- In order to communicate the request must be valid and authorized so we need authentication and authorization.
    # - Circuit Breaker- If we call microservice 2 from 1 10 times and all 10 request failed so there should be a mechanism which will cut down the call for particular amount of time so this comes through circuit breaker
    # - Retry capabilities- microservice should retry the request for 5xx status code.
    # - Deployment Strategy- we need to support the deployment Strategy like canary, blue green etc
    # - Telemetry capabilities- it means an analysis that which API is getting how much traffic query timeout etc


# Do we have any better solution? answer is service mesh
# take example of kubernetes:
  #                                                                                                                          +----------------------+                  +------------------------+
  #                                                                                                                          |                      |                  |                        |
  # service discovery              +-----------> Application Load Balancer-------->        Pod 1                             |                      |                  | configuration manager  |
  #        ^                       |                                                        {micro service instance -1} ---> | sidecar proxies      |                  |                        |
  #        |                       |                                                        {micro service instance -2} ---> | sidecar proxies      |                  | traffic controller     |
  #        |                       |                                                                                         |                      |                  |                        |
  #    API Gateway---------------->|                                                                                         |                      |                  | security manager       |
  #                                |                                                                                         |                      |----------------->|                        |
  #                                |                                                                                         |                      |                  | Telemetry              |
  #                                |                                                                                         |                      |                  |                        |
  #                                +-----------> Application Load Balancer-------->        Pod 1                             |                      |                  |                        |
  #                                                                                         {micro service instance -1} ---> | sidecar proxies      |                  |                        |
  #                                                                                         {micro service instance -2} ---> | sidecar proxies      |                  |                        |
  #                                                                                         {micro service instance -3} ---> | sidecar proxies      |                  |                        |
  #                                                                                       Pod -2, Pod 3.....                 |                      |                  |                        |
  #                                                                                                                          |                      |                  |                        |
  #                                                                                                                          +----------------------+                  +------------------------+
  #                                                                                                                               data plane                                   control plane
