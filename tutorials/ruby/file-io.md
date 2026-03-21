# File I/O

## Reading Files

### Reading Entire File

```ruby
# Method 1: Read all at once
content = File.read("example.txt")
puts content

# Method 2: Read lines into array
lines = File.readlines("example.txt")
puts lines.first  # First line

# Method 3: Using block (auto-close)
File.open("example.txt", "r") do |file|
  content = file.read
  puts content
end
```

### Reading Line by Line

```ruby
File.open("example.txt", "r") do |file|
  file.each_line do |line|
    puts line
  end
end

# Or using foreach
IO.foreach("example.txt") do |line|
  puts line
end
```

## Writing Files

### Writing Entire Content

```ruby
# Overwrite file
File.write("output.txt", "Hello, World!")

# Append to file
File.write("output.txt", "\nAppended text", mode: "a")
```

### Writing with File Handle

```ruby
File.open("output.txt", "w") do |file|
  file.puts "Line 1"
  file.puts "Line 2"
  file.write "No newline"
end
```

## File Modes

```ruby
# Read mode
File.open("file.txt", "r")

# Write mode (overwrite)
File.open("file.txt", "w")

# Append mode
File.open("file.txt", "a")

# Read-write mode
File.open("file.txt", "r+")

# Binary mode
File.open("file.txt", "rb")
File.open("file.txt", "wb")
```

## File Operations

### Checking File Existence

```ruby
puts File.exist?("example.txt")     # true/false
puts File.file?("example.txt")      # true for files
puts File.directory?("mydir")       # true for directories
```

### File Information

```ruby
file_path = "example.txt"

puts File.size(file_path)           # File size in bytes
puts File.mtime(file_path)          # Last modification time
puts File.ctime(file_path)          # Last change time
puts File.atime(file_path)          # Last access time
puts File.readable?(file_path)      # Check read permission
puts File.writable?(file_path)      # Check write permission
puts File.executable?(file_path)    # Check execute permission
```

### File Paths

```ruby
require 'pathname'

path = Pathname.new("path/to/file.txt")

puts path.basename     # "file.txt"
puts path.dirname      # "path/to"
puts path.extname      # ".txt"
puts path.expand_path  # Absolute path

# Or using File
puts File.basename("path/to/file.txt")    # "file.txt"
puts File.dirname("path/to/file.txt")     # "path/to"
puts File.extname("path/to/file.txt")     # ".txt"
```

## Directory Operations

### Listing Directory Contents

```ruby
# List files in directory
Dir.entries(".").each do |entry|
  puts entry
end

# List only files (no directories)
Dir.glob("*.txt").each do |file|
  puts file
end

# Recursive listing
Dir.glob("**/*.txt").each do |file|
  puts file
end
```

### Creating and Removing Directories

```ruby
# Create directory
Dir.mkdir("new_dir")

# Create nested directories
require 'fileutils'
FileUtils.mkdir_p("path/to/nested/dir")

# Remove directory (must be empty)
Dir.rmdir("new_dir")

# Remove directory and contents
FileUtils.rm_rf("dir_to_remove")
```

## Working with CSV Files

```ruby
require 'csv'

# Reading CSV
CSV.foreach("data.csv") do |row|
  puts "#{row[0]}: #{row[1]}"
end

# Writing CSV
CSV.open("output.csv", "w") do |csv|
  csv << ["Name", "Age", "City"]
  csv << ["John", 30, "New York"]
  csv << ["Jane", 25, "London"]
end
```

## Working with JSON Files

```ruby
require 'json'

# Writing JSON
data = { name: "John", age: 30, city: "New York" }
File.write("data.json", JSON.pretty_generate(data))

# Reading JSON
json_content = File.read("data.json")
parsed_data = JSON.parse(json_content)
puts parsed_data["name"]  # "John"
```

## Binary Files

```ruby
# Reading binary file
binary_data = File.binread("image.jpg")

# Writing binary file
File.binwrite("copy.jpg", binary_data)
```

## Temporary Files

```ruby
require 'tempfile'

Tempfile.create("temp") do |temp_file|
  temp_file.write("Temporary content")
  temp_file.rewind
  puts temp_file.read
end  # Automatically deleted
```

## File Locking

```ruby
File.open("shared.txt", "a") do |file|
  file.flock(File::LOCK_EX)  # Exclusive lock
  file.puts "Thread-safe write"
  file.flock(File::LOCK_UN)  # Unlock
end
```

## Error Handling

```ruby
begin
  content = File.read("nonexistent.txt")
rescue Errno::ENOENT
  puts "File not found"
rescue Errno::EACCES
  puts "Permission denied"
ensure
  # Cleanup code here
end
```

## Best Practices

- Always close files (use blocks when possible)
- Handle file operation errors
- Use appropriate file modes
- Be careful with file permissions
- Use Pathname for complex path operations
- Consider memory usage for large files
- Use binary mode for non-text files
- Validate file existence before operations
- Use FileUtils for complex operations
- Consider encoding for text files

Ruby provides comprehensive file I/O capabilities with both simple one-liner methods and powerful stream-based operations. Always handle errors appropriately and close files to prevent resource leaks.
