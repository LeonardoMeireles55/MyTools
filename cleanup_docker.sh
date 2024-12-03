#!/bin/bash

# Docker Cleanup Script

echo "====================================="
echo "      Starting Docker Cleanup        "
echo "====================================="

# Remove stopped containers
echo "Removing stopped containers..."
docker container prune -f

# Remove unused volumes
echo "Removing unused volumes..."
docker volume prune -f

# Remove unused images
echo "Removing unused images..."
docker image prune -a -f

# Remove unused networks
echo "Removing unused networks..."
docker network prune -f

# Remove build cache
echo "Removing build cache..."
docker builder prune -a -f

echo "====================================="
echo "      Docker Cleanup Completed       "
echo "====================================="

# Show disk usage after cleanup
echo "Disk usage after cleanup:"
docker system df

exit 0
