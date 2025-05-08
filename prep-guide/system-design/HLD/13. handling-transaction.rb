# Transaction handing in Distributed System
# What is transaction? >> A set of operations which perform against the DB are called transaction.
  # Example:
  # 1. Transfer money from one account to another account.
  # 2. Transfer money from one account to another account and update the balance of the account.
  # 3. Transfer money from one account to another account and update the balance of the account and send the email to the user.

# It follows ACID properties:
  # 1. Atomicity: All operations should be performed successfully or not at all.
  # 2. Consistency: DB should be in a consistent state before and after the transaction.
  # 3. Isolation: If multiple transactions are running concurrently, they should be isolated from each other.
  # 4. Durability: If transaction is failed, data should not lost.

# We can achieve the transaction in single database by many ways like implementing locking or using BEGIN_TRANSACTION, COMMIT, ROLLBACK.

# But in distributed system, it is very difficult to achieve the transaction. since the transaction is performed against the multiple databases.
  To handle this we have 3 ways to handle this situation

  # 1. 2 phase commit: used a lot
  # 2. 3 phase commit it is not used a lot because of its complexity
  # 3. SAGA pattern: used a lot in microservices architecture

# ------------------------------------------------------------------------------------------------
# 2 phase commit:
  # 1. Prepare: Coordinator sends the prepare message to all the participants.
  # 2. Commit: Coordinator sends the commit message to all the participants.
  # 3. Rollback: Coordinator sends the rollback message to all the participants.


# STEP 1: Application request to coordinator to start the transaction.
# STEP 2: Coordinator sends the prepare message to all the participants.
# STEP 3: Participants acquire the lock and make the changes in db.
# STEP 4: Participants send the ok message to the coordinator.
# STEP 5: Coordinator sends the commit message to all the participants.
# STEP 6: Participants commit the changes in db.
# STEP 7: Application get the response from the coordinator.


# IDEAL SCENARIO:

# Application                             Transaction Coordinator                   Participant(Order Service)                     Participant(Inventory Service)
# |                                        |                                          |                                          |
# |     participate in operation           |                                          |                                          |
# |--------------------------------------->|                                          |                                          |
# |                                        |                                          |                                          |
# |                                        |      sends prepare message               |                                          |
# |                                        |----------------------------------------->|                                          |
# |                                        |------------------------------------------------------------------------------------>| (at this point participants acquires the lock and makes the changes in db )
# |                                        |                                          |                                          | (but do not commit the changes)
# |                                        |            ok                            |                                          |
# |                                        |<-----------------------------------------|                                          |
# |                                        |<------------------------------------------------------------------------------------|
# |                                        |                                          |                                          |
# |                                        |             commit                       |                                          |
# |                                        |----------------------------------------->|                                          |
# |                                        |------------------------------------------------------------------------------------>|
# |                                        |                                          |                                          |
# |                                        |             ok                           |                                          |
# |                                        |<-----------------------------------------|                                          |
# |                                        |<------------------------------------------------------------------------------------|
# |       done                             |                                          |                                          |
# |<---------------------------------------|                                          |                                          |

# ------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------

# INCASE OF FAILURE:

# Application                             Transaction Coordinator                   Participant(Order Service)                     Participant(Inventory Service)
# |                                        |                                          |                                          |
# |     participate in operation           |                                          |                                          |
# |--------------------------------------->|                                          |                                          |
# |                                        |                                          |                                          |
# |                                        |      sends prepare message               |                                          |
# |                                        |----------------------------------------->|                                          |
# |                                        |------------------------------------------------------------------------------------>|
# |                                        |                                          |                                          |
# |                                        |            ok                            |                                          |
# |                                        |<-----------------------------------------|                                          |
# |                                        |                                          |                 NO                       |
# |                                        |<------------------------------------------------------------------------------------|
# |                                        |                                          |                                          |
# |                                        |                                          |                                          |
# |                                        |             abort                        |                                          |
# |                                        |----------------------------------------->|                                          |
# |                                        |------------------------------------------------------------------------------------>|
# |                                        |                                          |                                          |
# |                                        |             rollback                     |                                          |
# |                                        |<-----------------------------------------|                                          |
# |                                        |<------------------------------------------------------------------------------------|

# possible reason for not getting ok message:
  # 1. Participant is down.
  # 2. ok message is lost. (here transaction coordinator will wait for the ok message and after some time it will send the abort message  )
  # 3. Participant is not able to acquire the lock.

# but the issue came if the commit ok message is lost. It blocks the whole system. so to resolve this issue there we have 3-phase commit.
