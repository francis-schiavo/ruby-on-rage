# Testing with Minitest

## What is Minitest?

Minitest is Ruby's built-in testing framework. It's lightweight, fast, and comes with Ruby by default.

## Setting Up Minitest

### Basic Setup

```ruby
# test_helper.rb
require 'minitest/autorun'

# Your test files will require this
```

### RSpec-style Syntax (Optional)

```ruby
require 'minitest/autorun'
require 'minitest/spec'

describe "MyClass" do
  # Tests go here
end
```

## Writing Tests

### Unit Tests

```ruby
require 'minitest/autorun'
require_relative '../lib/calculator'

class CalculatorTest < Minitest::Test
  def setup
    @calc = Calculator.new
  end

  def test_addition
    result = @calc.add(2, 3)
    assert_equal 5, result
  end

  def test_subtraction
    result = @calc.subtract(5, 3)
    assert_equal 2, result
  end

  def test_division_by_zero
    assert_raises(ZeroDivisionError) do
      @calc.divide(10, 0)
    end
  end
end
```

### Assertions

```ruby
# Equality
assert_equal expected, actual
assert_not_equal expected, actual

# Truthiness
assert truthy_value
assert_not falsey_value

# Nil checks
assert_nil value
assert_not_nil value

# Instance checks
assert_instance_of String, value
assert_kind_of Numeric, value

# Matching
assert_match /regex/, string
assert_no_match /regex/, string

# Collections
assert_includes [1, 2, 3], 2
assert_empty []
assert_not_empty [1]

# Exceptions
assert_raises ZeroDivisionError do
  1 / 0
end

# Custom messages
assert_equal 5, 2 + 2, "Math is broken"
```

## Test Structure

### Setup and Teardown

```ruby
class UserTest < Minitest::Test
  def setup
    @user = User.new("John", 30)
  end

  def teardown
    # Cleanup code
    @user = nil
  end

  # Tests...
end
```

### Class-level Setup

```ruby
class DatabaseTest < Minitest::Test
  def self.setup
    # Run once before all tests in class
    create_test_database
  end

  def self.teardown
    # Run once after all tests in class
    drop_test_database
  end
end
```

## Running Tests

### Basic Execution

```bash
# Run all tests
ruby -m minitest test/**/*.rb

# Run specific test file
ruby test/calculator_test.rb

# Run specific test method
ruby -m minitest test/calculator_test.rb -n test_addition
```

### Rake Integration

```ruby
# Rakefile
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task default: :test
```

```bash
rake test
```

## Mocks and Stubs

### Using Minitest::Mock

```ruby
require 'minitest/autorun'

class OrderTest < Minitest::Test
  def test_process_payment
    payment_service = Minitest::Mock.new
    payment_service.expect(:charge, true, [100, "USD"])

    order = Order.new(payment_service)
    result = order.process_payment(100, "USD")

    assert result
    payment_service.verify
  end
end
```

### Stubbing Methods

```ruby
class UserTest < Minitest::Test
  def test_send_welcome_email
    user = User.new("john@example.com")

    # Stub the mailer method
    user.stub :send_email, "email_sent" do
      result = user.send_welcome_email
      assert_equal "email_sent", result
    end
  end
end
```

## Spec-style Testing

```ruby
require 'minitest/autorun'
require 'minitest/spec'

describe Calculator do
  before do
    @calc = Calculator.new
  end

  describe "#add" do
    it "adds two numbers" do
      @calc.add(2, 3).must_equal 5
    end

    it "handles negative numbers" do
      @calc.add(-1, 1).must_equal 0
    end
  end

  describe "#divide" do
    it "raises error when dividing by zero" do
      proc { @calc.divide(10, 0) }.must_raise ZeroDivisionError
    end
  end
end
```

## Benchmarking

```ruby
require 'minitest/autorun'
require 'minitest/benchmark'

class BenchmarkTest < Minitest::Benchmark
  def bench_my_algorithm
    assert_performance_linear 0.99 do |n|
      # Code to benchmark
      n.times do
        my_algorithm
      end
    end
  end
end
```

## Custom Assertions

```ruby
module CustomAssertions
  def assert_valid_email(email)
    assert_match /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, email,
                 "#{email} is not a valid email"
  end
end

class Minitest::Test
  include CustomAssertions
end

# Now you can use it in tests
class UserTest < Minitest::Test
  def test_email_validation
    user = User.new("invalid-email")
    assert_valid_email user.email
  end
end
```

## Test Organization

### Directory Structure

```
test/
├── test_helper.rb
├── unit/
│   ├── calculator_test.rb
│   └── user_test.rb
├── integration/
│   └── user_registration_test.rb
└── fixtures/
    └── users.yml
```

### Fixtures

```ruby
# test/fixtures/users.yml
john:
  name: John Doe
  email: john@example.com

jane:
  name: Jane Smith
  email: jane@example.com
```

```ruby
class UserTest < Minitest::Test
  def setup
    @users = YAML.load_file('test/fixtures/users.yml')
  end
end
```

## Best Practices

- Test one thing per test method
- Use descriptive test names
- Keep tests fast and isolated
- Use setup/teardown for common code
- Test edge cases and error conditions
- Use mocks/stubs for external dependencies
- Maintain test coverage
- Run tests frequently
- Fix failing tests immediately

## Integration with Rails

If using Rails, Minitest is the default testing framework:

```ruby
# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new
    assert_not user.save
  end
end
```

Minitest provides a solid foundation for testing Ruby applications. Its simplicity and speed make it an excellent choice for both small scripts and large applications. Focus on writing clear, maintainable tests that give you confidence in your code.
