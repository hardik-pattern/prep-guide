# CAP Theorem: It is a desirable property of a distributed system that it should be consistent, available, and partition tolerant.

# Consistency, Availability, Partition Tolerance
consider we have a distributed system and databases are connected to each other.
# Consistency: It means if application writes in any node then the it should get the same value after reading from others
# Availability: It means the system should respond, it doesn't matter if the data is stale or not.
# Partition Tolerance: It means the system should be able to tolerate network partitioning.
    # Or system should be able to work even if some nodes are not reachable.

  #           C (consistent)
  #          / \
  #         /   \
  #        /     \
  #       A-------P (partition tolerant)
  # (available)

# CA:
        #      A
        #     / \
        #    /   \
        #  B<-||->C

        # Here we can write to B and C to achieve consistency.
        # Both B and C are available
        # But if the partition happens then we cannot achieve consistency so this system is not partition tolerant.

# CP:
        #      A
        #     / \
        #    /   \
        #  B<---->C (X)

    # Here if the obe one of the node is down then we can still read/write to the other node.
    # Since the single node is available so the system is consistent.
    # But since one node is down we cannot achieve availability.

# AP:
      #      A
      #     / \
      #    /   \
      #  B<-||->C

  #  Here if the partition happens then we can still read/write to the other node.
  # but since the node B cannot sync with C so the system is not consistent.
  # both the nodes are available.
