# Best Practices

## Code Style

### Ruby Style Guide

Follow the community Ruby style guide:

- Use 2 spaces for indentation (not tabs)
- Keep lines under 80-100 characters
- Use snake_case for variables and methods
- Use CamelCase for classes and modules
- Use SCREAMING_SNAKE_CASE for constants

### Naming Conventions

```ruby
# Good
class UserAccount
  MAX_LOGIN_ATTEMPTS = 3

  attr_accessor :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create_user(attributes)
    # ...
  end
end

# Bad
class useraccount
  maxloginattempts = 3

  def FullName
    # ...
  end
end
```

## Method Design

### Single Responsibility Principle

```ruby
# Good
class User
  def save
    validate
    persist_to_database
    send_welcome_email
  end

  private

  def validate
    # validation logic
  end

  def persist_to_database
    # database logic
  end

  def send_welcome_email
    # email logic
  end
end

# Bad - method does too many things
def save_user(user_data)
  # validate
  # save to database
  # send email
  # log activity
end
```

### Method Length

Keep methods short and focused:

```ruby
# Good
def calculate_total(items)
  subtotal = items.sum(&:price)
  tax = subtotal * TAX_RATE
  shipping = calculate_shipping(items)
  subtotal + tax + shipping
end

# Bad
def calculate_total(items)
  # 50+ lines of complex logic
end
```

### Parameter Handling

```ruby
# Use keyword arguments for clarity
def create_user(name:, email:, age: nil)
  # ...
end

# Use splat for variable arguments
def log(*messages)
  messages.each { |msg| puts "[LOG] #{msg}" }
end
```

## Class Design

### SOLID Principles

- **Single Responsibility**: A class should have one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Liskov Substitution**: Subclasses should be substitutable for their parents
- **Interface Segregation**: Clients shouldn't depend on methods they don't use
- **Dependency Inversion**: Depend on abstractions, not concretions

### Composition over Inheritance

```ruby
# Prefer composition
class Car
  def initialize(engine, wheels)
    @engine = engine
    @wheels = wheels
  end

  def start
    @engine.start
  end
end

# Avoid deep inheritance hierarchies
```

## Error Handling

### Use Appropriate Exception Types

```ruby
class ValidationError < StandardError; end
class PaymentError < StandardError; end

def process_payment(amount)
  raise PaymentError, "Invalid amount" if amount <= 0
  # process payment
end
```

### Handle Exceptions Properly

```ruby
begin
  risky_operation
rescue SpecificError => e
  handle_specific_error(e)
rescue StandardError => e
  log_error(e)
  raise  # Re-raise if needed
ensure
  cleanup_resources
end
```

## Testing

### Test-Driven Development (TDD)

```ruby
# Write test first
def test_addition
  calculator = Calculator.new
  assert_equal 5, calculator.add(2, 3)
end

# Then implement
class Calculator
  def add(a, b)
    a + b
  end
end
```

### Test Coverage

Aim for high test coverage, especially for business logic.

### Test Types

- **Unit Tests**: Test individual methods
- **Integration Tests**: Test component interactions
- **Acceptance Tests**: Test from user perspective

## Performance

### Avoid Premature Optimization

```ruby
# Don't do this unless profiling shows it's a bottleneck
optimized_code = complex_optimization(data)
```

### Use Appropriate Data Structures

```ruby
# Use Set for membership testing
require 'set'
valid_items = Set.new(['item1', 'item2', 'item3'])
valid_items.include?('item1')  # O(1) lookup
```

### Memory Management

```ruby
# Process large files in chunks
File.open('large_file.txt') do |file|
  file.each_line do |line|
    process_line(line)
  end
end
```

## Security

### Input Validation

```ruby
def create_user(params)
  name = params[:name].to_s.strip
  email = params[:email].to_s.downcase.strip

  # Validate input
  raise ArgumentError, "Invalid name" unless name.match?(/\A\w+\z/)
  raise ArgumentError, "Invalid email" unless email.match?(URI::MailTo::EMAIL_REGEXP)

  User.new(name: name, email: email)
end
```

### SQL Injection Prevention

```ruby
# Use parameterized queries
User.where("name = ? AND age > ?", name, min_age)

# Avoid string interpolation in queries
# Bad: User.where("name = '#{name}'")
```

## Documentation

### Use Comments Wisely

```ruby
# Good - explains why, not what
def complex_calculation
  # Using Newton's method for better convergence
  # than simple iteration
  # ...
end

# Bad - just repeats the code
def add(a, b)
  # Add a and b
  a + b
end
```

### RDoc Documentation

```ruby
# Calculates the total price including tax
#
# @param items [Array<Item>] List of items to calculate
# @param tax_rate [Float] Tax rate as decimal (e.g., 0.08 for 8%)
# @return [Float] Total price including tax
def calculate_total(items, tax_rate = 0.08)
  subtotal = items.sum(&:price)
  subtotal * (1 + tax_rate)
end
```

## Code Organization

### File Structure

```
lib/
├── my_app.rb
├── my_app/
│   ├── models/
│   │   ├── user.rb
│   │   └── product.rb
│   ├── services/
│   │   ├── payment_service.rb
│   │   └── email_service.rb
│   └── utils/
│       └── string_utils.rb
└── my_app.rb
```

### Require Structure

```ruby
# Use require_relative for local files
require_relative 'models/user'
require_relative 'services/payment_service'

# Use require for external libraries
require 'json'
require 'date'
```

## Tools and Gems

### Code Quality

- **RuboCop**: Code style checker
- **Reek**: Code smell detector
- **Flog**: Complexity analyzer

### Development Tools

- **Pry**: Enhanced IRB
- **Byebug**: Ruby debugger
- **Bundler**: Dependency management

## Deployment and Production

### Environment Configuration

```ruby
# Use environment variables
database_url = ENV.fetch('DATABASE_URL')
api_key = ENV['API_KEY']

# Avoid hardcoding values
# Bad: DATABASE_URL = "postgresql://localhost/myapp"
```

### Logging

```ruby
require 'logger'

logger = Logger.new(STDOUT)
logger.level = ENV['RACK_ENV'] == 'production' ? Logger::INFO : Logger::DEBUG

# Use appropriate log levels
logger.debug "Processing user #{user.id}"
logger.info "User #{user.id} logged in"
logger.error "Failed to process payment: #{e.message}"
```

## Continuous Learning

- Read Ruby source code
- Follow Ruby blogs and newsletters
- Attend Ruby conferences
- Contribute to open source
- Stay updated with Ruby versions
- Learn Rails for web development

Following these best practices will help you write maintainable, efficient, and professional Ruby code. Remember that best practices evolve, so stay engaged with the Ruby community.
