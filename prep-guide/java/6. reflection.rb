# Reflection is a process of examining or modifying the runtime behavior of classes, interfaces, and objects at runtime.

# Class class: The instance of the class 'Class' represents the class itself during runtime.

# what are the ways to get the instance of the class 'Class'?

class Bird { }

class Main {
  public static void main(String[] args) {
    Class birdClass = Class.forName("Bird")
    Class birdClass2 = Bird.class
    Class birdClass3 = new Bird().getClass()
  }
}


# Reflection of a method

class Bird {
  public String breed;
  public String canSwim;

  public void fly() {
    System.out.println("Bird can fly");
  }
}

class Main {
  public static void main(String[] args) {
    Class birdClass = Eagle.class;
    Method[] methods = birdClass.getMethods(); # we will get all the public methods of the class
  }
}


# We can get reflection of fields also

class Bird {
  public String breed;
  public String canSwim;
}

class Main {
  public static void main(String[] args) {
    Class birdClass = Bird.class;
    Field[] fields = birdClass.getFields();
  }
}

# reflection of constructor

class Bird {
  public Bird() {
    System.out.println("Bird constructor");
  }
}

class Main {
  public static void main(String[] args) {
    Class birdClass = Bird.class;
    Constructor[] constructors = birdClass.getConstructors();

    Constructor constructor = constructors[0];
    System.out.println(constructor.getName());
    System.out.println(constructor.getParameterCount());
    System.out.println(constructor.getModifiers());
    System.out.println(constructor.getAnnotations());
    System.out.println(constructor.getDeclaredAnnotations());
    System.out.println(constructor.getDeclaredAnnotations());
    # Here we can break the access of the constructor, this can change the behavior of the singleton class
    constructor.setAccessible(true);
    constructor.newInstance();
  }
}
