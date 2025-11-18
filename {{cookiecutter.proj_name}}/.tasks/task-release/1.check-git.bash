#!/usr/bin/env bash
set -euo pipefail

if [[ -n $(git --no-pager diff) ]]; then
    fail "There are unstaged changes."
fi
