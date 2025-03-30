# Memory Management in JAVA

# Java creates 2 types of memory in RAM:
# 1. Stack Memory:
      # 1. It stores temporary variables created by methods.
      # 2. It stores primitives and references to objects.
      # 3. Each thread has its own stack memory.
      # 4. Variable in the SCOPE is only visible as soon as it gets deleted it is removed from stack.
      # 5. Stack memory is faster than heap memory.
# 2. Heap Memory
      # Stores Object
      # There is no order of allocation of memory
      # Used to store static variables
      # Garbage Collector is used to remove unused objects from heap memory.
          # Types of GC
          # 1. Single GC: Single GC Threads runs and cleans the heap memory but it halts the application.
          # 2. Parallel GC: Multiple GC Threads runs and cleans the heap memory based on the core of CPU. It also halts the application
          # 3. Concurrent GC: Multiple GC Threads runs and cleans the heap memory. It does not guarantee to  halt the application. (without compact memory)
          # 4. G1 GC: Multiple GC Threads runs and cleans the heap memory. It does not guarantee to halt the application. (with compact memory)

      # Heap memory is shared among all threads.
      # This can also used for string pool
      # Heap memory is further divided into 3 parts:
        # 1. Young Generation (Eden, Survivor)
        # 2. Old Generation
        # 3. Permanent Generation


# There are 3 major types of reference in java
# 1. Strong Reference: Here GC will not clear the memory of person from heap
    # Person person = new Person();
# 2. Weak Reference: Here GC will clear the memory of person from heap whenever it is invoked by JVM
    # WeakReference<Person> person = new WeakReference<>(new Person());
# 3. Soft Reference: Here GC will clear the memory of person from heap whenever it is invoked by JVM
    # but only when the JVM is running low on memory.
    # SoftReference<Person> person = new SoftReference<>(new Person());

# 4. Phantom Reference: Here GC will clear the memory of person from heap whenever it is invoked by JVM
    # but it will not be able to access the object.
    # PhantomReference<Person> person = new PhantomReference<>(new Person());

# How to remove the references
# 1. Strong Reference: person = null;
        Person person1 = new Person();
        Person person2 = new Person();

        person1 = person2; # GC will clear the memory of person1
# 2. Weak Reference: person = null;
# 2. Weak Reference: person.clear();
# 3. Soft Reference: person.clear();
# 4. Phantom Reference: person.clear();


# Types of Heap?
# Heap is divided into 2 parts one is Young Generation and another is Old Generation
# 1. Young Generation is further divided into types like eden, S0, S1.
# Whenever new object is created let say we create 9 different object of person so all gets into eden storage
# When GC runs on algo Mark and Sweep it marks all the object which does not have reference and remove them and add age as 1 to survivors
# Let say on 2nd cycle it again some object is created it again move them to S0 to S1 and mark the unused and remove them. Also increase the age of rest by 1
# after certain cycle if the age reaches certain threshold then it moves those object to the old generation.
# The reason behind it is in young generation the GC runs very frequently and in old generation it runs after some time to save computation.


# Garbage Collector?
# 1. Mark and sweep
# 2. Mark and sweep with compact memory
