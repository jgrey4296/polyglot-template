#!/usr/bin/env bash
set -euo pipefail

# Takes 1 arg: The pass number. the rest arg global args
subhead "Pass $1: LuaLaTeX Compiling $TEX_TARGET in $TEX_TARGET_DIR"
pushd "$TEX_TARGET_DIR" || fail "lualatex pass failed to pushd"
declare -a ARGS=(
"--lua=$TEX_LUA_FILE"
"-interaction=nonstopmode"
"--output-directory=$TEX_OUT"
)

case "$VERBOSE" in
    0)
        echo "..."
        lualatex "${ARGS[@]}" "${TEX_TARGET}.tex" > /dev/null || echo "Pass Exit Value: $?"
        ;;
    *)
        lualatex "${ARGS[@]}" "${TEX_TARGET}.tex" || echo "Pass Exit Value: $?"
        ;;
esac
popd || fail "lualatex pass failed to popd"
