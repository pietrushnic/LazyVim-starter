#!/usr/bin/env bash
set -euo pipefail
NVIM=${NVIM:-nvim}
INIT="/home/pietrushnic/.config/nvim/tests/minimal_init.lua"
FIXTURE="/home/pietrushnic/.config/nvim/tests/fixtures/indented_paragraph.in.md"
OUT="/home/pietrushnic/.config/nvim/tests/fixtures/indented_paragraph.out.md"
$NVIM -u "$INIT" --headless -c "lua require('tests.run').run('$FIXTURE', '$OUT')" -c qa
