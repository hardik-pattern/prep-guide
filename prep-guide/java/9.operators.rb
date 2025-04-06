# Tree Structure of Java Operators:
#
# Java Operators
# ├── Arithmetic Operators
# │   ├── Basic
# │   │   ├── + (Addition)
# │   │   ├── - (Subtraction)
# │   │   ├── * (Multiplication)
# │   │   ├── / (Division)
# │   │   └── % (Modulus)
# │   ├── Increment/Decrement
# │   │   ├── ++ (Increment)
# │   │   └── -- (Decrement)
# │   └── Compound Assignment
# │       ├── +=
# │       ├── -=
# │       ├── *=
# │       ├── /=
# │       └── %=
# ├── Assignment Operators
# │   ├── = (Simple Assignment)
# │   └── Compound Assignment
# │       ├── +=, -=, *=, /=, %=
# │       └── &=, |=, ^=, ~=, <<=, >>=, >>>=
# ├── Comparison Operators
# │   ├── == (Equal to)
# │   ├── != (Not equal to)
# │   ├── > (Greater than)
# │   ├── < (Less than)
# │   ├── >= (Greater than or equal to)
# │   └── <= (Less than or equal to)
# ├── Logical Operators
# │   ├── && (AND)
# │   ├── || (OR)
# │   └── ! (NOT)
# ├── Bitwise Operators
# │   ├── & (AND)
# │   ├── | (OR)
# │   ├── ^ (XOR) (if same bits is present then it will return 0 otherwise 1)
# │   ├── ~ (NOT) (it will return the complement of the number) formula: -(n + 1)
# │   ├── << (Left Shift) (it will shift the bits to the left side) formula: n * 2^k
# │   └── >> (Right Shift) (it will shift the bits to the right side) formula: n / 2^k
# │   └── >>> (Unsigned Right Shift) (it will shift the bits to the right side) formula: n / 2^k
# ├── Ternary Operator
# │   └── ?: (Conditional)
# └── instanceof Operator
#     └── instanceof (Type Comparison)

# precedence of operators
  # *, /, % have higher precedence than +, -
  # ==, !=, >, <, >=, <= have higher precedence than &&, ||, !
  # &&, || have higher precedence than ?:

# Tree Structure of Java Control Flow Statements:
#
# Control Flow Statements
# ├── Conditional Statements
# │   ├── if Statement
# │   │   └── Single condition check
# │   ├── if-else Statement
# │   │   ├── if block
# │   │   └── else block
# │   ├── if-else-if Statement
# │   │   ├── Multiple if conditions
# │   │   └── else block
# │   └── switch Statement
# │       ├── case labels
# │       ├── break statements
# │       └── default case
# └── Looping Statements
#     ├── for Loop
#     │   ├── Initialization
#     │   ├── Condition
#     │   └── Increment/Decrement
#     ├── while Loop
#     │   ├── Condition check
#     │   └── Loop body
#     └── do-while Loop
#         ├── Loop body
#         └── Condition check

