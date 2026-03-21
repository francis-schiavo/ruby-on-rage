# Exception Handling

## What are Exceptions?

Exceptions are Ruby's way of handling errors and unexpected situations during program execution.

## Basic Exception Handling

```ruby
begin
  # Code that might raise an exception
  result = 10 / 0
rescue
  puts "An error occurred"
end
```

## Specific Exception Types

```ruby
begin
  file = File.open("nonexistent.txt")
rescue Errno::ENOENT
  puts "File not found"
rescue Errno::EACCES
  puts "Permission denied"
end
```

## Exception Objects

```ruby
begin
  1 / 0
rescue ZeroDivisionError => e
  puts "Error: #{e.message}"
  puts "Backtrace: #{e.backtrace.first}"
end
```

## Multiple Rescue Clauses

```ruby
begin
  # risky code
rescue ZeroDivisionError
  puts "Division by zero"
rescue ArgumentError
  puts "Invalid argument"
rescue => e
  puts "Other error: #{e.message}"
end
```

## Ensure Clause

Code that always runs, regardless of exceptions:

```ruby
file = nil
begin
  file = File.open("example.txt", "w")
  file.write("Hello, World!")
rescue IOError => e
  puts "IO Error: #{e.message}"
ensure
  file.close if file
  puts "File operation completed"
end
```

## Else Clause

Code that runs only if no exceptions occur:

```ruby
begin
  result = 10 / 2
rescue ZeroDivisionError
  puts "Division by zero"
else
  puts "Division successful: #{result}"
ensure
  puts "Operation completed"
end
```

## Raising Exceptions

```ruby
def divide(a, b)
  raise ArgumentError, "Division by zero" if b == 0
  a / b
end

begin
  divide(10, 0)
rescue ArgumentError => e
  puts e.message  # "Division by zero"
end
```

## Custom Exceptions

```ruby
class CustomError < StandardError
end

class ValidationError < StandardError
  attr_reader :field

  def initialize(field, message)
    @field = field
    super(message)
  end
end

def validate_user(user)
  raise ValidationError.new(:email, "Invalid email") unless user[:email] =~ /\A[^@\s]+@[^@\s]+\z/
end

begin
  validate_user({email: "invalid"})
rescue ValidationError => e
  puts "Validation failed for #{e.field}: #{e.message}"
end
```

## Retry

```ruby
attempts = 0
begin
  attempts += 1
  # Code that might fail
  1 / 0
rescue ZeroDivisionError
  retry if attempts < 3
  puts "Failed after #{attempts} attempts"
end
```

## Exception Hierarchy

```
Exception
├── NoMemoryError
├── ScriptError
│   ├── LoadError
│   ├── NotImplementedError
│   └── SyntaxError
├── SecurityError
├── SignalException
├── StandardError
│   ├── ArgumentError
│   ├── IOError
│   │   ├── EOFError
│   │   └── Errno::*
│   ├── IndexError
│   │   └── StopIteration
│   ├── LocalJumpError
│   ├── NameError
│   │   └── NoMethodError
│   ├── RangeError
│   │   └── FloatDomainError
│   ├── RegexpError
│   ├── RuntimeError
│   ├── SystemCallError
│   │   └── Errno::*
│   ├── ThreadError
│   ├── TypeError
│   └── ZeroDivisionError
├── SystemExit
└── SystemStackError
```

## Best Practices

### Rescue Specific Exceptions

```ruby
# Bad
begin
  # code
rescue
  # catches everything
end

# Good
begin
  # code
rescue StandardError => e
  # handles expected errors
end
```

### Use Ensure for Cleanup

```ruby
# Bad
begin
  file = File.open("file.txt")
  # process file
rescue
  # handle error
end
file.close

# Good
begin
  file = File.open("file.txt")
  # process file
rescue
  # handle error
ensure
  file.close if file
end
```

### Don't Suppress Exceptions

```ruby
# Bad - silently ignores errors
begin
  risky_operation
rescue
  # do nothing
end

# Good - log and handle appropriately
begin
  risky_operation
rescue => e
  logger.error("Operation failed: #{e.message}")
  raise  # re-raise if needed
end
```

### Create Meaningful Custom Exceptions

```ruby
class PaymentError < StandardError
  attr_reader :payment_id

  def initialize(payment_id, message = "Payment failed")
    @payment_id = payment_id
    super(message)
  end
end
```

### Use Exception for Flow Control Sparingly

Exceptions should be for exceptional situations, not normal flow control.

## Exception Safety

```ruby
class SafeArray
  def initialize
    @data = []
  end

  def [](index)
    raise IndexError, "Index out of bounds" if index < 0 || index >= @data.length
    @data[index]
  end

  def []=(index, value)
    raise IndexError, "Index out of bounds" if index < 0
    @data[index] = value
  end
end
```

## Logging Exceptions

```ruby
require 'logger'

logger = Logger.new(STDOUT)

begin
  # risky code
rescue => e
  logger.error("Exception occurred: #{e.class.name}: #{e.message}")
  logger.error(e.backtrace.join("\n"))
end
```

Proper exception handling is crucial for building robust Ruby applications. Always catch specific exceptions, clean up resources in ensure blocks, and provide meaningful error messages.
