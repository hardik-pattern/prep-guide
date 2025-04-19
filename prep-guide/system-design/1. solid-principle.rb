# SOLID Principle of Object Oriented Design
# S: Single Responsibility Principle
# O: Open/Closed Principle
# L: Liskov Substitution Principle
# I: Interface Segregation Principle
# D: Dependency Inversion Principle

# advantages:
# 1. Improved code readability and maintainability
# 2. Reduced code duplication
# 3. Increased code flexibility and reusability
# 4. Reduced coupling between classes
# 5. Improved testability

# --------------------------------------------------------------------------------------------------------------------

#* Single Responsibility Principle
# A class should have only one reason to change. It means it should have only one responsibility.

# consider the example of the marker & invoice class

class Marker {
  String name;
  String color;
  int price;
}

class Invoice {
  Marker marker;
  int quantity;

  double calculateTotal() {
    return marker.price * quantity;
  }

  public void printInvoice() {
    System.out.println("Invoice: " + marker.name + " " + marker.color + " " + marker.price + " " + quantity + " " + calculateTotal());
  }

  public void saveToDatabase() {
    System.out.println("Saving invoice to database");
  }
}

# In the above example the invoice has multiple responsibilities like printing, saving to database, calculating total.
# It violates the single responsibility principle.

# To fix this we can create a separate class for printing and saving to database.

class InvoiceDao {
  Invoice invoice;

  public void saveToDatabase() {
    System.out.println("Saving invoice to database");
  }
}

class Invoice {
  Marker marker;
  int quantity;

  double calculateTotal() {
    return marker.price * quantity;
  }
}

class InvoicePrinter {
  Invoice invoice;

  public void printInvoice() {
    System.out.println("Invoice: " + invoice.marker.name + " " + invoice.marker.color + " " + invoice.marker.price + " " + invoice.quantity + " " + invoice.calculateTotal());
  }
}

# Here we break the each responsibility into a separate class.
# This way we can change the print logic without affecting the other classes.
# We can also change the save logic without affecting the other classes.

# --------------------------------------------------------------------------------------------------------------------


#* Open/Closed Principle: Class should be open for extension but closed for modification.

# considering the above example now let's say we want to add a new feature to print the invoice in a different format.
# we are also saving the invoice in files so there is one way that we create a method saveToFile in InvoiceDao class.
# but this violates the open/closed principle.

# To fix this we can create a separate class for printing and saving to database.

interface InvoiceDao {
  public void save();
}

class DatabaseInvoiceDao implements InvoiceDao {
  public void save() {
    System.out.println("Saving invoice to database");
  }
}

class FileInvoiceDao implements InvoiceDao {
  public void save() {
    System.out.println("Saving invoice to file");
  }
}

# Now we can easily add a new class for saving to file.
# This way we are open for extension but closed for modification.

# --------------------------------------------------------------------------------------------------------------------


#* Liskov Substitution Principle: Subtypes must be substitutable for their base types.
# If there are 2 classes A & B, and B is a child of A, then we should be able to replace A with B without breaking the program.
# child class should extend the capabilities of parent class it should not narrow down the capabilities of parent class.

# consider the example of the rectangle & square class

interface Bike {
  public void turnOnEngine();
  public void accelerate();
}

class SportsBike implements Bike {
  public void turnOnEngine() {
    System.out.println("Turning on engine");
  }

  public void accelerate() {
    System.out.println("Accelerating");
  }
}

# Here cycle is a child class of Bike but it doesn't have a turnOnEngine method. It is reducing the capabilities of Bike class.
# This violates the Liskov Substitution Principle.

class Cycle implements Bike {
  public void turnOnEngine() {
    throw new UnsupportedOperationException("Cycle doesn't have an engine");
  }

  public void accelerate() {
    System.out.println("Pedaling");
  }
}

# --------------------------------------------------------------------------------------------------------------------


#* Interface Segregation Principle: Clients should not be forced to depend on interfaces that they do not use.
# A class should not implement an interface if it doesn't use all the methods of the interface.

# consider the example of restaurant & employee class

interface RestaurantEmployee {
  public void prepareFood();
  public void serveFood();
  public void washDishes();
}

class Waiter implements RestaurantEmployee {
  # Waiter doesn't prepare food so we are throwing an exception. This violates the interface segregation principle.
  # To fix this we can create a separate interface for prepare food.
  public void prepareFood() {
    throw new UnsupportedOperationException("Waiter doesn't prepare food");
  }

  public void serveFood() {
    System.out.println("Serving food");
  }
}


# Here is the fixed version of the code

interface WaiterInterface {
  public void serveFood();
}

interface ChefInterface {
  public void prepareFood();
}

class Waiter implements WaiterInterface {
  public void serveFood() {
    System.out.println("Serving food");
  }
}


class Chef implements ChefInterface {
  public void prepareFood() {
    System.out.println("Preparing food");
  }
}

# --------------------------------------------------------------------------------------------------------------------


#* Dependency Inversion Principle: High level modules should not depend on low level modules. Both should depend on abstractions.
# Abstractions should not depend on details. Details should depend on abstractions.

# dependency inversion principle is about reducing the coupling between classes.
# we should not depend on concrete classes, we should depend on abstractions(interfaces).

# consider the example of the car & engine class

# We have an interface Mouse and Keyboard.
# Mouse interface is implemented by WiredMouse and BluetoothMouse.
# Keyboard interface is implemented by WiredKeyboard and BluetoothKeyboard.

                            #         Mouse (interface)
                            #              |
                            #  +-----------+-----------+
                            #  |                       |
                            #  WiredMouse     BluetoothMouse

                            #         Keyboard (interface)
                            #              |
                            #  +-----------+-----------+
                            #  |                       |
                            #  WiredKeyboard     BluetoothKeyboard

# Now if we have a class MacBook

class MacBook {
  private WiredMouse mouse;
  private WiredKeyboard keyboard;

  # Now if we want to use BluetoothMouse and BluetoothKeyboard we can't do that because MacBook is dependent on WiredMouse and WiredKeyboard.
  # This violates the dependency inversion principle.
  public MacBook(WiredMouse mouse, WiredKeyboard keyboard) {
    this.mouse = mouse;
    this.keyboard = keyboard;
  }
}

# To fix this we can use dependency injection.
# We can pass the object of the class to the constructor of the class.

class MacBook {
  private Mouse mouse;
  private Keyboard keyboard;

  public MacBook(Mouse mouse, Keyboard keyboard) {
    this.mouse = mouse;
    this.keyboard = keyboard;
  }
}

# --------------------------------------------------------------------------------------------------------------------
# This is the cursor update autocomplete
# Here we cannot update the autocomplete
