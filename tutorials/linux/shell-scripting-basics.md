# Shell Scripting Basics

## What is Shell Scripting?

Shell scripting is writing a series of commands in a file to automate tasks. The shell interprets and executes these commands.

## Shebang

The first line of a shell script:
```bash
#!/bin/bash
```
Tells the system which interpreter to use.

## Variables

### Defining Variables
```bash
name="John"
age=25
```

### Using Variables
```bash
echo "Hello, $name"
echo "You are $age years old"
```

### Special Variables
- `$0`: Script name
- `$1, $2, ...`: Command line arguments
- `$#`: Number of arguments
- `$@`: All arguments
- `$?`: Exit status of last command
- `$$`: Process ID of script

## Basic Commands

### echo
```bash
echo "Hello World"
echo -n "No newline"  # Suppress newline
```

### read
```bash
read name
echo "Hello, $name"
```

### printf
```bash
printf "Name: %s, Age: %d\n" "$name" "$age"
```

## Control Structures

### if Statement
```bash
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
```

### Conditions
```bash
[ -f file ]    # File exists
[ -d dir ]     # Directory exists
[ -z string ]  # String is empty
[ string1 = string2 ]  # Strings equal
[ num1 -eq num2 ]  # Numbers equal
[ num1 -gt num2 ]  # Greater than
```

### for Loop
```bash
for item in list; do
    commands
done
```

Example:
```bash
for file in *.txt; do
    echo "Processing $file"
done
```

### while Loop
```bash
while [ condition ]; do
    commands
done
```

### until Loop
```bash
until [ condition ]; do
    commands
done
```

### case Statement
```bash
case $variable in
    pattern1)
        commands
        ;;
    pattern2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

## Functions

```bash
function_name() {
    commands
}

# Call function
function_name
```

## Input/Output Redirection

### Standard Streams
- stdin (0): Standard input
- stdout (1): Standard output
- stderr (2): Standard error

### Redirection
```bash
command > file      # Redirect stdout to file
command >> file     # Append stdout to file
command 2> file     # Redirect stderr to file
command &> file     # Redirect both stdout and stderr
command < file      # Redirect stdin from file
```

### Pipes
```bash
command1 | command2  # Send output of command1 to command2
```

## Command Substitution

```bash
current_date=$(date)
files=$(ls)
```

## Arithmetic

```bash
result=$((5 + 3))
echo $result  # 8

let result=5*3
echo $result  # 15
```

## Debugging

```bash
bash -x script.sh  # Execute with tracing
set -x             # Enable tracing in script
set +x             # Disable tracing
```

## Error Handling

```bash
set -e  # Exit on error
set -u  # Exit on undefined variable
trap 'echo "Error occurred"' ERR
```

## Example Script: Backup

```bash
#!/bin/bash

# Simple backup script

SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backup"
DATE=$(date +%Y%m%d_%H%M%S)

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE_DIR"

echo "Backup completed: $BACKUP_DIR/backup_$DATE.tar.gz"
```

## Best Practices

1. Use descriptive variable names
2. Add comments to explain complex parts
3. Use `set -euo pipefail` for robust scripts
4. Quote variables: `"$variable"`
5. Use functions for reusable code
6. Test scripts with different inputs

## Practice Exercises

1. Write a script that greets the user by name.
2. Create a script that checks if a file exists and displays its size.
3. Write a backup script similar to the example.
4. Create a script that processes command line arguments.
5. Write a script that monitors disk usage and alerts if low.

Next, we'll cover networking basics.
