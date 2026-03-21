# Basic Terminal Commands

## Opening the Terminal

- Press `Ctrl + Alt + T` in most desktop environments.
- Or search for "Terminal" in the "applications" menu.

## Essential Commands

### Navigation
- `pwd`: Print working directory (shows current location)
- `ls`: List directory contents
  - `ls -l`: Long listing format
  - `ls -a`: Show hidden files
  - `ls -h`: Human-readable file sizes
- `cd`: Change directory
  - `cd /path/to/directory`: Absolute path
  - `cd relative/path`: Relative path
  - `cd ..`: Go up one directory
  - `cd ~`: Go to home directory
  - `cd -`: Go to previous directory

### File Operations
- `touch filename`: Create an empty file
- `mkdir directory`: Create a directory
  - `mkdir -p parent/child`: Create nested directories
- `cp source destination`: Copy files/directories
  - `cp -r source destination`: Recursive copy for directories
- `mv source destination`: Move/rename files/directories
- `rm filename`: Remove files
  - `rm -r directory`: Remove directories recursively
  - `rm -i`: Interactive mode (asks for confirmation)

### Viewing Files
- `cat filename`: Display file contents
- `less filename`: View file with paging (press 'q' to quit)
- `head filename`: Show first 10 lines
- `tail filename`: Show last 10 lines
  - `tail -f filename`: Follow file (real-time updates)

### System Information
- `whoami`: Show current user
- `id`: Show user and group IDs
- `date`: Show current date and time
- `uptime`: Show system uptime
- `df -h`: Show disk usage
- `free -h`: Show memory usage

### Help and Manual
- `command --help`: Show help for a command
- `man command`: Show manual page (press 'q' to quit)

## Command Structure

Most commands follow this pattern:
```
command [options] [arguments]
```

Examples:
- `ls -la /home/user`
- `mkdir -p projects/rails_app`

## Tab Completion

Use the `Tab` key for auto-completion of commands, file names, and paths.

## Command History

- `history`: Show command history
- `Ctrl + R`: Search command history
- Up/Down arrows: Navigate history

## Practice Exercises

1. Navigate to your home directory.
2. List the contents of the current directory.
3. Create a new directory called "practice".
4. Inside "practice", create a file called "hello.txt".
5. Write "Hello, Linux!" to the file using `echo "Hello, Linux!" > hello.txt`.
6. View the contents of the file.
7. Copy the file to "hello_copy.txt".
8. Remove the original file.

Next, we'll dive deeper into file and directory management.
