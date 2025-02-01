# MyTools

A collection of system management and optimization scripts for Linux/Ubuntu environments.

## Description

This repository contains various shell scripts for system maintenance, monitoring, and optimization tasks.

## Installation

Clone the repository:
```bash
git clone https://github.com/yourusername/MyTools.git
cd MyTools
chmod +x scripts/*.sh
```

## Available Scripts

### System Monitoring
- `scripts/top_processes_by_ram.sh` - Display top memory-consuming processes and memory statistics
- `scripts/system_statistics_monitor.sh` - Comprehensive system monitoring including CPU, memory, disk, and process statistics

### System Optimization
- `scripts/optimize_ubuntu.sh` - Optimize Ubuntu for systems with limited resources (2-core CPU and 2GB RAM)
- `scripts/swapping_config.sh` - Configure and manage swap space
- `scripts/cleanup_system.sh` - Clean up system resources including Docker containers, system cache, and APT packages

## Usage

Run any script using:
```bash
sudo ./scripts/script_name.sh
```

Note: Some scripts require root privileges to execute properly.

## Project Structure

```
MyTools/
├── README.md
└── scripts/
    ├── cleanup_system.sh
    ├── optimize_ubuntu.sh
    ├── swapping_config.sh
    ├── system_statistics_monitor.sh
    └── top_processes_by_ram.sh
```

## Contributing

Feel free to submit issues and pull requests.

## License

MIT License