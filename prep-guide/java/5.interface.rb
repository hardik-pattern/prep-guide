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
