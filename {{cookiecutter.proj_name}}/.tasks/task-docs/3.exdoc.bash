#!/usr/bin/env bash
set -euo pipefail

if [[ ! -e "$POLYGLOT_ROOT/mix.exs" ]]; then
    echo "NOT FOUND: $POLYGLOT_ROOT/mix.exs"
    return
fi
subhead "[elixir] Building ExDoc"
mix docs --output "$DOC_OUT/elixir"
