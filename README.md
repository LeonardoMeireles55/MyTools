# my_bash_tools

MyTools is a collection of scripts designed for system maintenance, monitoring, and optimization on Linux/Ubuntu systems. It also includes an interactive menu interface (main.sh) to easily launch any of the available scripts.

## Overview

This repository provides various shell scripts that help you:
- Monitor system performance (CPU, memory, disk, processes).
- Configure and manage swap space to enhance system performance.
- Optimize your Ubuntu installation by disabling unneeded services and tuning kernel parameters.
- Clean up system resources such as Docker containers, cache, and unused packages.
- Fix common script formatting issues.

## Installation

1. Clone the repository:
```bash
git clone https://github.com/LeonardoMeireles55/my_tools.git
cd my_tools
sudo chmod +x ./install.sh
sudo ./install.sh
```

## Usage

Run any script using:
```bash
sudo ./scripts/script_name.sh

## Scripts Available
### System Monitoring
- `scripts/top_processes_by_ram.sh` - Displays the processes consuming the most memory and memory statistics.
- `scripts/system_statistics_monitor.sh` - Comprehensive system monitoring, including CPU, memory, disk, and process statistics.

### System Optimization
- `scripts/optimize_ubuntu.sh` - Optimizes Ubuntu for systems with limited resources.
- `scripts/swapping_config.sh` - Configures and manages swap space.
- `scripts/cleanup_system.sh` - Cleans up system resources, including Docker containers, system cache, and APT packages.
```

To access the interactive menu, run:
```bash
sudo ./main.sh
```

Note: Some scripts require root privileges to execute correctly.

## Project Structure

```
MyTools/
├── README.md
├── main.sh
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