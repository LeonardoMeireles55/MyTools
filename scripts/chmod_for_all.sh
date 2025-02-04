#!/bin/bash
user=$(whoami)
for file in scripts/*.sh; do
    echo "applying chmod to $file..."
    chown $user:$user $file
    chmod a+rwx $file
done
echo "All .sh files processed."
