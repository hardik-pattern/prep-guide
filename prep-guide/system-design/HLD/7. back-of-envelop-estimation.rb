# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# what is back of envelop estimation? what is the need of it?
  # it is the process of estimating the resources required for a system
  # we need to estimate the resources before working on the system design so that we won't over and under estimate the resources

# keep this cheat sheet handy for your reference

  #  3 zero       Thousand           KB
  #  6 zero       Million            MB
  #  9 zero       Billion            GB
  #  12 zero      Trillion           TB
  #  15 zero      Quadrillion        PB

  # char        -> 2 bytes
  # int         -> 4 bytes
  # long/double -> 8 bytes
  # float       -> 4 bytes
  # double      -> 8 bytes
  # string      -> 2 bytes per character

# you can refer the below points for the estimation?
  #  1. number of servers?
  #  2. RAM?
  #  3. Storage?
  #  4. Tradeoff (use CAP theorem)
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# estimation of facebook

# 1. traffic estimation:
      # 1. assume number of users: 1B
      # 2. how many are daily active users? -> 25% of total users ~= 250M
      # 3. assuming each user is making 5 read and 2 write requests per day = 7 queries per day per user
      # 4. total queries per day = 250M * 7 = 1.75B
      # 5. seconds in a day = 86K ~= 100K (this is just to round off the number)
      # 6. total queries per second = 1.75B / 100K = 17500 queries/sec ~= 18K queries/sec
# 2. storage estimation:
      # 1. assume each daily active user is making 2 posts per day and each post is of approx 250 characters
      # 2. 10% of the DAU are also uploading 1 image avg size of 300KB
      # 3. total storage per day = 250M * 250(characters) * 2 (bytes) * 2(number of posts per user) bytes = 1000 bytes * 250M = 250GB
      # 4. total storage size of images per day = 250M * 10% * 300KB = 75GB
      # total storage per day = 250GB + 75GB = 325GB
# 3. RAM estimation:
      # 1. assume each post is of 500 bytes and we are keeping last 5 posts in the cache
      # 2. total cache size = 250M * 5 * 500 bytes ~= 250M * 3KB ~= 750GB

# 4. tradeoff: CAP theorem: I will choose availability over consistency (AP)



