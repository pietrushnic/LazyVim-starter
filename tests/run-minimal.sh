#!/usr/bin/env bash
set -euo pipefail
NVIM=${NVIM:-nvim}
INIT="/home/pietrushnic/.config/nvim/tests/minimal_init.lua"
FIXTURE="/home/pietrushnic/.config/nvim/tests/fixtures/bullet_wrap.in.md"
OUT="/home/pietrushnic/.config/nvim/tests/fixtures/bullet_wrap.out.md"
$NVIM -u "$INIT" --headless -c "lua require('tests.run').run('$FIXTURE', '$OUT')" -c qa
