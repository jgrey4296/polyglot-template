#!/usr/bin/env bash
set -euo pipefail

if [[ ! -e "$POLYGLOT_ROOT/docfx.json" ]]; then
    echo "NOT FOUND: $POLYGLOT_ROOT/docfx.json"
    return
fi
subhead "[dotnet] Running docfx"
docfx "$POLYGLOT_ROOT/docfx.json"
