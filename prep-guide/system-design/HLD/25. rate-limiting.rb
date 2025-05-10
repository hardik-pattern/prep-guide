
# ---------------------------------------------------------------------------------------------------------------------
# Q. How to handle rate limiting?
# ---------------------------------------------------------------------------------------------------------------------

  # There are several ways to handle rate limiting in a web application, including:
    # Token Bucket Algorithm
    #   A bucket holds a fixed number of tokens that are added at a constant rate.
    #   Each incoming request consumes a token.
    #   If the bucket is empty (no tokens available), the request is either delayed or rejected.
    #   This algorithm allows for bursts of traffic as long as there are tokens.

    # Leaky Bucket Algorithm
    #   Requests enter a queue (the "bucket") and are processed at a fixed rate.
    #   If the bucket overflows (i.e., too many incoming requests), excess requests are dropped.
    #   This smooths out bursts, ensuring a consistent processing rate.

    # Fixed Window Counter
    #   A counter tracks the number of requests within a fixed time window (e.g., 100 requests per minute).
    #   Once the limit is reached, further requests within that window are rejected.
    #   Simple to implement but can cause bursts at window edges ("thundering herd" problem).

    # Sliding Window Log or Counter
    #   A more accurate version of fixed window.
    #   Maintains a log or rolling count of request timestamps in the current sliding window (e.g., past 60 seconds).
    #   Allows more precise rate limiting without the burstiness of fixed windows.

# ---------------------------------------------------------------------------------------------------------------------
