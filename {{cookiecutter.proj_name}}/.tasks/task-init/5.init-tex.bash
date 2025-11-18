#!/usr/bin/env bash
set -euo pipefail

if [[ -f "$POLYGLOT_ROOT/tex.reqs" ]]; then
    tdot "Initialising Tex"
    mkdir -p "$TEX_OUT"
    asdf cmd texlive deps "$POLYGLOT_ROOT/tex.reqs" > /dev/null
fi
