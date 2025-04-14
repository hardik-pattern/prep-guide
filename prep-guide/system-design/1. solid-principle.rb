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








