# Regular Expressions

## What are Regular Expressions?

Regular expressions (regex) are patterns used to match character combinations in strings. Ruby uses the Onigmo regex engine.

## Basic Syntax

### Literals

```ruby
# Match exact string
regex = /hello/
puts "hello world".match?(regex)  # true

# Case insensitive
regex = /hello/i
puts "HELLO world".match?(regex)  # true
```

### Character Classes

```ruby
# Any digit
/\d/     # [0-9]

# Any letter
/[a-zA-Z]/

# Any character except newline
/./

# Word character (letter, digit, underscore)
/\w/

# Whitespace
/\s/

# Negated classes
/\D/     # Non-digit
/\W/     # Non-word
/\S/     # Non-whitespace
```

### Quantifiers

```ruby
# Zero or more
/a*/

# One or more
/a+/

# Zero or one
/a?/

# Exactly n times
/a{3}/

# n or more times
/a{3,}/

# Between n and m times
/a{2,5}/
```

### Anchors

```ruby
# Start of string
/^hello/

# End of string
/world$/

# Word boundary
/\bword\b/

# Start of line
/^/

# End of line
/$/
```

## Using Regex in Ruby

### Match Method

```ruby
string = "The quick brown fox"
match = string.match(/quick (\w+)/)
puts match[0]    # "quick brown"
puts match[1]    # "brown"
puts match.pre_match   # "The "
puts match.post_match  # " fox"
```

### Match? Method (Ruby 2.4+)

```ruby
puts "hello".match?(/^h/)  # true
puts "hello".match?(/^w/)  # false
```

### Scan Method

```ruby
text = "The year is 2023 and 2024 will be better"
years = text.scan(/\d{4}/)
puts years  # ["2023", "2024"]
```

### Sub and Gsub

```ruby
text = "Hello, world!"

# Replace first occurrence
puts text.sub(/l/, "L")    # "HeLlo, world!"

# Replace all occurrences
puts text.gsub(/l/, "L")   # "HeLLo, worLd!"
```

### Split

```ruby
text = "apple,banana,cherry"
fruits = text.split(/,/)
puts fruits  # ["apple", "banana", "cherry"]
```

## Common Patterns

### Email Validation

```ruby
email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
puts "user@example.com".match?(email_regex)  # true
```

### Phone Numbers

```ruby
phone_regex = /\A\d{3}-\d{3}-\d{4}\z/
puts "555-123-4567".match?(phone_regex)  # true
```

### URLs

```ruby
url_regex = /\Ahttps?:\/\/[^\s]+\z/
puts "https://example.com".match?(url_regex)  # true
```

### Dates

```ruby
date_regex = /\A\d{4}-\d{2}-\d{2}\z/
puts "2023-12-25".match?(date_regex)  # true
```

## Advanced Features

### Groups and Captures

```ruby
regex = /(\w+) (\w+)/
match = "John Doe".match(regex)
puts match[1]  # "John"
puts match[2]  # "Doe"
```

### Named Captures

```ruby
regex = /(?<first>\w+) (?<last>\w+)/
match = "John Doe".match(regex)
puts match[:first]  # "John"
puts match[:last]   # "Doe"
```

### Lookahead/Lookbehind

```ruby
# Positive lookahead
regex = /foo(?=bar)/
puts "foobar".match?(regex)  # true
puts "foobaz".match?(regex)  # false

# Negative lookbehind
regex = /(?<!not )foo/
puts "foo".match?(regex)     # true
puts "not foo".match?(regex) # false
```

### Non-capturing Groups

```ruby
regex = /(?:https?|ftp):\/\/[^\s]+/
# The ?: makes it non-capturing
```

## Regex Options

```ruby
# Case insensitive
/regex/i

# Multiline mode
/regex/m

# Extended mode (ignore whitespace and comments)
/regex/x

# Combined options
/regex/imx
```

## Performance Considerations

```ruby
# Pre-compile regex for reuse
EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

# Avoid catastrophic backtracking
# Bad: /(a*)*b/
# Good: /a*b/
```

## Common Mistakes

```ruby
# Forgetting to escape special characters
regex = /hello.world/  # Matches "helloXworld"
regex = /hello\.world/ # Matches "hello.world"

# Using ^ and $ incorrectly
regex = /^hello$/      # Matches exactly "hello"
regex = /hello/        # Matches "hello" anywhere
```

## Tools and Libraries

### Built-in String Methods

```ruby
"hello".gsub(/[aeiou]/, "*")  # "h*ll*"
"test".start_with?(/te/)      # true
"test".end_with?(/st/)        # true
```

### Oniguruma Features

Ruby's regex engine supports advanced features like:

- Named groups
- Lookbehind assertions
- Atomic groups
- Possessive quantifiers

## Best Practices

- Use raw strings for regex literals
- Pre-compile frequently used regex
- Test regex thoroughly
- Use non-capturing groups when you don't need captures
- Avoid complex regex when simple string methods suffice
- Comment complex regex
- Consider readability over cleverness
- Use regex testing tools online

Regular expressions are powerful but can be complex. Start simple and build up complexity as needed. Always test your regex patterns thoroughly.
