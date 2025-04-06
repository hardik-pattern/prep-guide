# Exception handling in java
# Object is the super class and it has child class as Throwable
  # Throwable has two child class as Exception and Error
  # Exception is further divided into checked and unchecked exception
  # Checked exception are expected to be caught
  # Unchecked exception are not expected to be caught and are programming errors

# What is difference between error and exception?
  # Error are those that you cannot control (OutOfMemoryError, StackOverflowError)
  # Exception is expected to be caught and are non-fatal errors

# Tree Structure of Java Exception Hierarchy:
#
# Object
# └── Throwable
#     ├── Exception
#     │   ├── Checked Exceptions (Compile time exceptions)
#     │   │   ├── IOException
#     │   │   ├── SQLException
#     │   │   └── ClassNotFoundException
#     │   └── Unchecked Exceptions (Runtime exceptions)
#     │       ├── NullPointerException
#     │       ├── ArrayIndexOutOfBoundsException
#     │       └── IllegalArgumentException
#     └── Error
#         ├── OutOfMemoryError
#         ├── StackOverflowError
#         └── VirtualMachineError


# throwing and handling the exception
# try catch finally block
# finally block is always executed whether the exception is caught or not, or you return from the method

class Main(){
  public static void main(String[] args){
    try{
      method();
    } catch(ClassNotFoundException e){
      System.out.println("Class not found");
    } catch(IOException e){
      System.out.println("IO exception");
    } finally{
      System.out.println("Finally block");
    }

    # or we can use

    try{
      method();
    } catch(ClassNotFoundException | IOException e){
      System.out.println("Exception");
    } finally{
      System.out.println("Finally block");
    }
  }

  private static void method() throws ClassNotFoundException, IOException{
    throw new ClassNotFoundException("Class not found");
  }
}

# creating custom exception

class MyException extends Exception{
  public MyException(String message){
    super(message);
  }
}

