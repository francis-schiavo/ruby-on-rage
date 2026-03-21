# Methods

## Defining Methods

```ruby
def method_name
  # code
end

def greet(name)
  "Hello, #{name}!"
end
```

## Method Parameters

### Required Parameters

```ruby
def add(a, b)
  a + b
end
```

### Default Parameters

```ruby
def greet(name = "World")
  "Hello, #{name}!"
end
```

### Variable Arguments (*args)

```ruby
def sum(*numbers)
  numbers.inject(0) { |sum, n| sum + n }
end

sum(1, 2, 3, 4)  # 10
```

### Keyword Arguments

```ruby
def create_user(name:, age: 18, email: nil)
  # code
end

create_user(name: "John", age: 25)
```

### Keyword Arguments with **kwargs

```ruby
def user_info(**attributes)
  attributes.each { |key, value| puts "#{key}: #{value}" }
end
```

## Return Values

Methods return the last evaluated expression:

```ruby
def add(a, b)
  a + b  # implicit return
end

def explicit_return
  return "early return"
  "this won't execute"
end
```

## Method Visibility

### Public Methods (default)

```ruby
def public_method
  "anyone can call me"
end
```

### Private Methods

```ruby
private

def private_method
  "only callable within this class"
end
```

### Protected Methods

```ruby
protected

def protected_method
  "callable by instances of same class or subclasses"
end
```

## Class Methods

```ruby
class MyClass
  def self.class_method
    "I'm a class method"
  end

  def instance_method
    "I'm an instance method"
  end
end

MyClass.class_method    # "I'm a class method"
obj = MyClass.new
obj.instance_method     # "I'm an instance method"
```

## Method Aliases

```ruby
alias old_name new_name

def original_method
  "original"
end

alias :old_method :original_method
```

## Method Missing

```ruby
class DynamicClass
  def method_missing(name, *args)
    puts "Called #{name} with #{args.inspect}"
  end
end

obj = DynamicClass.new
obj.any_method("arg")  # Called any_method with ["arg"]
```

## Blocks, Procs, and Lambdas

### Blocks

```ruby
def my_method
  yield if block_given?
end

my_method { puts "Block executed" }
```

### Procs

```ruby
my_proc = Proc.new { |x| x * 2 }
my_proc.call(5)  # 10
```

### Lambdas

```ruby
my_lambda = lambda { |x| x * 2 }
my_lambda.call(5)  # 10

# Or:
my_lambda = ->(x) { x * 2 }
```

## Method Objects

```ruby
class Calculator
  def add(a, b)
    a + b
  end
end

calc = Calculator.new
method_obj = calc.method(:add)
result = method_obj.call(2, 3)  # 5
```

## Operator Methods

```ruby
class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

p1 = Point.new(1, 2)
p2 = Point.new(3, 4)
p3 = p1 + p2  # (4, 6)
```

## Singleton Methods

```ruby
obj = "hello"
def obj.shout
  upcase
end

obj.shout  # "HELLO"
```

## Method Chaining

```ruby
class Chainable
  def initialize(value)
    @value = value
  end

  def add(n)
    @value += n
    self  # Return self for chaining
  end

  def multiply(n)
    @value *= n
    self
  end

  def result
    @value
  end
end

result = Chainable.new(5).add(3).multiply(2).result  # 16
```

## Best Practices

- Use descriptive method names
- Keep methods small and focused
- Use keyword arguments for complex methods
- Return meaningful values
- Use private methods for internal logic
- Document public methods
- Avoid too many parameters (max 3-4)
- Use method_missing sparingly
- Prefer lambdas over procs when possible

Ruby's method system is flexible and powerful, allowing for clean, readable code with great expressiveness.
