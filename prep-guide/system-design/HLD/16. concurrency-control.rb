# concurrency control is the process of managing the access to a resource by multiple users or processes at the same time.
# scenario:
  #  3 request are coming to book the same seat tickets for a movie.
  # all of them goes into critical section.
  # if they are not handled properly, the result will be wrong.
  # here we get 3 bookings for single seat.

# In-order to solve this problem we use distributed concurrency control.
    - Optimistic Concurrency Control
    - Pessimistic Concurrency Control
# before moving to concurrency control, we must know
    - What is usage of transaction?
    - What is DB locking?
    - What are level of isolation present?

  # !Q What is usage transaction?
    - It helps us to achieve integrity, consistency of data.

  # !Q What is DB locking?
    - It helps us to control that no other transaction update data at the same time.
      - there are 2 types of lock
        - Shared Lock (Read Lock): allows multiple transactions to read the same data at the same time.
                Eg:
                        # user-id         user-name        user-email
              #  Transaction 1: add the shared lock and read the data.
              #  Transaction 2: can also add the shared lock and read the data but not write.

        - Exclusive Lock (Write Lock): allows only one transaction to read and write the data at the same time.
                Eg:
                        # user-id         user-name        user-email
              #  Transaction 1: add the exclusive lock and read the data.
              #  Transaction 2: can not add the exclusive lock also it not allowed to read the data.

  # !Q What are level of isolation present?
      # Before moving to isolation level, we must know about the following:
      #  Dirty Read:
        # - If transaction B is reading the data which is written by transaction A but not yet committed.
        # - If transaction A is rolled back, then transaction B will read the wrong data.

      #  Non-Repeatable Read: (Transaction reads the committed data)
      #   - If transaction A reads same row multiple times but get different values.
      #   - Consider the scenario:
      #        Transaction A started the transaction and reads the data.
      #        Transaction B started the transaction and reads the same data. and modify the data and commit the transaction.
      #        Now transaction A again try to read the data it will get different values.

      #  Phantom Read:
        # - If transaction A executes the same query multiple times but get different values.
        # - Consider the scenario:
            # - Transaction A executes the query to get all the users. It gets 10 users
            # - Transaction B insert a new user and commit the transaction.
            # - Now transaction A executes the query again it will get 11 users.

    #  | Isolation Level      | Dirty Read | Non-Repeatable Read | Phantom Read |
    #  |----------------------|------------|---------------------|--------------|                     high consistency
    #  | Read Uncommitted     | Yes        | Yes                 | Yes          | (mongoDB)             ^
    #  | Read Committed       | No         | Yes                 | Yes          | (SQL)                 |
    #  | Repeatable Read      | No         | No                  | Yes          | (mysql)               |
    #  | Serializable         | No         | No                  | No           | (CockroachDB)       low consistency


    # Read uncommitted:
        # Here acquire no lock for read and write operation.
    # Read committed:
        # Here acquire shared lock for read operation and release immediately after read operation
        # exclusive lock for write operation and keep it until the transaction is completed.
    # Repeatable read:
        # Here acquire shared lock for read operation and keep it until the transaction is completed.
        # exclusive lock for write operation and keep it until the transaction is completed.
    # Serializable:
        # Here acquire shared lock for read operation and keep it until the transaction is completed.
        # exclusive lock for write operation and keep it until the transaction is completed.
        # also adds range lock and release it after the transaction is completed.


# ------------------------------------------------------------
# Optimistic Concurrency Control:(Uses Read Committed Isolation Level)
  #  - here we use row versioning to check the conflict.
  #  - see the below example:

    # |         Transaction 1         |         Transaction 2         |         DB                   |
    # |-------------------------------|-------------------------------|------------------------------|
    # | 1. start transaction          |       start transaction       | status: 'free', version: 1   |
    # | 2. read user-1                |       read user-1             | status: 'free', version: 1   | (adds shared lock by T1, T2)
    # | 3. select for update          |                               | status: 'free', version: 1   | (adds exclusive lock by T1)
    # | 4. update user-1              |                               | status: 'booked', version: 2 |
    # | 5. commit                     |                               | status: 'booked', version: 2 |
    # | 6.                            |     select for update         | status: 'booked', version: 2 | (version is different)
    # | 6.                            |     rollback                  | status: 'booked', version: 2 |

# Pessimistic Concurrency Control: (Uses Repeatable or Serializable Isolation Level)
    # - It is same as above optimistic concurrency control but it only release the lock only after the transaction is completed.
    # it has less concurrency and more consistency.

    # |         Transaction 1         |         Transaction 2         |         DB                   |
    # |-------------------------------|-------------------------------|------------------------------|
    # | 1. start transaction          |                               | status: 'free'               |
    # | 2. select for update          |                               | status: 'free'               | (acquires exclusive lock)
    # | 3. read user-1                |       start transaction       | status: 'free'               |
    # | 4. update user-1              |       select for update       | status: 'free'               | (T2 waits for lock)
    # | 5. commit                     |                               | status: 'booked'             | (releases lock)
    # | 6.                            |     read user-1               | status: 'booked'             | (T2 acquires lock)
    # | 6.                            |     update user-1             | status: 'booked'             |
    # | 6.                            |     commit                    | status: 'booked'             |

# Best example of Pessimistic Concurrency Control is 2PL
