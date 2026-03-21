# Classes and Objects

## Defining Classes

```ruby
class Person
  # Class body
end
```

## Creating Objects (Instances)

```ruby
person = Person.new
```

## Instance Variables

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

person = Person.new("John", 30)
```

## Accessor Methods

### Manual Accessors

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end
```

### attr_reader, attr_writer, attr_accessor

```ruby
class Person
  attr_reader :name, :age
  attr_writer :name
  attr_accessor :email

  def initialize(name, age)
    @name = name
    @age = age
  end
end
```

## Instance Methods

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    "Hello, my name is #{name} and I'm #{age} years old."
  end

  def birthday
    @age += 1
  end
end

person = Person.new("John", 30)
puts person.greet      # "Hello, my name is John and I'm 30 years old."
person.birthday
puts person.age        # 31
```

## Class Variables and Methods

```ruby
class Person
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.create(name, age)
    new(name, age)
  end
end

person1 = Person.new
person2 = Person.new
puts Person.count      # 2
person3 = Person.create("Alice", 25)
```

## Class Constants

```ruby
class MathUtils
  PI = 3.14159
  E = 2.71828

  def self.circle_area(radius)
    PI * radius * radius
  end
end

puts MathUtils::PI     # 3.14159
puts MathUtils.circle_area(5)  # 78.53975
```

## Inheritance

```ruby
class Animal
  def speak
    "Some sound"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end
end

dog = Dog.new
cat = Cat.new
puts dog.speak    # "Woof!"
puts cat.speak    # "Meow!"
```

## Method Overriding

```ruby
class Parent
  def greet
    "Hello from parent"
  end
end

class Child < Parent
  def greet
    super + " and child"
  end
end

child = Child.new
puts child.greet  # "Hello from parent and child"
```

## Self

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.species
    "Homo sapiens"
  end

  def full_name
    "#{self.name} (#{self.class.species})"
  end
end

puts Person.species     # "Homo sapiens"
person = Person.new("John")
puts person.full_name   # "John (Homo sapiens)"
```

## Equality

```ruby
class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @x = x, y
  end

  def ==(other)
    other.is_a?(Point) && @x == other.x && @y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    [@x, @y].hash
  end
end
```

## to_s and inspect

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "#{name} (#{age})"
  end

  def inspect
    "#<Person name:#{name.inspect} age:#{age.inspect}>"
  end
end

person = Person.new("John", 30)
puts person      # John (30)
p person         # #<Person name:"John" age:30>
```

## Singleton Classes

```ruby
obj = "hello"
class << obj
  def shout
    upcase
  end
end

obj.shout  # "HELLO"
```

## Best Practices

- Use meaningful class and method names
- Keep classes small and focused (Single Responsibility Principle)
- Use inheritance sparingly, prefer composition
- Define initialize method for object setup
- Use attr_accessor judiciously
- Override ==, eql?, and hash for custom equality
- Implement to_s for meaningful string representation
- Use class constants for fixed values
- Keep instance variables private
- Use self consistently for class methods

Ruby's object-oriented system is powerful and flexible, allowing for clean, maintainable code with great expressiveness.
