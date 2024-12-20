#!/bin/bash

# Array of kernel versions to process
KERNEL_VERSIONS=("6.1" "6.6" "6.11" "6.12" "6.13-rc3")

for version in "${KERNEL_VERSIONS[@]}"; do
    echo "Processing kernel version $version..."
    ./apply_patches.sh "$version" || { echo "Failed for $version"; continue; }
    git push myrepo HEAD:custom-$version
done
