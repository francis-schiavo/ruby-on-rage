# Control Structures

## Conditional Statements

### if/elsif/else

```ruby
if condition
  # code
elsif another_condition
  # code
else
  # code
end
```

### unless

```ruby
unless condition
  # code
end
```

### Ternary Operator

```ruby
result = condition ? true_value : false_value
```

### Case Statement

```ruby
case value
when 1
  "one"
when 2..5
  "few"
else
  "many"
end
```

## Loops

### while

```ruby
while condition
  # code
end
```

### until

```ruby
until condition
  # code
end
```

### for

```ruby
for item in collection
  # code
end
```

### each (preferred)

```ruby
collection.each do |item|
  # code
end
```

### times

```ruby
5.times do |i|
  puts i
end
```

### upto/downto

```ruby
1.upto(5) { |i| puts i }
5.downto(1) { |i| puts i }
```

## Loop Control

### break

```ruby
loop do
  break if condition
end
```

### next

```ruby
(1..10).each do |num|
  next if num.even?
  puts num
end
```

### redo

```ruby
i = 0
while i < 5
  i += 1
  redo if i == 3  # Repeats iteration when i == 3
  puts i
end
```

## Iterators

### map/collect

```ruby
numbers = [1, 2, 3, 4]
squares = numbers.map { |n| n * n }  # [1, 4, 9, 16]
```

### select/find_all

```ruby
even = numbers.select { |n| n.even? }  # [2, 4]
```

### reject

```ruby
odd = numbers.reject { |n| n.even? }   # [1, 3]
```

### find/detect

```ruby
first_even = numbers.find { |n| n.even? }  # 2
```

### any?/all?

```ruby
has_even = numbers.any? { |n| n.even? }  # true
all_even = numbers.all? { |n| n.even? }  # false
```

### inject/reduce

```ruby
sum = numbers.inject(0) { |sum, n| sum + n }  # 10
```

## Exception Handling

### begin/rescue

```ruby
begin
  # risky code
rescue StandardError => e
  puts "Error: #{e.message}"
ensure
  # always executed
end
```

### raise

```ruby
raise "Something went wrong"
raise ArgumentError, "Invalid argument"
```

## Short-circuit Evaluation

```ruby
# && and ||
result = true && false  # false
result = true || false  # true

# With method calls
user && user.name  # Safe navigation
```

## Statement Modifiers

```ruby
puts "Hello" if condition
puts "Goodbye" unless condition

begin
  # code
end while condition
```

## Inline Conditionals

```ruby
# Instead of:
if condition
  x = 1
else
  x = 2
end

# Use:
x = condition ? 1 : 2
```

## Safe Navigation Operator (&.)

```ruby
# Ruby 2.3+
user&.name&.upcase
# Equivalent to: user && user.name && user.name.upcase
```

## Pattern Matching (Ruby 2.7+)

```ruby
case [1, 2, 3]
in [1, *rest]
  puts "Starts with 1, rest: #{rest}"
in [x, y, z] if x > y
  puts "x > y"
else
  puts "No match"
end
```

## Best Practices

- Use `each` instead of `for` loops
- Prefer `unless` over `if !`
- Use early returns to avoid deep nesting
- Handle exceptions appropriately
- Use meaningful variable names in blocks
- Consider using `next` and `break` for control flow
- Use pattern matching for complex conditionals

Ruby's control structures are designed to be readable and expressive, making it easy to write clean, maintainable code.
