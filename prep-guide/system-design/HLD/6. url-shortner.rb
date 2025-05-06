# url shortner

# How short url you want to generate? -> as short as possible
# What is the traffic? -> 1000000 url per day => 3650M url per year
# How much you want to store a single url? -> 100 years => 3650M * 100 = 365B url
# How many characters you want to use? -> 0-9, a-z, A-Z => 62 characters
# what is the minimum length of short url we need to support 365B url made of 62 characters? 62 pow n >= 365B => n ~= 7


# Design

# since we need the string length of 7, we can use 62^7 = 3.5T combinations
# So first finalize the hashing algorithm
    # md5 -> 128 bit -> 16 bytes -> 62^16 = 16 is the length of the short url
    # sha256 -> 256 bit -> 32 bytes -> 62^32 = 32 is the length of the short url
# in above both cases the character length is much more than 7 so this may cause the problem of collision

# so we need to implement the base62 encoding
  how base62 encoding helps you let say we get the id(we will discuss how to get the id for now just assume we have it) of url from database is 1000
  we need to convert it to base62 we will get as 1000 % 62 = 24(reminder)  || 16 % 62 = 16(reminder)
  so the base62 encoding will be 1624 => let say we get "g7"

  # HashTable with 62 characters
    {
      "1" => 1, "2" => 2, "3" => 3, ....... "Z" => 62, "a" => 63, "b" => 64, ....... "z" => 122
    }

  # now we will fill the rest of the characters with filler/padding so the result is "g7=====" as the URL

# Now how to generate the id for the url?
  # 1. rely on the database auto increment? but eventually we cannot store the 365B url in the single table so it is not a good idea
  # 2. use Ticket Server to generate the id
               working of ticket server here application ask for the ticket from ticket server and it returns it via database(we could have multiple database also)

              #  application 1             application 2             application 3
              #                               |
              #                               |
              #                         Ticket Server
              #                               |
              #                               |
              #                           database

  # but what if ticket server is down? this is single point of failure

  # 3. Snowflake is the solution for this (used by twitter)
    # Snowflake is a distributed unique id generator
      #  It stores the id in format as  "TimeStamp(41 bit) + Machine Id(10 bit) + Sequence Number(12 bit)"

  # 4. Zookeeper is the solution for this?


                  # server 1                            Range 1 (1 to 1M)
                  # server 2             Zookeeper      Range 2 (1M to 2M)
                  # server 3                            Range 3 (2M to 3M)
                  # server 4                            Range 4 (3M to 4M).......

  # so for each server we assigned the range and each server will generate the id from the range pool and when it is done it will ask for the next range
  # so we reduce the database load. since the zookeeper will not keep asking for id from database for each request it will wait till the range is completed

