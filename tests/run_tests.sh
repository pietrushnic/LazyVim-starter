#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$(dirname "$SCRIPT_DIR")"

echo "Running markdown wrapping tests..."

cd "$CONFIG_DIR"

nvim --headless \
  -u "$SCRIPT_DIR/minimal_init.lua" \
  -c "PlenaryBustedDirectory $SCRIPT_DIR/spec/" \
  -c "qa!"

echo "All tests completed."
