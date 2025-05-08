# How database stores the data in disk?

# let say we have a table called as "users" with 3 columns: id, name, email.

# | id | name | email            |
# |----|------|-------           |
# | 1  | John | john@example.com |
# | 2  | Jane | jane@example.com |
# | 3  | Jim  | jim@example.com  |

# DBMS creates a data-page of size 8KB(this changes from database to database)

# each file will have 3 main sections:

  #  Header (96 bytes)            |
  #                                - Page Number
  #                                - Free Space
  #                                - Checksum

  #  Data Records (8060 bytes)    |
  #                                 - 1, John, john@example.com
  #                                 - 2, Jane, jane@example.com
  #                                 - 3, Jim, jim@example.com

  #  Offset (36 bytes)            | (this is the array of pointers which points to the data records)
  #                                 - 0 -> data-record-1, 1 -> data-record-2, 2 -> data-record-3


# DBMS creates and manages the data pages in the disk.
# Data pages are stored in data-blocks. it can have one or many data pages.
# DBMS do not handle the storing of data blocks it is the responsibility of the IO/OS.
# But DBMS maintains the mapping of data blocks to the data pages.


# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

#! Q What types of indexing present in RDBMS?
      # Indexing
      #    |
      #    +-Clustered Indexing: order of the row stored in data page matches with order of the index.
      #    |
      #    +-Non-Clustered Indexing

# Indexing: It is used to increase the performance of the query to retrieve the data from the disk.
# Without indexing the query time complexity is O(n) where n is the number of rows in the table.

# B(balanced)+ Tree is used for indexing.
  # It maintains the sorted order of the data in the disk.
  # all the leaf node are in same level.
  # each tree has order which means it has the n - 1 number of keys and n number of pointers.


# refer: https://www.youtube.com/watch?v=6ZquiVH8AGU

# !Warning: high level knowledge..

# Clustered Indexing:
  # things to keep in mind:
      # 1. the order of row in page matches with order of the index.
      # 2. order of insertion is same as order of the row.
      # 3. indexed are always in sorted order. since it is B+ tree.
      # 4. now the conflicts came that if the insertion is not ordered and indexing is ordered then how it will be stored?
      # 5. here offset comes into the picture.

# check the below example:

  # table (this is in the order of insertion):

    # | id | name |     address      |
    # |----|------|------------------|
    # | 1  | A    | City A           |
    # | 4  | C    | City C           |
    # | 5  | D    | City D           |
    # | 2  | B    | City B           |


    #               | EmpIndex |                                  |   Data Page- 1  |
    #               |----------|                                  |-----------------|
    #               |  1       | -------------------------------> |   Row with id 1 |
    #               |  2       |                                  |   Row with id 4 |
    #               |  4       |                                  |   Row with id 5 |
    #               |  5       |                                  |   Row with id 2 |
    #                                                             |-----------------|
    #                                                               0                           1                           2                           3
    #                                                               |                           |                           |                           |
    #                                                               v                           v                           v                           v
    #                                                              points to (row with id 1)  points to (row with id 2)  points to (row with id 4)  points to (row with id 5)

# if there is no primary key the DBMS will create a hidden column called as rowid(auto incremented) and it will be the primary key.
# ----------------------------------------------------------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------------------------------------------------------
# When you crate the composite key DBMS ultimately creates Non Clustered Index.
# ----------------------------------------------------------------------------------------------------------------------------------------------------

# for non clustered index the order of the row in the data page does not match with the order of the index.
# we can create many composite or non clustered index on the same table.
# for each clustered index there is B+ tree involved
