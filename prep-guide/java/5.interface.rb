# Interface in java
# 1. Interface is used to achieve abstraction
# 2. We also achieve multiple inheritance using interface
# 3. We cannot create object of interface but we can store the reference of object of class that implements the interface

# interface declaration consists of
# 1. access modifier (public and default)
# 2. interface keyword
# 3. interface name
# 4. extends keyword
# 5. parent interface name
# 6. body of the interface

public interface NonFlyingBird extends Bird, LivingBeing { }

why we need interface?
# 1. To achieve abstraction: It helps to understand that what class must do but not how to do
# 2. To achieve multiple inheritance: A class can implement multiple interfaces

public interface NonFlyingBird extends Bird, LivingBeing {
  void fly();
}

class Penguin implements NonFlyingBird {
  void fly() {
    System.out.println("Penguin cannot fly");
  }
}

class Eagle implements NonFlyingBird {
  void fly() {
    System.out.println("Eagle can fly");
  }
}

class Main {
  public static void main(String[] args) {
    NonFlyingBird penguin = new Penguin();
    NonFlyingBird eagle = new Eagle();
    # Here we are invoking the fly method of the Penguin and Eagle class dynamically
    penguin.fly(); # Penguin cannot fly
    eagle.fly(); # Eagle can fly
  }
}


# Methods in interface
# 1. All methods in interface are implicitly public
# 2. We cannot declare method as final

# fields in interface
# 1. All fields in interface are implicitly public, static and final
# 2. We cannot declare fields as private

interface A {
  int MAX_HEIGHT = 10; // implicitly public, static and final we cannot change the value of MAX_HEIGHT
}

# ----------------------------------------------

# Interface definition & implementation

# You cannot lower the access modifier of the method in interface
# abstract class can implement interface, but it is not mandatory to implement all the methods of the interface

public interface Bird {
  public void fly();
}


public class Eagle implements Bird {
  @Override
  private void fly() { // This is not allowed because we cannot lower the access modifier of the method in interface
    System.out.println("Eagle can fly");
  }

  @Override
  public void fly() { // This is allowed because we are not lowering the access modifier of the method in interface
    System.out.println("Eagle can fly");
  }
}

# ----------------------------------------------
# Concrete class can implement interface, and it should implement all the methods of the interface

interface Bird {
  void fly();
  void numberOfWings();
}

abstract class Eagle implements Bird {
  @Override
  void fly() {}

  public abstract void numberOfLegs();
}

class Eagle extends WhiteEagle {
  @Override
  void numberOfWings() {}

  @Override
  void numberOfLegs() {}
}

# Nested interface in java
# Nested interface is an interface that is declared within a class or another interface
# It is used to group logically related interfaces together

# rules
# 1. A nested interface declared within a interface is public by default
# 2. A nested interface declared within a class can have all access modifiers
# 3. When you implemented outer interface, you need to implement all the methods of the nested interface and vice versa

public interface Bird {
  public void fly();

  public interface NonFlyingBird {
    public void canRun();
  }
}

public class Penguin implements Bird.NonFlyingBird {
  @Override
  public void canRun() {}
}


# Interface within a class

public class Bird {
  protected interface NonFlyingBird { # public, private, protected, default
    public void canRun();
  }
}

public class Penguin implements Bird.NonFlyingBird {
  @Override
  public void canRun() {}
}

# JAVA 8 features & JAVA 9 features
# 1. Default method in interface in JAVA 8

public interface Bird {
  # abstract method
  public void canRun();

  # default method
  default void fly() {
    System.out.println("Bird can fly");
  }
}

public class Penguin implements Bird {
  @Override
  public void canRun() {}

  # no need to implement fly method because it is already implemented in the interface
  @Override
  public void fly() {
    System.out.println("Penguin cannot fly");
  }
}

# when it is necessary to implement default method in the class
public interface LivingBeing {
  default void canRun() {
    System.out.println("LivingBeing can run");
  }
}

public interface Bird {
  default void canRun() {
    System.out.println("Bird can run");
  }
}

public class Penguin implements Bird, LivingBeing {
  @Override
  public void canRun() {
    System.out.println("Penguin can run"); # we need to implement this method because it will create ambiguity
  }
}

# another scenario when child class is not implementing the method of the interface
public interface LivingBeing {
  default void canRun() {
    System.out.println("LivingBeing can run");
  }
}

public interface Bird extends LivingBeing {
  void canRun();
}

public class Penguin implements Bird {
  @Override
  public void canRun() {
    System.out.println("Penguin can run"); # we need to implement this method because it is not implemented in the interface
  }
}

# 2. Static method in interface in JAVA 8
# 1. Static method in interface is used to provide the implementation of the method
# 2. We cannot override the static method in the class
# 3. We can access the static method using the interface name
# 4. It is public by default

public interface Bird {
  static void fly() {
    System.out.println("Bird can fly");
  }
}

public class Penguin implements Bird { }

public class Main {
  public static void main(String[] args) {
    Bird.fly();
  }
}

# 3. Private method and private static method in interface in JAVA 9
# 1. Private method in interface is used to provide the implementation of the method
# 2. We cannot override the private method in the class
# 3. We can access the private method using the interface name
# 4. It is private by default

public interface Bird {
  void fly(); # JAVA 8

  public default void canRun() { # JAVA 8
    System.out.println("Bird can run");
  }

  static void staticPublicMethod() {  } # JAVA 9

  private void privateMethod() { # JAVA 9
  }

  private static void privateStaticMethod() { # JAVA 9
  }
}

# ----------------------------------------------

# functional interface & lambda expression

# 1. Functional interface is an interface that has only one abstract method
# 2. It is also called as single abstract method (SAM) interface
# 3. We can have default, static and private method in functional interface

@FunctionalInterface
public interface Bird {
  void fly();
}

public class Penguin implements Bird {
  @Override
  public void fly() {}
}

# what is lambda expression?
# since functional interface has only one abstract method, we can use lambda expression to implement the method

public interface Bird {
  void fly();
}

public class Main {
  public static void main(String[] args) {
    Bird bird = () -> System.out.println("Bird can fly");
    bird.fly(); # Bird can fly
  }
}


