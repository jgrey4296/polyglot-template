#!/usr/bin/env bash
set -euo pipefail

if [[ -n "$TOWNCRIER_CHANGE_DIR" ]]; then
    [[ -n $(fdfind . "$TOWNCRIER_CHANGE_DIR") ]] || fail "There are no fragment changes. Add descriptions of this release."
else
    towncrier check || fail "There are no fragment changes. Add descriptions of this release."
fi
