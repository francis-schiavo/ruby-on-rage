# Data Types and Variables

## Variables

### Local Variables

Start with lowercase letter or underscore:

```ruby
name = "Ruby"
_age = 25
my_variable = "value"
```

### Instance Variables

Start with `@`, belong to object instances:

```ruby
@name = "John"
@age = 30
```

### Class Variables

Start with `@@`, shared among all instances:

```ruby
@@count = 0
```

### Global Variables

Start with `$`, available everywhere:

```ruby
$global_var = "I'm global"
```

## Data Types

### Numbers

#### Integers

```ruby
integer = 42
negative = -10
binary = 0b1010    # 10
octal = 0o12       # 10
hex = 0xA          # 10
```

#### Floats

```ruby
float = 3.14
scientific = 1.23e-4
```

#### BigDecimal (for precision)

```ruby
require 'bigdecimal'
precise = BigDecimal('0.1') + BigDecimal('0.2')  # Accurate
```

### Strings

```ruby
single_quotes = 'Hello'
double_quotes = "Hello #{name}"  # Interpolation
multiline = <<~HEREDOC
  This is a
  multiline string
HEREDOC
```

### Symbols

Immutable strings, efficient for keys:

```ruby
:key
:"symbol with spaces"
```

### Arrays

Ordered collections:

```ruby
empty_array = []
numbers = [1, 2, 3, 4, 5]
mixed = [1, "two", :three, [4, 5]]
```

### Hashes

Key-value pairs:

```ruby
empty_hash = {}
person = { name: "John", age: 30 }
old_style = { "name" => "John", "age" => 30 }
```

### Ranges

```ruby
inclusive = 1..10    # 1, 2, 3, ..., 10
exclusive = 1...10   # 1, 2, 3, ..., 9
letters = 'a'..'z'
```

### Booleans

```ruby
true_value = true
false_value = false
```

### Nil

Represents absence of value:

```ruby
nothing = nil
```

## Type Conversion

```ruby
# To string
42.to_s          # "42"
3.14.to_s        # "3.14"

# To integer
"42".to_i        # 42
3.14.to_i        # 3

# To float
"3.14".to_f      # 3.14
42.to_f          # 42.0

# To symbol
"key".to_sym     # :key
```

## Variable Scope

### Local Scope

Variables defined in methods are local to that method.

### Block Scope

Variables in blocks can be local or capture outer scope.

### Instance Variables

Available throughout the instance.

### Class Variables

Shared across class and instances.

## Constants

```ruby
PI = 3.14159
MAX_SIZE = 100

# Can be changed but Ruby warns
PI = 3.14  # warning: already initialized constant
```

## Duck Typing

Ruby focuses on behavior, not type:

```ruby
def print_length(obj)
  puts obj.length  # Works if obj responds to length
end

print_length("string")    # 6
print_length([1, 2, 3])   # 3
```

## Truthiness

In Ruby, only `false` and `nil` are falsy:

```ruby
if 0        # true
if ""       # true
if []       # true
if false    # false
if nil      # false
```

## Variable Naming Conventions

- **snake_case**: variables, methods
- **CamelCase**: classes, modules
- **SCREAMING_SNAKE_CASE**: constants
- **Symbols**: :snake_case

## Variable Assignment

### Multiple Assignment

```ruby
a, b, c = 1, 2, 3
first, *rest = [1, 2, 3, 4]  # first=1, rest=[2,3,4]
```

### Swapping

```ruby
a, b = b, a
```

### Default Values

```ruby
name ||= "Default"
```

Understanding Ruby's data types and variable scoping is crucial for writing effective Ruby code. Ruby's dynamic typing and duck typing philosophy make it flexible and expressive.
