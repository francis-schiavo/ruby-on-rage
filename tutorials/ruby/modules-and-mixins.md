# Modules and Mixins

## What are Modules?

Modules are containers for methods, constants, and other modules. They cannot be instantiated like classes.

```ruby
module MathUtils
  PI = 3.14159

  def self.circle_area(radius)
    PI * radius * radius
  end

  def square(n)
    n * n
  end
end

puts MathUtils::PI              # 3.14159
puts MathUtils.circle_area(5)   # 78.53975
```

## Namespacing

Modules prevent name conflicts:

```ruby
module Graphics
  class Circle
    def draw
      "Drawing a circle"
    end
  end
end

module Audio
  class Circle
    def play
      "Playing a circle sound"
    end
  end
end

Graphics::Circle.new.draw  # "Drawing a circle"
Audio::Circle.new.play     # "Playing a circle sound"
```

## Mixins with include

Include adds module methods as instance methods:

```ruby
module Swimmable
  def swim
    "Swimming..."
  end
end

module Flyable
  def fly
    "Flying..."
  end
end

class Duck
  include Swimmable
  include Flyable
end

duck = Duck.new
puts duck.swim  # "Swimming..."
puts duck.fly   # "Flying..."
```

## Mixins with extend

Extend adds module methods as class methods:

```ruby
module ClassMethods
  def create(name)
    new(name)
  end
end

class Person
  extend ClassMethods

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

person = Person.create("John")  # Uses extended method
puts person.name                # "John"
```

## Mixins with prepend

Prepend adds module methods that can override class methods:

```ruby
module Override
  def greet
    "Hello from module!"
  end
end

class Person
  prepend Override

  def greet
    "Hello from class!"
  end
end

person = Person.new
puts person.greet  # "Hello from module!" (module wins)
```

## Module Methods

```ruby
module Calculator
  def self.add(a, b)
    a + b
  end

  def self.multiply(a, b)
    a * b
  end
end

puts Calculator.add(2, 3)      # 5
puts Calculator.multiply(2, 3) # 6
```

## Module Constants

```ruby
module Config
  DATABASE_URL = "postgresql://localhost/myapp"
  API_KEY = "secret123"
end

puts Config::DATABASE_URL
```

## Module Functions

```ruby
module Utils
  def self.helper_method
    "I'm a module method"
  end

  def instance_helper
    "I'm an instance method"
  end
end

# Include for instance methods
class MyClass
  include Utils
end

obj = MyClass.new
puts obj.instance_helper  # "I'm an instance method"

# Extend for class methods
class MyClass2
  extend Utils
end

puts MyClass2.helper_method  # "I'm a module method"
```

## Hook Methods

### included

Called when module is included:

```ruby
module MyMixin
  def self.included(base)
    puts "#{self} was included in #{base}"
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_method
      "Class method from mixin"
    end
  end
end

class MyClass
  include MyMixin
end
# Output: MyMixin was included in MyClass

puts MyClass.class_method  # "Class method from mixin"
```

### extended, prepended

Similar hooks for extend and prepend.

## Module Composition

```ruby
module Database
  def connect
    "Connecting to database..."
  end
end

module Logger
  def log(message)
    puts "[LOG] #{message}"
  end
end

class Application
  include Database
  include Logger
end

app = Application.new
app.connect
app.log("Application started")
```

## Refinements (Ruby 2.0+)

Refinements allow scoped monkey-patching:

```ruby
module StringRefinements
  refine String do
    def shout
      upcase + "!"
    end
  end
end

class MyClass
  using StringRefinements

  def process
    "hello".shout  # "HELLO!"
  end
end

puts MyClass.new.process  # "HELLO!"

# Outside the class, shout method is not available
# "hello".shout  # NoMethodError
```

## Best Practices

- Use modules for namespacing
- Create mixins for shared behavior
- Prefer composition over inheritance
- Use included hook for setup
- Keep modules focused and small
- Use refinements sparingly
- Document module usage
- Test mixin behavior
- Avoid deep module hierarchies
- Use meaningful module names

Modules are a powerful feature in Ruby that enable code reuse, organization, and clean design patterns like mixins and namespacing.
