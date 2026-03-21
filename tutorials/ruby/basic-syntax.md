# Basic Syntax

## Comments

```ruby
# Single line comment

=begin
Multi-line
comment
=end
```

## Statements and Expressions

Ruby statements don't require semicolons:

```ruby
puts "Hello"
x = 5
y = x + 3
```

## Case Sensitivity

Ruby is case-sensitive:

```ruby
name = "Ruby"
Name = "Different"  # Different variable
```

## Keywords

Ruby has reserved keywords that cannot be used as variable names:

```ruby
# Some keywords: if, else, def, class, end, true, false, nil, etc.
```

## Whitespace

Ruby uses whitespace for readability but doesn't enforce indentation like Python.

## Line Continuation

Long lines can be continued with backslash:

```ruby
result = 1 + 2 + 3 + \
         4 + 5 + 6
```

## Everything is an Expression

In Ruby, almost everything returns a value:

```ruby
x = if true then 1 else 0 end  # x = 1

y = case x
    when 1 then "one"
    when 2 then "two"
    else "other"
    end  # y = "one"
```

## Method Calls

Parentheses are optional for method calls:

```ruby
puts "Hello"     # Valid
puts("Hello")    # Also valid
```

## String Literals

```ruby
single = 'Single quotes'
double = "Double quotes with #{interpolation}"
```

## Symbols

Symbols are immutable strings, often used as keys:

```ruby
:key
:key_with_underscores
```

## Constants

Constants start with capital letters:

```ruby
PI = 3.14159
MY_CONSTANT = "value"
```

## Parallel Assignment

```ruby
a, b = 1, 2
x, y, z = [1, 2, 3]
```

## Conditional Assignment

```ruby
x ||= 5  # Assign only if x is nil or false
```

## The `end` Keyword

Ruby uses `end` to close blocks, methods, classes, etc.:

```ruby
def method
  if condition
    # code
  end
end
```

## Code Blocks

```ruby
# Do-end block
[1, 2, 3].each do |num|
  puts num
end

# Curly braces for single line
[1, 2, 3].each { |num| puts num }
```

## Method Definition

```ruby
def greet(name)
  "Hello, #{name}!"
end
```

## Class Definition

```ruby
class Person
  # class body
end
```

## Modules

```ruby
module MyModule
  # module body
end
```

## File Structure

Ruby files typically have `.rb` extension.

## Running Ruby Code

```bash
# Run a file
ruby myfile.rb

# Run inline code
ruby -e "puts 'Hello'"

# Start IRB
irb
```

## Best Practices

- Use 2 spaces for indentation (not tabs)
- Keep lines under 80-100 characters
- Use meaningful variable names
- Follow Ruby naming conventions (snake_case for variables, CamelCase for classes)
- Use parentheses for method calls when passing multiple arguments
- Prefer double quotes for strings with interpolation

Ruby's syntax is designed to be readable and expressive, making it easy to write clean, maintainable code.
