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
# |      Deque (interface)             |                            SortedSet (interface)               HashSet (class)        LinkedHashSet (class)
# |       |         |                  |                             |
# |       |         |                  |                            NavigableSet (interface)
# |       |         |      +-----------+---------------+             |
# |    ArrayDeque   |      |           |               |            TreeSet
# |                 +--LinkedList     ArrayList      Vector
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

# We can use Deque as a stack
    # push(): Internally calls addFirst()
    # pop(): Internally calls removeFirst()
    # peek(): Internally calls getFirst()

# ** ArrayDeque is not a thread safe so we can use ConcurrentLinkedDeque

# ---------------------------------------------------------------------------------------------------

# List:
  # ArrayList:
    # methods:
      # add(): add element at the end of the list
      # add(int index, E element): add element at the index
      # remove(): remove element at the end of the list
      # remove(int index): remove element at the index
      # get(): get element at the index
      # set(): set element at the index
      # size(): get the size of the list
      # isEmpty(): check if the list is empty
      # contains(): check if the list contains the element
      # indexOf(): get the index of the element
