# Gems and Bundler

## What are Gems?

Gems are Ruby libraries packaged for easy distribution and installation. They extend Ruby's functionality.

## RubyGems

RubyGems is Ruby's package manager. It comes pre-installed with Ruby.

### Basic Commands

```bash
# List installed gems
gem list

# Search for gems
gem search rails

# Install a gem
gem install rails

# Uninstall a gem
gem uninstall rails

# Update a gem
gem update rails

# Update all gems
gem update

# Get gem information
gem info rails
```

## Gemfile

A Gemfile specifies project dependencies.

```ruby
source 'https://rubygems.org'

gem 'rails', '7.0.0'
gem 'sqlite3'
gem 'puma', '>= 5.0'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end
```

## Bundler

Bundler manages gem dependencies and ensures everyone uses the same versions.

### Installation

```bash
gem install bundler
```

### Basic Commands

```bash
# Install all gems specified in Gemfile
bundle install

# Update gems to latest versions within constraints
bundle update

# Update specific gem
bundle update rails

# List all gems in bundle
bundle list

# Show gem information
bundle show rails

# Execute command in bundle context
bundle exec rails server

# Check for security vulnerabilities
bundle audit
```

## Gem Versions

### Version Constraints

```ruby
# Exact version
gem 'rails', '7.0.0'

# Minimum version
gem 'rails', '>= 7.0.0'

# Version range
gem 'rails', '>= 7.0.0', '< 8.0.0'

# Pessimistic version constraint
gem 'rails', '~> 7.0'    # >= 7.0.0, < 8.0.0
gem 'rails', '~> 7.0.0'  # >= 7.0.0, < 7.1.0
```

## Creating Gems

### Basic Structure

```bash
# Create gem structure
bundle gem my_gem

# This creates:
# my_gem/
# ├── lib/
# │   └── my_gem.rb
# ├── my_gem.gemspec
# ├── Gemfile
# ├── Rakefile
# └── README.md
```

### Gemspec File

```ruby
Gem::Specification.new do |spec|
  spec.name          = "my_gem"
  spec.version       = MyGem::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]

  spec.summary       = "A short summary of your gem"
  spec.description   = "A longer description of your gem"
  spec.homepage      = "https://github.com/username/my_gem"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*")
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
```

### Building and Publishing

```bash
# Build gem
gem build my_gem.gemspec

# Install locally
gem install ./my_gem-1.0.0.gem

# Push to RubyGems
gem push my_gem-1.0.0.gem
```

## Gem Development

### lib/ Directory Structure

```
lib/
├── my_gem.rb
└── my_gem/
    ├── version.rb
    ├── core.rb
    └── utils.rb
```

### Main File (lib/my_gem.rb)

```ruby
require "my_gem/version"
require "my_gem/core"
require "my_gem/utils"

module MyGem
  # Main module code
end
```

### Version File (lib/my_gem/version.rb)

```ruby
module MyGem
  VERSION = "1.0.0"
end
```

## Common Gems

### Web Frameworks

- **Rails**: Full-stack web framework
- **Sinatra**: Lightweight web framework
- **Hanami**: Modern web framework

### Testing

- **RSpec**: Behavior-driven testing
- **Minitest**: Simple testing framework
- **Cucumber**: Acceptance testing

### Database

- **ActiveRecord**: ORM for Rails
- **Sequel**: Database toolkit
- **Mongoid**: MongoDB ODM

### Utilities

- **Nokogiri**: XML/HTML parsing
- **HTTParty**: HTTP client
- **Sidekiq**: Background job processing

## Gem Best Practices

### Naming

- Use lowercase with underscores
- Be descriptive but not too long
- Check if name is available

### Versioning

- Follow semantic versioning (MAJOR.MINOR.PATCH)
- Use pre-release versions for betas (1.0.0-beta.1)

### Dependencies

- Specify version constraints carefully
- Avoid overly restrictive constraints
- Use pessimistic version constraint (~>) for gems you maintain

### Documentation

- Include README with installation and usage
- Use YARD for documentation
- Provide examples

### Testing

- Include comprehensive tests
- Use CI services (GitHub Actions, Travis CI)
- Maintain good test coverage

## Troubleshooting

### Gem Installation Issues

```bash
# Clear gem cache
gem cleanup

# Reinstall bundler
gem uninstall bundler
gem install bundler

# Use specific Ruby version
rvm use 3.2.0
```

### Bundle Issues

```bash
# Clear bundle cache
bundle clean --force

# Reinstall all gems
rm -rf vendor/bundle
bundle install

# Check for conflicts
bundle check
```

### Common Errors

- **LoadError**: Gem not found - check if gem is installed
- **Version conflict**: Update Gemfile or use bundle update
- **Platform issues**: Some gems only work on specific platforms

## Security

```bash
# Check for vulnerabilities
bundle audit

# Update vulnerable gems
bundle audit update
```

Gems are the lifeblood of the Ruby ecosystem. Understanding how to create, manage, and distribute gems is essential for Ruby development. Always keep your gems updated and be mindful of security vulnerabilities.
