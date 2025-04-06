# annotation in java
  # annotation is a way to add metadata to the code
  # it is used to provide information about the code
  # it is not part of the code itself
  # it is used to provide information to the compiler
  # it is used to provide information to the runtime

# Types of annotations:
#   - Built-in annotations:
#                         Used on annotations (meta annotations)- @Retention, @Target, @Inherited, @Documented
#                         Used on java code (built-in annotations)- @Override, @Deprecated, @SuppressWarnings
#   - Custom annotations:

# Annotation used on java code:
#   - @Override:
#                         Used to indicate that a method is overriding a method in a superclass
#   - @Deprecated:
#                         Used to indicate that a method is deprecated
#   - @SuppressWarnings:
#                         Used to suppress warnings
#   - @FunctionalInterface:
#                         Used to indicate that an interface is a functional interface
#   - @SafeVarargs:
#                         Used to indicate that a method is safe to use with varargs
#   - @Repeatable:
#                         Used to indicate that an annotation can be repeated

# Meta Annotation: Annotation used over another annotation
#   - @Retention:
#                         Used to indicate the retention policy of the annotation
                            # RetentionPolicy.SOURCE- Annotation is not retained in the class file
                            # RetentionPolicy.CLASS- Annotation is retained in the class file
                            # RetentionPolicy.RUNTIME- Annotation is retained in the class file and can be accessed at runtime
#   - @Target:
#                         Used to indicate the target of the annotation
                            # ElementType.TYPE- Class, Interface, Enum
                            # ElementType.FIELD- Field
                            # ElementType.METHOD- Method
                            # ElementType.PARAMETER- Parameter
                            # ElementType.CONSTRUCTOR- Constructor
                            # ElementType.LOCAL_VARIABLE- Local Variable
                            # ElementType.ANNOTATION_TYPE- Annotation
                            # ElementType.PACKAGE- Package
#   - @Inherited:
#                         Used to indicate that the annotation is inherited
                            # @Inherited is used on a class, interface or enum
                            # @Inherited is not used on a method, field, parameter or constructor
#   - @Documented:
#                         Used to indicate that the annotation is documented
                            # @Documented is used on a class, interface or enum
                            # @Documented is not used on a method, field, parameter or constructor
#   - @Repeatable:
#                         Used to indicate that the annotation can be repeated
                            # @Repeatable is used on a class, interface or enum
                            # @Repeatable is not used on a method, field, parameter or constructor

# Creating a custom annotation:
#    public @interface AnnotationName {
#      String value();
#   }

# Using a custom annotation:
#    @AnnotationName(value = "value")
#    public class ClassName {
#      // code
#   }

# Annotation with default value:
#    public @interface AnnotationName {
#      String value() default "default value";
#   }

# Annotation with multiple values:
#    public @interface AnnotationName {
#      String[] value();
#   }

# Annotation with multiple values and default value:
#    public @interface AnnotationName {
#      String[] value() default {"default value 1", "default value 2"};
#   }












