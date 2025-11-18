#!/usr/bin/env bash
set -euo pipefail

if [[ -e "$POLYGLOT_ROOT/.pre-commit-config.yaml" ]]; then
    tdot "Installing pre-commit hooks"
    pre-commit install
fi
