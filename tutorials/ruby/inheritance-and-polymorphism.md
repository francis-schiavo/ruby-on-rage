# Inheritance and Polymorphism

## Inheritance Basics

```ruby
class Animal
  def speak
    "Some generic animal sound"
  end

  def move
    "Moving..."
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end

  def fetch
    "Fetching ball"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end

  def climb
    "Climbing tree"
  end
end

dog = Dog.new
cat = Cat.new

puts dog.speak    # "Woof!"
puts cat.speak    # "Meow!"
puts dog.move     # "Moving..." (inherited)
puts cat.move     # "Moving..." (inherited)
```

## Method Overriding

```ruby
class Vehicle
  def start_engine
    "Engine started"
  end

  def stop_engine
    "Engine stopped"
  end
end

class ElectricCar < Vehicle
  def start_engine
    "Electric motor activated"
  end

  def charge_battery
    "Charging battery"
  end
end

car = ElectricCar.new
puts car.start_engine     # "Electric motor activated"
puts car.stop_engine      # "Engine stopped" (inherited)
puts car.charge_battery   # "Charging battery"
```

## Using super

```ruby
class Parent
  def initialize(name)
    super(name)  # Call parent initialize
    @age = age
  end

  def greet
    super + " and I'm #{age} years old"
  end
end

class Child < Parent
  def initialize(name, age)
    super(name)  # Call parent initialize
    @age = age
  end

  def greet
    super + " and I'm #{age} years old"
  end
end

child = Child.new("Alice", 10)
puts child.greet  # "Hello, I'm Alice and I'm 10 years old"
```

## Multiple Inheritance with Modules

Ruby doesn't support multiple inheritance, but uses mixins:

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

class Duck < Animal
  include Swimmable
  include Flyable
end

duck = Duck.new
puts duck.speak   # "Some generic animal sound" (inherited)
puts duck.swim    # "Swimming..." (from Swimmable)
puts duck.fly     # "Flying..." (from Flyable)
```

## Polymorphism

### Duck Typing

```ruby
class Dog
  def speak
    "Woof!"
  end
end

class Duck
  def speak
    "Quack!"
  end
end

def make_sound(animal)
  animal.speak
end

dog = Dog.new
duck = Duck.new

make_sound(dog)   # "Woof!"
make_sound(duck)  # "Quack!"
```

### Method Overloading (Simulated)

```ruby
class Calculator
  def add(a, b = 0, c = 0)
    a + b + c
  end
end

calc = Calculator.new
puts calc.add(1)        # 1
puts calc.add(1, 2)     # 3
puts calc.add(1, 2, 3)  # 6
```

## Abstract Classes (Simulated)

```ruby
class Shape
  def area
    raise NotImplementedError, "Subclasses must implement area"
  end

  def perimeter
    raise NotImplementedError, "Subclasses must implement perimeter"
  end
end

class Rectangle < Shape
  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end

  def perimeter
    2 * (@width + @height)
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius * @radius
  end

  def perimeter
    2 * Math::PI * @radius
  end
end

shapes = [Rectangle.new(4, 5), Circle.new(3)]
shapes.each { |shape| puts "Area: #{shape.area}" }
```

## Composition over Inheritance

```ruby
class Engine
  def start
    "Engine started"
  end

  def stop
    "Engine stopped"
  end
end

class Car
  def initialize
    @engine = Engine.new
  end

  def start
    @engine.start
  end

  def stop
    @engine.stop
  end
end

# Instead of:
# class Car < Engine
#   # ...
# end
```

## Method Resolution Order (MRO)

```ruby
module A
  def test
    "A"
  end
end

module B
  def test
    "B"
  end
end

class C
  include A
  include B
end

c = C.new
puts c.test  # "B" (last included module wins)
```

## Class Hierarchy

```ruby
class Animal
  def self.all_animals
    ObjectSpace.each_object(self).to_a
  end
end

class Dog < Animal; end
class Cat < Animal; end

dog = Dog.new
cat = Cat.new

puts Animal.all_animals.inspect
# Shows all Animal instances and subclasses
```

## Best Practices

- Favor composition over inheritance
- Use inheritance for "is-a" relationships
- Keep inheritance hierarchies shallow
- Use modules for shared behavior
- Override methods thoughtfully
- Use super when extending parent behavior
- Implement abstract methods in subclasses
- Test polymorphic behavior
- Document inheritance relationships
- Consider the Liskov Substitution Principle

Ruby's inheritance and polymorphism features allow for flexible, maintainable object-oriented design while avoiding some of the pitfalls of traditional inheritance-heavy languages.
