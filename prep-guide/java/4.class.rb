# There are types of classes
  # 1.Concrete Class
  # 2. Abstract Class
  # 3. Super Class and subclass
  # 4. Object Class
  # 5. Nested class
  #     1. Inner Class (Non static nested class)
  #     2. Anonymous inner class
  #     3. Member inner class
  #     4. Local inner class
  #     5. static nested class

concrete class:
  1. concrete class are those which we can create an instance of them
  2. all the methods should have the implementation
  3. It can be the child class or implementation of the interface
  4. It has access modifier as public or default

abstract class:
  1. class is defined as abstract through abstract keyword
  2. It can have both abstract and non abstract methods
  3. We cannot create an object of non abstract methods
  4. we can create an constructor in abstract and can be accessed using super keyword in child class

super & sub class:
  1. A class which is derived from super another class is called as subclass
  2. A class through which sub class is derived is called as super class
  3. Object is the topmost class in java (If a class is not inheriting any class then its parent class is Object)


nested class: A class within another class is called as nested class
  1. When we know that a particular class is only used by only one class so insted of creating a new file for that class we create it as nested class

  # static nested class

    class OuterClass {
      int instanceVariable = 10;
      static int classVariable = 20;

      static class NestedClass {
        public void main() {
          classVariable + instanceVariable(You cannot access instanceVariable here)
        }
      }
    }


    class ObjectTest {
      public static void main() {
        OuterClass.NestedClass object = new OuterClass.NestedClass();
        object.print();
      }
    }

  2. Nested classes can be private or protected
    1. You cannot create an object of the private nested class outside the class
    2. You can create an object of the protected nested class in same package or child class

  # Non Static Inner Class

  class OuterClass {
    public int instanceVariable = 10;
    public static int classVariable = 20;

    class InnerClass {
      public void print(){
        sout(instanceVariable + classVariable)
      }
    }
  }

  class ObjectTest {
    public void main() {
      OuterClass object = new OuterClass();
      OuterClass.InnerClass innerObject = object.new InnerClass();
      innerObject.print();
    }
  }

  # Local inner class
    # 1. You can define a class inside the block of if, for, method
    # 2. This cannot be public, private, protected it must be default
    # 3. It cannot be accessed outside the block


  # anonymous class in java: When you want to override the behaviour of method in the class (like we do in metaprogramming in ruby)
    # We use the concept of anonymous class in java.

    public class Student {
      class Car {
        public void name() { System.out.println("I am inside the Car class"); }
      }


      public void method() {
          Car car = new Car() {
            @Override
            public void name(){ System.out.println("I am inside the anonymous class"); }
          };

          car.name();
      }

      main(String[] args) {
        Student s = new Student();
        s.method(); // I am inside the anonymous class
      }
    }

-----------------------------------

  # generic classes in java: We use generic class in java when we don't know the data type it is going to return or accept
    # It bind its data type on run time
    # We can only use non-premitive data types in place of T
    class Print <T> {
      public T returnName(T value) { return value; }
    }

    public class Student {
      public static void main(String[] args) {
        Print <String> p = new Print<String>();
        System.out.println(p.returnName("Same To Same"));
      }
    }

  # Make single method generic not whole class
    class Print{
      public <T> T returnName(T value) { return value; }
    }

    public class Student {
      public static void main(String[] args) {
        Print p = new Print();
        System.out.println(p.returnName("Some value"));
      }
    }

  # Inheritance in generic class
    # 1. Inheriting the generic class in non generic class
      class Print <T> {
        public T returnName(T value) { return value; }
      }

      public class Student extends Print<String> {
        public static void main(String[] args) {
          Student s = new Student();
          System.out.println(s.returnName("Some Name"));
        }
      }

    # 2. Inheriting the generic class in generic class
      class Print <T> {
        public T returnName(T value) { return value; }
      }

      public class Student<T> extends Print<T> {
        public static void main(String[] args) {
          Student<String> s = new Student<String>();
          System.out.println(s.returnName("Some Name"));
        }
      }

  # Raw type generic class: If you don't pass the parameters to the generic class then it by default pass it as Object.

    class Print <T>{
      public <T> T returnName(T value) { return value; }
    }

    public class Student {
      public static void main(String[] args) {
        Print p = new Print();
        System.out.println(p.returnName("Some value"));
      }
    }

  # Bounded generics
  # Here we can bound the user that which non-premitive datatype he can pass to the class
    1. Upper bound
    2. Multi bound

    # Number: in place of number we can use interface or class
    # We can pass Same class or child of the class from where we are declaring an object
    # This is called as upper bound
    class Print <T extends Number>{
      public <T> T returnName(T value) { return value; }
    }

    public class Student {
      public static void main(String[] args) {
        Print<Number> p = new Print<Number>();
        Print<Integer> q = new Print<Integer>();
      }
    }

  # multi bound in java
  public class A extends B implements C, D { }

  # we can create the generic class which takes A as the arguments then the syntax will be
  public class E <T extends A & B & C & D> {
    public static void main() {
      A a = new A();
      E<A> e = new E<A>();
    }
  }

  # wildcard in java
  # 1. Wildcard is used to represent the unknown type
  # 2. It is used in the place of T
  # 3. It is used in the place of Object
  # 4. It is used in the place of non-premitive data type
  # 5. It is used in the place of generic class
  # 6. It is used in the place of interface

  # Upper bound wildcard
  public class Print {
    # Here we can pass the list of Number or its child class
    public void print(List<? extends Number> list) {}
  }

  # Lower bound wildcard
  public class Print {
    # Here we can pass the list of Integer or its super class
    public void print(List<? super Integer> list) {}
  }

  # why we need wild card operator, can't we achieve from generic 'T'
  # Here is the example of both
  public class Print {
    # wildcard method
    public void print(List <? extends Number> list) {}

    # generic method
    public <T> void print(List<T> list) {}
  }

    # 1. wild card method gives more flexibility than generic method since you can pass the list of different types of non-premitive data types above than Number
    # 2. generic method are more restrictive than wild card since you need to pass the same type of non-premitive data type
    # 3. you can use super keyword in wild card method but you cannot use it in generic method
    # 4. you can have pass single type of(lower or upper possible but not completely different like Number and String) non-premitive data type in wild card method but in generic method you can pass multiple type of non-premitive data type


  # PECS: Producer Extends Consumer Super
  # Producer: If you are using the ? extends then you are a producer
  # Consumer: If you are using the ? super then you are a consumer
  # Extends: If you are using the ? extends then you are a producer
  # Super: If you are using the ? super then you are a consumer


  # Type Eraser
  # In generic class we can pass the different type of non-premitive data type but at runtime it will be considered as Object
  # So it will replace all 'T' with Object
  # also if you used extends it replace it with the first bound type eg: List<? extends Number> will be replaced with List<Number>

-----------------------------------------------------

# POJO (Plain Old Java Object)
# 1. It contains variables, getters, setters, constructors, methods
# 2. class should be public
# 3. no annotation, it does not extend any class or implement any interface
  # When we use POJO?
    # 1. let say a request comes from client then we should create a POJO class to store the request data
    # 2. when we have business logic from repo to database then we build a POJO of the data and pass from service to DB

# ENUM class in java
# 1. enum is the collection of constants
# 2. Its constants are static and final implicitly we don't need to write static and final
# 3. it cannot be inherited because it by default extends Enum class
# 4. it can implement interface
# 5. enum cannot be initialized using new keyword. since it has private constructor
# 6. it has some abstract methods which we need to implement

# eg:
public enum EnumSample {
  MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY;
}

# some of the common methods in enum
# 1. values()
# 2. valueOf()
# 3. ordinal()
# 4. compareTo()
# 5. equals()
# 6. hashCode()

public class Main {
  public static void main(String[] args) {

    EnumSample sample = EnumSample.valueOf("MONDAY");
    System.out.println(sample.name()); // MONDAY
    System.out.println(sample.ordinal()); // 0

    for (EnumSample s : EnumSample.values()) {
      System.out.println(s); // MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
    }
  }
}

# enum with custom values

public enum EnumSample {
  MONDAY(10, "Monday"),
  TUESDAY(20, "Tuesday"),
  WEDNESDAY(30, "Wednesday"),
  THURSDAY(40, "Thursday"),
  FRIDAY(50, "Friday"),
  SATURDAY(60, "Saturday"),
  SUNDAY(70, "Sunday");

  # remember the variable, method constructor written here is individual item (MONDAY, TUESDAY..) not for whole enum
  private int value;
  private String name;

  EnumSample(int value, String name) {
    this.value = value;
    this.name = name;
  }

  public int getVal() { return value; }
  public String getName() { return name; }
}

public class Main {
  public static void main(String[] args) {
    System.out.println(EnumSample.MONDAY.getVal()); // 10
    System.out.println(EnumSample.MONDAY.getName()); // Monday
  }
}


# override enum methods

public enum EnumSample {
  MONDAY(10, "Monday"),
  TUESDAY(20, "Tuesday"),
  WEDNESDAY(30, "Wednesday") {
    # override the method
    @Override
    public String getName() {
      return "THIS IS WEDNESDAY";
    }
  },
  THURSDAY(40, "Thursday"),
  FRIDAY(50, "Friday"),
  SATURDAY(60, "Saturday"),
  SUNDAY(70, "Sunday");

  # remember the variable, method constructor written here is individual item (MONDAY, TUESDAY..) not for whole enum
  private int value;
  private String name;

  EnumSample(int value, String name) {
    this.value = value;
    this.name = name;
  }

  public int getVal() { return value; }
  public String getName() { return name; }
}

public class Main {
  public static void main(String[] args) {
    System.out.println(EnumSample.MONDAY.getVal()); // 10
    System.out.println(EnumSample.MONDAY.getName()); // Monday
  }
}

# enum with abstract method
public enum EnumSample {
  MONDAY {
    @Override
    public void print() {  }
  },
  TUESDAY {
    @Override
    public void print() {  }
  },
  WEDNESDAY {
    @Override
    public void print() {  }
  };

  public abstract void print();
}

# enum with interface
interface InterfaceSample {
  public void print();
}

public enum EnumSample implements InterfaceSample {
  MONDAY {
    @Override
    public void print() {  }
  };
}


# ----------------
NOTE: A final class cannot be inherited.

public final class FinalClass {}
public class SomeClass extends FinalClass { } // This will throw error

# ----------------

# singelton class
# 1. A class which has only one instance and provides a global point of access to it is called as singleton class
# 2. We can create a singleton class by following ways
  # 1. Eager initialization
  # 2. Lazy initialization
  # 3. Thread safe singleton
  # 4. Bill Pugh Singleton Implementation

# 1. Eager initialization
  public class Singleton {
    private static final Singleton instance = new Singleton();

    private Singleton() {}
    public static Singleton getInstance() { return instance; }
  }

# This is not thread safe
# 2. Lazy initialization
  public class Singleton {
    private static Singleton instance;

    private Singleton() {}
    public static Singleton getInstance() { return instance == null ? new Singleton() : instance; }
  }

# This is thread safe but it is not efficient since we are locking the whole method
# 3. Thread safe singleton
  public class Singleton {
    private static Singleton instance;

    private Singleton() {}
    synchronized public static Singleton getInstance() { return instance == null ? new Singleton() : instance; }
  }

# Bill Pugh Singleton Implementation
  public class Singleton {
    private Singleton() {}

    private static class SingletonHelper {
      private static final Singleton INSTANCE = new Singleton();
    }

    public static Singleton getInstance() { return SingletonHelper.INSTANCE; }
  }

# 5. Enum Singleton

enum EnumSingleton {
  INSTANCE;
}


# ----------------

# Immutable class
# 1. A class which cannot be changed after its creation is called as immutable class
# 2. We can create an immutable class by following ways
  # 1. By declaring the class as final
  # 2. By declaring all the instance variables as private
  # 3. By declaring a no argument constructor
  # 4. By declaring a constructor with all the instance variables as final
  # 5. By declaring a getter method for all the instance variables
  # 6. By declaring a setter method for all the instance variables

  public final class ImmutableClass {
    private final int id;
    private final String name;
    private final List<String> list;

    ImmutableClass(int id, String name, List<String> list) {
      this.id = id;
      this.name = name;
      this.list = list;
    }

    public int getId() { return id; }
    public String getName() { return name; }

    # here we are returning the new ArrayList since we don't want to return the original list
    # and we are not able to change the original list since it is final
    public List<String> getList() { return new ArrayList<>(list); }
  }

# ----------------

#


