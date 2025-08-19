# java collection framework: collection is a group of objects
# it is available in java.util package since java 1.2

# Java Collection Framework Hierarchy


#                                   Iterable (interface)
#                                     |
#                                   Collection (interface)
#                                     |
#        +-----------------------------+-----------------------------+
#        |                             |                             |
# +-----Queue (interface)              List (interface)              Set (interface)--------------------------+------------------------+
# |       |                            |                             |                                        |                        |
# |      Dequeue (interface)           |                            SortedSet (interface)               HashSet (class)        LinkedHashSet (class)
# |       |         |                  |                             |
# |       |         |                  |                            NavigableSet (interface)
# |       |         +------+-----------+---------------+             |
# |    ArrayDequeue        |           |               |            TreeSet
# |                    LinkedList     ArrayList      Vector
# |                                                    |
# PriorityQueue                                        |
#                                                     Stack

#
# Key:
# - Collection: Root interface of the collection hierarchy
# - List: Ordered collection that allows duplicate elements
# - Set: Collection that does not allow duplicate elements
# - Queue: Collection designed for holding elements prior to processing
# - Deque: Double-ended queue that supports insertion/removal at both ends
# - SortedSet: Set that maintains its elements in ascending order
# - NavigableSet: SortedSet with navigation methods

# Common Implementations:
# - ArrayList: Resizable array implementation of List
# - LinkedList: Doubly-linked list implementation of List and Deque
# - HashSet: Hash table implementation of Set
# - HashSet: Hash table implementation of Set
# - TreeSet: Red-black tree implementation of NavigableSet
# - PriorityQueue: Priority heap implementation of Queue
# - ArrayDeque: Resizable array implementation of Deque


# Iterable Interface: It is added in java 1.5 & used to iterate over a collection
# iterator() and forEach() method are commonly used in Iterable interface

# iterator() gives you an object of Iterator interface
# Iterator interface has 3 methods: hasNext(), next(), remove()
# hasNext(): checks if there is a next element in the collection
# next(): returns the next element in the collection
# remove(): removes the last element returned by the iterator

class Main {
  public static void main(String[] args) {
    List <Integer> list = new ArrayList<>();
    list.add(1);
    list.add(2);
    list.add(3);
    list.add(4);
    list.add(5);

    Iterator<Integer> itr = list.iterator();
    while(itr.hasNext()) {
      System.out.println(itr.next());
    }

    for(Integer i : list) {
      System.out.println(i);
    }

    list.forEach((Integer n) -> System.out.println(n));
  }
}


# Collection Interface: It is added in java 1.2 & is the root interface of the collection framework.

size() : returns the number of elements in the collection
isEmpty() : returns true if the collection is empty
contains(Object o) : returns true if the collection contains the object o
toArray() : returns an array of the collection
toArray(T[] a) : returns an array of the collection
add(E e) : adds the element e to the collection
remove(Object o) : removes the object o from the collection
addAll(Collection<? extends E> c) : adds all the elements of the collection c to the collection
removeAll(Collection<?> c) : removes all the elements of the collection c from the collection
clear() : removes all the elements from the collection
equals(Object o) : returns true if the collection is equal to the object o
iterator() : returns an iterator of the collection

stream() : returns a stream of the collection
parallelStream() : returns a parallel stream of the collection

Collection vs Collections:
Collection is an interface & Collections is a utility class

# Methods in Collections:
    # sort(List<T> list) : sorts the list
    # reverse(List<T> list) : reverses the list
    # shuffle(List<T> list) : shuffles the list
    # swap(List<T> list, int i, int j) : swaps the elements at index i and j
    # binarySearch(List<? extends Comparable<? super T>> list, T key) : searches for the key in the list
    # max(Collection<? extends T> coll) : returns the maximum element in the collection
    # min(Collection<? extends T> coll) : returns the minimum element in the collection
    # frequency(Collection<?> c, Object o) : returns the frequency of the object o in the collection
    # disjoint(Collection<?> c1, Collection<?> c2) : returns true if the two collections have no elements in common


# ----------------------------------------------------------------------------------------------------------------------------------------------------

# Queue: First In First Out (FIFO)
    # add(E e) : adds the element e to the queue if insertion fails, it throws an exception
    # offer(E e) : adds the element e to the queue if insertion fails, it returns false
    # poll() : returns and removes the element at the front of the queue, if the queue is empty, it returns null
    # remove() : removes the element from the queue, if the queue is empty, it throws an exception
    # peek() : returns the element at the front of the queue, if the queue is empty, it returns null
    # element() : returns the element at the front of the queue, if the queue is empty, it throws an exception

# PriorityQueue: A priority queue is a queue where each element has a priority associated with it.
    # add(E e) : adds the element e to the queue
    # poll() : returns and removes the element at the front of the queue
    # peek() : returns the element at the front of the queue
    # element() : returns the element at the front of the queue

# PriorityQueue queue = new PriorityQueue<>();
# queue.add(1);
# queue.add(2);
# queue.add(3);
# queue.add(4);
# queue.add(5);

# output: 1, 2, 3, 4, 5

# PriorityQueue with custom comparator

# PriorityQueue queue = new PriorityQueue<>((Integer a, Integer b) -> b - a);
# queue.add(1);
# queue.add(2);
# queue.add(3);
# queue.add(4);
# queue.add(5);

# output: 5, 4, 3, 2, 1

# Comparator vs Comparable:
    # Comparator: A comparator is a function that compares two objects and returns a boolean value.
    # Comparable: A comparable is a function that compares two objects and returns an integer value.

Comparator is a functional interface which has one method called as compare
Here is the condition that the compare method will return:
    # V1 > V2 : +1  (swap)
    # V1 < V2 : -1  (no swap)
    # V1 == V2 : 0  (no swap)

# Comparator example:

int [] arr = {1, 2, 3, 4, 5};
Arrays.sort(arr, (Integer a, Integer b) -> b - a);
# output: 5, 4, 3, 2, 1

class Car {
  String name;
  String type;
}

class Main {
  public static void main() {

    Array [] cars = {new Car("BMW", "SUV"), new Car("Mercedes", "Sedan"), new Car("Audi", "SUV")};
    Arrays.sort(cars, (Car a, Car b) -> a.name.compareTo(b.name)); // sort by car name

    Arrays.sort(cars, (Car a, Car b) -> a.carType.length() > b.carType.length() ? 1 : -1); // sort by car type length
    # output: [BMW, Audi, Mercedes]
  }
}


# Comparable: A comparable is a function that compares two objects and returns an integer value.
  #  It has one method called as compareTo

# ---------------------------------------------------------------------------------------------------

# Deque: It means we can add or remove from both ends of the queue
# methods which are available in deque
  # add(), offer(), poll(), ... all methods from collections
  # offerFirst(), offerLast(), pollFirst(), pollLast(), peekFirst(), peekLast(): This does not throws an exception
  # addFirst(), addLast(), removeFirst(), removeLast(), getFirst(), getLast()...: This throws an exception if the queue is empty

  # add(): Internally calls addLast()
  # offer(): Internally calls offerLast()
  # poll(): Internally calls pollFirst()
  # peek(): Internally calls peekFirst()
  # remove(): Internally calls removeFirst()
  # element(): Internally calls getFirst()

# We can use Dequeue as a stack
    # push(): Internally calls addFirst()
    # pop(): Internally calls removeFirst()
    # peek(): Internally calls getFirst()

# ** ArrayDequeue is not a thread safe so we can use ConcurrentLinkedDequeue

# ---------------------------------------------------------------------------------------------------

# List:
  # ArrayList:
    # methods:
      # add(): add element at the end of the list. It will shift all the elements to the right side.
      # add(int index, E element): add element at the index
      # addAll(int index, Collection<? extends E> c): add all the elements of the collection at the index
      # remove(): remove element at the end of the list
      # remove(int index): remove element at the index
      # get(): get element at the index
      # set(): set element at the index, it will replace the element at the index with the new element
      # size(): get the size of the list
      # isEmpty(): check if the list is empty
      # contains(): check if the list contains the element
      # indexOf(): get the index of the element
      # listIterator(): get the list iterator

# Instance of using listIterator():
  List list = new ArrayList<>();
  ListIterator<Integer> itr = list.listIterator();
  while(itr.hasNext()) {
    System.out.println(itr.next());
  }

  while(itr.hasPrevious()) {
    System.out.println(itr.previous());
  }
# How list is different from queue:
  # List stores the data in the order of insertion and we can access using index but queue does not store the data in the order of insertion and we can not access using index

# How list is different from set:
  # List allows duplicate elements but set does not allow duplicate elements
  # List allows null elements but set does not allow null elements
  # List allows multiple null elements but set does not allow multiple null elements
  # List allows heterogeneous elements but set does not allow heterogeneous elements
  # List allows mutable elements but set does not allow mutable elements

# How list is different from map:
  # List stores the data in the order of insertion and we can access using index but map does not store the data in the order of insertion and we can not access using index

# CopyOnWriteArrayList: It is a thread safe list.

# Vector: It is a thread safe list, It is synchronized and slow. It put a lock on the entire list when we are iterating over the list.
# Stack: It is a thread safe because it is a child of vector.



# ---------------------------------------------------------------------------------------------------

  #     +---------------------------------Map(interface)
  #     |                                         |
  #     |                                         |
  #     |                                         |
  #     |                                         +----------------+
  # SortedMap(interface)                          |                |
  #     |                                         |                |
  #     |                                      HashTable       LinkedHashMap
  # NavigableMap(interface)
  #     |
  #   TreeMap


#* HashMap is not thread safe, so we can use ConcurrentHashMap
# Method in Map:
  # size(): get the size of the map
  # isEmpty(): check if the map is empty
  # put(): add key and value to the map
  # get(): get the value of the key
  # remove(): remove the key and value from the map
  # containsKey(): check if the map contains the key
  # containsValue(): check if the map contains the value
  # putIfAbsent(): put the value if not present
  # containsKey(): check if the map contains the key
  # containsValue(): check if the map contains the value
  # getOrDefault(key, defaultValue): get the value of the key, if the key is not present, return the defaultValue
  # replace(key, oldValue, newValue): replace the value of the key, if the old value is present
  # replaceAll(BiFunction<? super K, ? super V, ? extends V> function): replace all the values of the map

  # How to iterate over the map:
    for(Map.Entry<K, V> entry : map.entrySet()) {
      System.out.println(entry.getKey() + " " + entry.getValue());
    }

    for(K key : map.keySet()) {
      System.out.println(key + " " + map.get(key));
    }

    for(V value : map.values()) {
      System.out.println(value);
    }

#* HashTable is synchronized and thread safe version of HashMap
#* LinkedHashMap is a map that maintains the order of insertion
#* TreeMap is a map that maintains the order of insertion and sorted order
#* HashMap is not thread safe, so we can use ConcurrentHashMap
#* HashTable is synchronized and thread safe version of HashMap


# LinkedHashMap:
  # LinkedHashMap is a map that maintains the order of insertion
  # LinkedHashMap is not thread safe, so we can use ConcurrentLinkedHashMap
  # LinkedHashMap is not synchronized, so we can use ConcurrentLinkedHashMap
  # LinkedHashMap is not thread safe, so we can use ConcurrentLinkedHashMap

  # It uses doubly linked list to maintain the order of insertion
  # It has accessOrder property, if it is true, it will maintain the order of access. When we get the element, it will be moved to the end of the list

# TreeMap:
  # TreeMap is a map that maintains the order of insertion and sorted order
  # TreeMap is not thread safe, so we can use ConcurrentTreeMap
  # TreeMap is not synchronized, so we can use ConcurrentTreeMap
  # It uses Red-Black tree to maintain the order of insertion and sorted order
  # It is not thread safe, so we can use ConcurrentTreeMap

# Map<Integer, Integer> map = new HashMap<>((Integer a, Integer b) -> b - a); // sort by descending order


# TreeMap:
  # TreeMap is a map that maintains the order of insertion and sorted order
  # TreeMap is not thread safe, so we can use ConcurrentTreeMap

SortedMap<Integer, Integer> map = new TreeMap<>();
map.put(5, 5);
map.put(4, 4);
map.put(3, 3);
map.put(2, 2);
map.put(1, 1);

# { 1=1, 2=2, 3=3, 4=4, 5=5 }

map.headMap(3); // return the map from the beginning to the key 3 (exclusive) # { 1=1, 2=2 }
map.tailMap(3); // return the map from the key 3 (inclusive) to the end # { 3=3, 4=4, 5=5 }
map.subMap(2, 4); // return the map from the key 2 (inclusive) to the key 4 (exclusive) # { 2=2, 3=3 }
map.firstKey(); // return the first key # 1
map.lastKey(); // return the last key # 5

# ---------------------------------------------------------------------------------------------------

# Set:
  # Set does not follow the order of insertion
  # Set cannot be accessed using index
  # Set is a collection that does not allow duplicate elements
  # Set is not synchronized, so we can use ConcurrentSet
  # Set is not thread safe, so we can use ConcurrentSet

# HashSet:
  # HashSet internally uses HashMap to store the elements, It stores the provided element as key and value as 'new Object()'
  # HashSet is a set that does not allow duplicate elements
  # HashSet is not thread safe, so we can use ConcurrentHashSet
  # HashSet is not synchronized, so we can use ConcurrentHashSet

# method used in HashSet:
  # add(): add element to the set
  # remove(): remove element from the set
  # contains(): check if the set contains the element
  # size(): get the size of the set
  # isEmpty(): check if the set is empty
  # addAll(): add all the elements of the collection to the set
  # retainAll(): retain all the elements of the collection from the set
  # removeAll(): remove all the elements of the collection from the set
  # clear(): remove all the elements from the set
  # iterator(): get the iterator of the set
  # stream(): get the stream of the set
  # parallelStream(): get the parallel stream of the set

#* If you try to add the value in HashSet while iterating over the set, it will throw a ConcurrentModificationException
#* To avoid this, we can use ConcurrentHashSet

# LinkedHashSet: LinkedHashSet is a set that maintains the order of insertion
  # It uses doubly linked list to maintain the order of insertion
  # LinkedHashSet is not thread safe, so we can use ConcurrentLinkedHashSet
  # LinkedHashSet is not synchronized, so we can use ConcurrentLinkedHashSet

# TreeSet: TreeSet is a set that maintains the order of insertion and sorted order
  # It uses Red-Black tree to maintain the order of insertion and sorted order
  # TreeSet is not thread safe, so we can use ConcurrentTreeSet
  # TreeSet is not synchronized, so we can use ConcurrentTreeSet


