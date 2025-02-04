#!/bin/bash
for file in scripts/*.sh; do
    echo "Processing $file..."
    tr -d '\r' <"$file" >"${file}.fixed" && mv "${file}.fixed" "$file" && chmod +x "$file"
done
echo "All .sh files processed."
