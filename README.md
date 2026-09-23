# Server Performance Stats

A simple Bash script that collects basic Linux system and server performance statistics from the command line.

## What It Shows

* CPU usage
* Memory usage
* Disk usage
* Top 5 CPU-consuming processes
* Top 5 memory-consuming processes
* Hostname and OS
* System uptime
* Load average
* Logged-in users
* Failed login attempts

## Example Output

<img width="590" height="925" alt="v1" src="https://github.com/user-attachments/assets/5a36ac26-9fe2-4c5c-930c-3b5607490563" />


## Requirements

* Linux / WSL
* Bash
* Standard Linux utilities such as `top`, `ps`, `free`, `df`, `awk`, `sed`, and `grep`

Tested on Ubuntu 26.04 running through WSL2.

## How to Run

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Enter the project directory

```bash
cd server-performance-stats
```

### 3. Make the script executable

```bash
chmod +x server-stat.sh
```

### 4. Run it

```bash
./server-stat.sh
```

You can also run it directly with Bash:

```bash
bash server-stat.sh
```

## How It Works

The script uses standard Linux commands and Bash pipelines to collect and format system information.

For example, CPU information flows through:

```text
top → grep → sed → awk → CPU usage
```

Process information is collected using `ps` and sorted by CPU or memory usage.

## Project Status

**Version 1 — Complete**

This is a learning project focused on Linux fundamentals, Bash scripting, command pipelines, and system monitoring.

Future improvements may include thresholds/warnings, network statistics, better error handling, logging, and more detailed filesystem information.
