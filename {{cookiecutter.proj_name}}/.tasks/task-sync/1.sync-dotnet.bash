#!/usr/bin/env bash
set -euo pipefail

# must be run sequentially
fdfind ".(cs|fs)proj" "$POLYGLOT_ROOT" --threads=1 --exec dotnet sln add
