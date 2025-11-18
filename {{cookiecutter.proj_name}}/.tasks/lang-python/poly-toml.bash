#!/usr/bin/env bash
set -euo pipefail

echo '
[polyglot.python]
suffixes  = [".py"]
config    = ["pyproject.toml", "ruff.toml", "uv.lock"]
prefix    = "py_"
active    = []

'
