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


