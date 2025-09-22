#!/usr/bin/env bash
set -euo pipefail
NVIM=${NVIM:-nvim}
INIT="/home/pietrushnic/.config/nvim/tests/minimal_init.lua"
ROOT="/home/pietrushnic/.config/nvim/tests/fixtures"

FAIL=0

shopt -s nullglob
for f in "$ROOT"/*.in.md; do
  name=$(basename "$f" .in.md)
  in_path="$ROOT/$name.in.md"
  out_path="$ROOT/$name.out.md"
  expected_path="$ROOT/$name.expected.md"
  if [[ ! -f "$expected_path" ]]; then
    echo "SKIP: no expected for $name" >&2
    continue
  fi
  echo "RUN: $name"
  "$NVIM" -u "$INIT" --headless -n -c "lua require('tests.run').run('$in_path', '$out_path')" -c 'qa!'
  if diff -u "$expected_path" "$out_path" > /dev/null; then
    echo "OK: $name"
  else
    echo "FAIL: $name" >&2
    echo "--- Expected vs Actual ---" >&2
    diff -u "$expected_path" "$out_path" || true
    FAIL=1
  fi
done

if [[ $FAIL -ne 0 ]]; then
  echo "Some tests failed" >&2
  exit 1
fi
echo "All tests passed" 
