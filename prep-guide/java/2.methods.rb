# How to define method in java?

public int sum(int a, int b) throws Exception {
  return a + b;
}

# public: access specifier
# int: return type
# sum: name of a method

# access specifier in java
  # public: If a access specifier is public then the method is accessible through any class in any package
  # private: The method is accessible only in the same class
  # protected: The method is accessible by other class in same package or subclass (children) in another package
  # default: It can be accessed by the classes in same package (It is the default access specifier)

# Name of the method: (It is recommended to declare it as verb & it should start from small letter or in camel case)

# Types of the methods

# 1. System Defined methods: Method which are already defined in the java library. For example, main method is a system defined method.
# 2. User defined methods: Method which are defined by the user. For example, sum method is a user defined method.
# 3. Overloaded method: Method which has the same name but different parameters. For example, sum method can be overloaded to accept different number of parameters.
# 4. Overridden method: Method which is defined in the parent class and redefined in the child class. For example, toString method is overridden in the child class.
# 5. Static method: Method which is defined with the static keyword. For example, main method is a static method.
                # static methods can only access static variables and static methods.
                # static method cannot be overridden but can be hidden.
# 7. Final method: Method which is defined with the final keyword. For example, toString method is a final method.
                # final method cannot be overridden.
# 8. Abstract method: Method which is defined with the abstract keyword. For example, toString method is an abstract method.
                # We only declare the method in the class but do not define it.
                # The definition of the method is done in the child class.


# Constructor in java

# Constructor is a special method which is used to initialize the object. It is called when an object of the class is created.
# Constructor has the same name as the class and does not have a return type.
# Constructor cannot be static, final or abstract, synchronized.
# We can create private constructor to restrict the object creation. or to make the class singleton
# We can call the parent class constructor from child class using super keyword

# Constructor Chaining

class Employee {
  int id;
  String name;

  Employee { this(56); }

  Employee(int id) { this(id, "Some Name"); }

  Employee(int id, String name) {
    this.id = id;
    this.name = name;
  }
}

