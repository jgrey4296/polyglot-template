#!/usr/bin/env bash
set -euo pipefail


function find_tex_file () {
    # Takes 1 or 0 args
    TEX_TARGET_FILE=$(fdfind \
        --full-path \
        --extension ".tex" \
        --base-directory "$SRC_DIR" \
        --max-results 1 \
        "${1:-main.tex}" )

    if [[ -z "$TEX_TARGET_FILE" ]]; then
        fail "Could not find a tex target file"
    fi
    tex_rel_base=$(dirname "$TEX_TARGET_FILE")
    # tex_target_base=$(basename "$TARGET_FILE" ".tex")
    TEX_TARGET_DIR="$SRC_DIR/$tex_rel_base"
}

header "[tex] Lualatex Compilation"
for i in $(seq 1 "$PASSES"); do
    polyglot lang tex luatex-pass "$i"
done
case "$TEX_USE_BIBTEX" in
    1)
        polyglot lang tex bibtex-pass $((++i))
        polyglot lang tex luatex-pass $((++i))
        polyglot lang tex luatex-pass $((++i))
        ;;
    *)
        ;;

esac
header "Finished Tex Compilation to $TEX_OUT"
exit 0
