# Primitive Data Types

  # bytes: 1 byte (8 bits) (default: 0)
  # char: 2 bytes
  # int: 4 bytes (default: 0)
  # short: 2 bytes (default: 0)
  # long: 8 bytes (default: 0) (add 'l' literal after assigning value to identify it as long)
  # char: 2 bytes (default: '\u0000')

  # For class member variable default value is 0 but we need to assign the value to class method variable else it will throw error

  # NEVER USE float and double for monetary values use BigInteger instead
  # float: 4 bytes (default: 0.0f) (add 'f' literal after assigning value to identify it as float)
  # double: 8 bytes (default: 0.0d) (add 'd' literal after assigning value to identify it as double)

  # boolean: 1 bit (default: false)

# Conversion in Java (When you go from low memory to high memory, it is implicit conversion and when you go from high memory to low memory, it is explicit conversion)
  # byte to short: implicit conversion
  # short to int: implicit conversion
  # int to long: implicit conversion
  # long to float: implicit conversion
  # float to double: implicit conversion
  # char to int: implicit conversion

  # int to char: explicit conversion
  # char to byte: explicit conversion
  # int to byte: explicit conversion
  # long to int: explicit conversion
  # float to int: explicit conversion
  # double to float: explicit conversion
  # boolean to int: explicit conversion
  # boolean to char: explicit conversion
  # boolean to byte: explicit conversion
  # boolean to short: explicit conversion
  # boolean to long: explicit conversion
  # boolean to float: explicit conversion


# auto promoting
  byte a = 127;
  byte b = 1;
  byte c = a + b; # error: incompatible types: possible lossy conversion from int to byte

  byte d = (byte) (a + b); # explicit conversion
  # OR
  int d =  (a + b); # implicit conversion

# Types of variables
  # local variable: declared inside a method, constructor or block
  # instance variable: declared inside a class but outside a method
  # static variable: declared inside a class with the static keyword

class Employee {
  public static int id; // class member variable
  public int rollNumber; // instance variable

  public static rollNumber() {
    int rollNumber = 0; // local variable
  }

  Employee() {} // default constructor
}


# Advance float and double

# How float and double are stored in memory?
# float (32 bits) IEEE754 = 1 bit sign + 8 bits exponent + 23 bits mantissa

# Eg: store 4.125f in float
  # step 1: convert 4 to binary (100)
  # step 2: convert 0.125 to binary (0.001)
  # step 3: combine both (100.001)
  # step 4: convert to scientific notation (1.00001 * 2^2)
  # step 5: add bias (127 + 2 = 129 = 10000001)
  # step 6: convert mantissa to binary (00001000000000000000000)
  # step 7: combine all (1 10000001 00001000000000000000000)


# Non Premitive Data Types
  # Here in reference data types, the variable does not store the value but it stores the address of the object in the heap memory.
  # The object is created in heap memory and the reference variable is created in stack memory.
  # Reference Data Types (class, interface, string, array)

  # String:
  # String are immutable in java
  # lets take and example of string
    String str = "Hello";
    String str2 = "Hello";
  # Here what java does when you created str it stores in heap memory as string constant pool
  # when you created str2 it checks in the heap memory if the string is already present or not
  # if it is present then it will not create a new object in heap memory
  # but when you do
    String str3 = new String("Hello");
  # it will create a new object in heap memory and str3 will point to that object


  # Interface in java
  # We use interface to define that which method class should override on implementing interface
  # Interface is a contract between the class and the interface
  # Interface is a reference data type
  # Interface can have abstract methods and static final variables
  # Interface can extend multiple interfaces
  # Interface can not be instantiated
  # Interface can not have constructor
  # Interface can not have instance variables
  # Interface can have default methods and static methods
  # Interface can not have private methods
  # Interface can have private methods

  # Eg:
  public interface Person {
    public String profession(); // abstract method
  }

  class Engineer implements Person {
    @Override
    public String profession() {
      return "Engineer";
    }
  }

  class Doctor implements Person {
    @Override
    public String profession() {
      return "Doctor";
    }
  }

  class Main {
    public static void main(String[] args) {
      Person person = new Engineer();
      System.out.println(person.profession());
      person = new Doctor();
      System.out.println(person.profession());
    }
  }

  Engineer e = new Engineer();
  Doctor d = new Doctor();
  Person p = new Engineer(); // valid
  Person p = new Doctor(); // valid
  Person p = new Person(); // error: Person is abstract; cannot be instantiated
  Engineer e = new Person(); // error: incompatible types: Person cannot be converted to Engineer


# Array in Java
  int [] arr = new int[5]; // array of 5 integers
  # Here it allocates 5 blocks of memory in heap memory
  # and arr will point to the first block of memory

  # 2D array
  int [][] arr = new int[5][5]; // array of 5x5 integers
  # Here it allocates 5 blocks of memory in heap memory
  # and arr will point to the first block of memory
  # and each block will point to another 5 blocks of memory

# Wrapper class in java
  1. Wrapper class is a class that wraps a primitive data type into an object
  2. Wrapper class is used to convert primitive data type into object
  3. Wrapper class is used to convert object into primitive data type
  4. Wrapper class is used to convert string into primitive data type
  5. Wrapper class is used to convert primitive data type into string
  6. Wrapper class is used to convert string into object
  7. Wrapper class is used to convert object into string

# Why we need wrapper class?
  # In case of premitive data types let consider this example
  class Main {
    public static void main(String[] args) {
      int a = 10;
      modify(a);
      System.out.println(a); // 10 since a is passed by value not by reference

      # so to handle this we need to use wrapper class
      Integer b = 10; // here a is an object of Integer class
      modifyInteger(b);
      System.out.println(b); // 20
    }

    public static modify(int a) {  a = 20; } // here a is passed by value
    public static modifyInteger(Integer a) {  a = 20; } // here a is passed by reference
  }

  # int a = 10;
  # Integer b = a (This is called as auto-boxing)
  # int c = b (This is called as unboxing)
