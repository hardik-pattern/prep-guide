# High availability architecture is also known as
  # - data resiliency architecture
  # - design architecture to support 99.99% availability.
  # - design single point of failure architecture.
  # - active passive vs active active architecture.

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Active Passive Datacenter. (in active passive datacenter only one database is Primary and rest all are replica or secondary database incase of failure secondary is promoted to Primary database)
#                           client
#                             |
#                             |
#                             v
#                        load balancer
#             +--------------+--------------+
#             |                             |
#       Data Center 1                    Data Center 2 (disaster recovery datacenter)
#            |                              |
#       Primary Database<-------------------+
#            |
#            |
#            v
#  Secondary Database / replica database

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Active Active Datacenter: Here we have database for each datacenter which are primary and we utilize them completely they are synced in background
#                           client
#                             |
#                             |
#                             v
#                        load balancer
#             +--------------+--------------+
#             |                             |
#       Data Center 1                    Data Center 2 (disaster recovery datacenter)
#            |                              |
#       Primary Database -1              Primary Database -2
            #  +----------------------------->+ (both are synced)
            #  +<-----------------------------+
