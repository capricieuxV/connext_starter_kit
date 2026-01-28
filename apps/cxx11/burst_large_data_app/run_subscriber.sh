#!/bin/bash
# Run script for burst_subscriber
# Executes the binary from the top-level build directory

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Navigate to connext_starter_kit root (3 levels up from apps/cxx11/burst_large_data_app)
STARTER_KIT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

cd "$STARTER_KIT_ROOT" || exit 1

# Check if binary exists, build if needed
BINARY="./build/apps/cxx11/burst_large_data_app/burst_subscriber"
if [ ! -f "$BINARY" ]; then
    echo "Binary not found. Building project..."
    cd ./build && cmake --build . || exit 1
    cd ..
fi

"$BINARY" "$@"
