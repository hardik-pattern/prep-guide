# idempotency vs concurrency
  # idempotency: It enable client to solely retry an operation without worrying sideeffect that operation can cause.

> by default get, put, delete are idempotent in nature and post is not. and we have to make it idempotent.

How duplicate can come?

# sequential:
    # client                      server
    #   |        post               |
    #   +-------------------------->| (server starts process)
    #   |       <timeout>           |   .
    #   |                           |   .
    #   |                           |   .
    #   |        retry              |  (server process completed)
    #   +-------------------------->|
    #   +-------------------------->| {this is duplicate request we have to handle this}
    #   |                           |


# parallel:
    # client                      server
    #   |        post               |
    #   +-------------------------->| (server starts process)
    #   +-------------------------->| (two same request comes at same time)
    #   |                           |   we should handle this scenario
    #   |                           |
    #   |                           |
    #   |                           |

> approach for handling idempotency
  # 1. client should generate the idempotency key.
  # 2. for each operation idempotency key should be unique

    # flow for sequential request:
      #  1. client should generate the idempotency key
      #  2. client will store this idempotency key in the request header
      #  3. server will validate that this idempotency key is present if not present it will throw error
      #  4. server will read this idempotency key from DB. if found it will return 200 status code
      #  5. if server does not found the key, then it will store the key in DB. create the record and return 201 success code.

    # flow for parallel request:
      #  1. if both request comes parallel. server will read the idempotency key
      #  2. here server will lock the table as it is a critical section using MUTEX, SEAMPHORE etc.
      #  3. this helps the server to achieve mutual exclusion
