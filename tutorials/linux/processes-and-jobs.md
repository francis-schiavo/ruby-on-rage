# Processes and Jobs

## Understanding Processes

A process is an instance of a running program. Each process has:
- PID (Process ID): Unique identifier
- PPID (Parent Process ID): ID of the parent process
- State: Running, sleeping, stopped, etc.
- Priority: CPU scheduling priority
- Memory usage
- Owner

## Viewing Processes

### ps Command
```bash
ps                    # Current shell processes
ps aux                # All processes with details
ps -ef                # Full listing
ps -p PID             # Specific process
```

Common options:
- `a`: All users
- `u`: User-oriented format
- `x`: Include processes without controlling terminal
- `f`: Full format

### top Command
```bash
top
```
Interactive process viewer. Shows:
- System summary
- Process list sorted by CPU usage
- Real-time updates

Useful keys:
- `q`: Quit
- `k`: Kill process
- `r`: Renice process
- `h`: Help

### htop
Enhanced version of top (install with `sudo apt install htop`):
```bash
htop
```
Features:
- Mouse support
- Better navigation
- Tree view
- Color coding

## Process States

- **R**: Running
- **S**: Sleeping (interruptible)
- **D**: Sleeping (uninterruptible)
- **T**: Stopped
- **Z**: Zombie (defunct)

## Managing Processes

### Background and Foreground
```bash
command &            # Run in background
Ctrl + Z              # Suspend foreground process
bg                    # Resume in background
fg                    # Bring to foreground
jobs                  # List jobs
fg %1                 # Bring job 1 to foreground
```

### Killing Processes
```bash
kill PID              # Send TERM signal
kill -9 PID           # Send KILL signal (force)
killall process_name  # Kill by name
pkill pattern         # Kill by pattern
```

### Signals
Common signals:
- `TERM` (15): Terminate gracefully
- `KILL` (9): Force kill
- `STOP` (19): Stop process
- `CONT` (18): Continue stopped process
- `HUP` (1): Hang up (reload config)

## Process Priority

### nice
Set priority when starting:
```bash
nice -n 10 command    # Lower priority
nice --10 command     # Higher priority (needs root)
```

### renice
Change priority of running process:
```bash
renice -n 10 PID
```

Priority range: -20 (highest) to 19 (lowest)

## Monitoring System Resources

### free
```bash
free -h
```
Show memory usage.

### vmstat
```bash
vmstat 1
```
Virtual memory statistics (updates every second).

### iostat
```bash
iostat -x 1
```
I/O statistics.

### sar
```bash
sar -u 1 5
```
System activity report.

## System Load

### uptime
```bash
uptime
```
Shows load average for 1, 5, 15 minutes.

Load average represents the number of processes waiting for CPU time.

## Process Scheduling

### cron
Schedule recurring tasks:
```bash
crontab -e           # Edit crontab
crontab -l           # List crontab
```

Crontab format:
```
* * * * * command
| | | | |
| | | | ----- Day of week (0-7)
| | | ------- Month (1-12)
| | --------- Day of month (1-31)
| ----------- Hour (0-23)
------------- Minute (0-59)
```

Examples:
```
0 2 * * * /path/to/backup.sh    # Daily at 2 AM
*/15 * * * * /path/to/script    # Every 15 minutes
```

### at
Schedule one-time tasks:
```bash
at 14:00 tomorrow
at> command
Ctrl + D
```

## Practice Exercises

1. View all running processes.
2. Find the PID of a specific process.
3. Start a long-running command in the background.
4. Change the priority of a process.
5. Schedule a cron job to run a script daily.
6. Monitor system resources with top or htop.

Next, we'll introduce shell scripting basics.
