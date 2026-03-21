# Advanced Topics

## Metaprogramming

### Dynamic Method Definition

```ruby
class Person
  attr_accessor :name, :age

  # Define methods dynamically
  %w[name age].each do |attr|
    define_method("#{attr}=") do |value|
      instance_variable_set("@#{attr}", value)
    end

    define_method(attr) do
      instance_variable_get("@#{attr}")
    end
  end
end
```

### method_missing

```ruby
class DynamicHash
  def initialize
    @data = {}
  end

  def method_missing(name, *args)
    if name.to_s.end_with?('=')
      @data[name.to_s.chop.to_sym] = args.first
    else
      @data[name]
    end
  end
end

hash = DynamicHash.new
hash.name = "John"
puts hash.name  # "John"
```

### eval and class_eval

```ruby
# instance_eval
obj = Object.new
obj.instance_eval do
  def hello
    "Hello from instance_eval"
  end
end

# class_eval
String.class_eval do
  def shout
    upcase + "!"
  end
end

puts "hello".shout  # "HELLO!"
```

## Reflection and Introspection

### Getting Class Information

```ruby
class MyClass
  def method1; end
  def method2; end
end

obj = MyClass.new

# Get class
puts obj.class  # MyClass

# Get methods
puts obj.methods.grep(/^method/)  # [:method1, :method2]

# Check if method exists
puts obj.respond_to?(:method1)  # true

# Get instance variables
obj.instance_variable_set(:@var, "value")
puts obj.instance_variables  # [:@var]
```

### Runtime Class Modification

```ruby
class String
  def palindrome?
    self == reverse
  end
end

puts "radar".palindrome?  # true
puts "hello".palindrome?  # false
```

## Threads and Concurrency

### Basic Threading

```ruby
threads = []

3.times do |i|
  threads << Thread.new do
    puts "Thread #{i} running"
    sleep 1
    puts "Thread #{i} finished"
  end
end

threads.each(&:join)
```

### Thread Safety

```ruby
require 'thread'

class Counter
  def initialize
    @count = 0
    @mutex = Mutex.new
  end

  def increment
    @mutex.synchronize do
      @count += 1
    end
  end

  def value
    @mutex.synchronize do
      @count
    end
  end
end
```

### Fibers (Coroutines)

```ruby
fiber = Fiber.new do
  puts "Fiber started"
  Fiber.yield "First yield"
  puts "Fiber resumed"
  Fiber.yield "Second yield"
  "Fiber finished"
end

puts fiber.resume  # "First yield"
puts fiber.resume  # "Second yield"
puts fiber.resume  # "Fiber finished"
```

## Garbage Collection

### Manual GC

```ruby
# Force garbage collection
GC.start

# Disable GC
GC.disable

# Enable GC
GC.enable

# Get GC statistics
puts GC.stat
```

### Object Finalizers

```ruby
class Resource
  def initialize
    ObjectSpace.define_finalizer(self, proc { puts "Cleaning up" })
  end
end
```

## Performance Optimization

### Benchmarking

```ruby
require 'benchmark'

time = Benchmark.measure do
  # Code to benchmark
  100000.times { |i| i * i }
end

puts time  # Shows user, system, total, and real time
```

### Profiling

```ruby
require 'ruby-prof'

RubyProf.start
# Code to profile
result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
```

### Memory Usage

```ruby
# Get memory usage
puts "Memory usage: #{`ps -o rss= -p #{Process.pid}`.to_i} KB"
```

## DSL Creation

### Simple DSL

```ruby
class PizzaDSL
  def initialize
    @toppings = []
    @size = :medium
  end

  def size(size)
    @size = size
  end

  def topping(*toppings)
    @toppings.concat(toppings)
  end

  def build
    "Pizza: #{@size} with #{@toppings.join(', ')}"
  end
end

def pizza(&block)
  dsl = PizzaDSL.new
  dsl.instance_eval(&block)
  dsl.build
end

puts pizza do
  size :large
  topping :pepperoni, :mushrooms, :cheese
end
```

## C Extensions

### Basic C Extension

```c
// ext/my_extension/my_extension.c
#include <ruby.h>

VALUE method_hello(VALUE self) {
    return rb_str_new2("Hello from C!");
}

void Init_my_extension() {
    VALUE module = rb_define_module("MyExtension");
    rb_define_module_function(module, "hello", method_hello, 0);
}
```

```ruby
# extconf.rb
require 'mkmf'
create_makefile('my_extension')
```

## Ruby Internals

### Object Model

```ruby
class MyClass
  # All methods are defined on the class
end

obj = MyClass.new
puts obj.class        # MyClass
puts MyClass.class    # Class
puts Class.class      # Class
```

### Method Lookup Chain

```ruby
class Parent
  def method
    "Parent"
  end
end

class Child < Parent
  # Inherits method from Parent
end

module Mixin
  def method
    "Mixin"
  end
end

class Child
  include Mixin  # Mixin method takes precedence
end

obj = Child.new
puts obj.method  # "Mixin"
```

## Best Practices

- Use metaprogramming judiciously
- Prefer composition over monkey-patching
- Be careful with threads and shared state
- Profile before optimizing
- Document DSLs clearly
- Test advanced features thoroughly
- Consider performance implications
- Keep code readable and maintainable

Advanced Ruby features provide powerful capabilities but should be used thoughtfully. Understanding these concepts will help you write more sophisticated and efficient Ruby code.
