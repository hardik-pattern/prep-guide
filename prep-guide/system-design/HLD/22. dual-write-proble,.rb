# dual write problem comes when component needs to persist a change between database and messaging queue
  # eg: consider we are using SAGA pattern
  #   : our service makes the change in database and failed to publish the event
  #   : or service published the event but the changes made in the database rollbacks

# There are some pattern to solve the dual write pattern
  #* - Transactional Outbox Pattern
      # In this pattern instead of writing in both DB and publishing the event. We create a transaction and do the operation of inserting the data in the table and also one more write operation of adding event in the separate table
      # If incase one of them is failed other get rollbacks
      # and there is one polling service which continuously polls the event from the event table and publish it to the queue

  #* - Listen ti yourself
      # In this pattern we don't write to database instead we write event to the database.
      # then asyncronously we write to the database and publish the event using poller

  #* - Transactional log tailing pattern
      # Here we listen to the database logs and based on the logs we publish the events
