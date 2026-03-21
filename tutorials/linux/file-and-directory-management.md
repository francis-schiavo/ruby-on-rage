# File and Directory Management

## File Permissions

Every file and directory has permissions for three types of users:
- Owner (u)
- Group (g)
- Others (o)

And three types of permissions:
- Read (r) - 4
- Write (w) - 2
- Execute (x) - 1

### Viewing Permissions
```bash
ls -l
```
Output format: `-rw-r--r-- 1 user group size date filename`

- First character: File type (- for file, d for directory)
- Next 9: Permissions (owner-group-others)
- Owner permissions, group permissions, others permissions

### Changing Permissions
```bash
chmod permissions filename
```

Methods:
1. Symbolic: `chmod u+x filename` (add execute to owner)
2. Octal: `chmod 755 filename` (rwxr-xr-x)

Common permissions:
- 644: rw-r--r-- (files)
- 755: rwxr-xr-x (executables)
- 700: rwx------ (private)

### Changing Ownership
```bash
sudo chown user:group filename
```

## File Types

- Regular files: -
- Directories: d
- Symbolic links: l
- Character devices: c
- Block devices: b
- Sockets: s
- Named pipes: p

## Finding Files

### locate
```bash
locate filename
```
Fast search using a database (updated daily by cron).

### find
```bash
find /path -name "pattern"
```
Powerful but slower. Examples:
- `find . -name "*.txt"`: Find all .txt files in current directory
- `find /home -type f -size +1M`: Find files larger than 1MB
- `find . -mtime -7`: Files modified in last 7 days

### which
```bash
which command
```
Find the location of a command in PATH.

### whereis
```bash
whereis command
```
Find binary, source, and manual files.

## Archiving and Compression

### tar
Create archives:
```bash
tar -cvf archive.tar files/
```
Extract:
```bash
tar -xvf archive.tar
```

With compression:
- gzip: `tar -czvf archive.tar.gz files/`
- bzip2: `tar -cjvf archive.tar.bz2 files/`
- xz: `tar -cJvf archive.tar.xz files/`

### zip
```bash
zip archive.zip files/
unzip archive.zip
```

## Disk Usage

### du
```bash
du -h directory
```
Show disk usage of directories.

### df
```bash
df -h
```
Show filesystem disk space usage.

## File Comparison

### diff
```bash
diff file1 file2
```
Show differences between files.

### cmp
```bash
cmp file1 file2
```
Compare files byte by byte.

## Text Processing

### grep
Search for patterns in files:
```bash
grep "pattern" file
grep -r "pattern" directory
```

### sed
Stream editor for text manipulation:
```bash
sed 's/old/new/g' file
```

### awk
Text processing and reporting:
```bash
awk '{print $1}' file
```

## Symbolic Links

Create links:
```bash
ln -s target link_name
```
- Hard links: `ln target link_name`
- Soft links: `ln -s target link_name`

## Practice Exercises

1. Check permissions of files in your home directory.
2. Create a script file and make it executable.
3. Find all .txt files in your system.
4. Create a tar archive of your Documents folder.
5. Compare two text files and see the differences.

Next, we'll explore text editors available in Linux.
