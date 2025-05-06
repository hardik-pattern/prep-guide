# what is hashing?
# what is the use of consistent hashing?
# how to implementation/working  of consistent hashing?

# Q. what is hashing?
# A. Hashing is the process of converting a string of characters into a fixed length value. and then using mod operation to store the data in the database.

            # "abcd" ----> f(x) ----> 1234567890 (this value is idempotent) --------> 1234567890 % 10 = 0 (index)
            # # hash table
            # {
            #   0 => "abcd",
            # }

# Q. what is problem with hashing, why we need consistent hashing?
# A. The problem with hashing is that the data is not uniformly distributed. let say if there is the case when we get the data
      # and it its mod value is 0, then all the data will be stored in the same index.

      #                [Node A]
      #                 (100)
      #                   |
      #                   |
      #    (350)          |            (150)
      #  [Node D] --------+---------> [Node B]
      #                   |               \
      #                   |                \
      #                (Key: 170)           \
      #                   |                  \
      #                   |                   v
      #                [Node C] <--------- (250)
      #                 (200)

      #                 Clockwise



