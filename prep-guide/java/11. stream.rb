# What is stream in java?
  # we can consider the stream as a pipeline from which the data flows
  # We can perform various operations on the data using the stream, like filter, map, reduce, etc.
  # useful when we want to do bulk operations on the data

# flow of stream:
#* Collection --------> Create Stream --------> Intermediate Operations --------> Terminal Operation

# Intermediate Operations: This operation transform the one stream into another stream
# This operation are lazy, means they are not executed until the terminal operation is called
  # filter(): filter the data based on the condition
  # map(): transform the data
  # flatMap(): transform the data and flatten the data
  # distinct(): remove the duplicate data
  # sorted(): sort the data
  # limit(): limit the data

# Terminal Operation: This operation returns the result of the stream & it triggers the intermediate operations
  # forEach(): perform the operation for each element of the stream
  # collect(): collect the data from the stream
  # reduce(): reduce the data from the stream
  # count(): count the number of elements in the stream
  # anyMatch(): check if any element of the stream matches the condition
  # allMatch(): check if all elements of the stream matches the condition
  # noneMatch(): check if no element of the stream matches the condition
  # findFirst(): return the first element of the stream
  # findAny(): return any element of the stream
  # min(): return the minimum element of the stream
  # max(): return the maximum element of the stream
  # sum(): return the sum of the elements of the stream
  # average(): return the average of the elements of the stream

# Eg:
# You have the list of the salaries and return the count of the salary which is greater than 10000

#* ArrayList<Integer> salaries = new ArrayList<>();
#* salaries.add(30000);
#* salaries.add(1232);
#* salaries.add(1324);
#* salaries.add(1111);
#* salaries.add(40000);
#* salaries.add(10000);
#* salaries.add(50000);
#* salaries.add(20000);

#* long count = salaries.stream().filter(salary -> salary > 10000).count();

# ways to create stream:
#* 1. Collection.stream()
#* 2. Stream.of()
#* 3. Stream.generate()
#* 4. Stream.iterate()
#* 5. Stream.builder()

  # List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);

  # Stream<Integer> stream = list.stream();
  # Stream<Integer> stream = Arrays.stream(new Integer[] {1, 2, 3, 4, 5});
  # Stream<Integer> stream = Stream.of(1, 2, 3, 4, 5);
  # Stream<Integer> stream = Stream.builder().add(1).add(2).add(3).add(4).add(5).build();
  # Stream<Integer> stream = Stream.iterate(0, n -> n + 2).limit(10);


# What are the different intermediate operations?
#* filter(): filter the data based on the condition true/false (It is same as filter in js)
#* map(): transform the data (It is same as map in js)
#* flatMap(): transform the data and flatten the data (It is same as flatMap in js)
#* distinct(): remove the duplicate data (It is same as distinct in js)
#* sorted(): sort the data (It is same as sort in js)
#* limit(): limit the data (It is same as limit in js)
#* peek(): perform the operation for each element of the stream (It is same as peek in js)
#* skip(): skip the elements of the stream (It is same as skip in js)

# What are the different terminal operations?
#* forEach(): perform the operation for each element of the stream
#* collect(): collect the data from the stream
#* reduce(): reduce the data from the stream
#* count(): count the number of elements in the stream
#* toArray(): convert the stream to array
#* min(): return the minimum element of the stream
#* max(): return the maximum element of the stream
#* sum(): return the sum of the elements of the stream
#* average(): return the average of the elements of the stream
#* anyMatch(): check if any element of the stream matches the condition
#* allMatch(): check if all elements of the stream matches the condition
#* noneMatch(): check if no element of the stream matches the condition
#* count(): count the number of elements in the stream
#* findFirst(): return the first element of the stream
#* findAny(): return any element of the stream

# Once the stream is executed, it is closed. So we cannot use the same stream again. it throws IllegalStateException

# Parallel Stream:
#* It is a stream that is processed in parallel.
#* It is useful when we want to do bulk operations on the data.
#* It is faster than the normal stream.
#* It is useful when we want to do bulk operations on the data.

# list.parallelStream().forEach(System.out::println);




