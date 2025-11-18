#!/usr/bin/env bash
set -euo pipefail

if [[ ! -e "$POLYGLOT_ROOT/book.toml" ]]; then
    echo "NOT FOUND: $POLYGLOT_ROOT/book.toml"
    return
fi

subhead "Building Mdbook"
mdbook build
