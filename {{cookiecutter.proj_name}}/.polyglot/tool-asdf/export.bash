#!/usr/bin/env bash
# export.bash -*- mode: sh -*-
#set -o errexit
set -o nounset
set -o pipefail

# shellcheck disable=SC1091
source "$POLY_SRC/lib/lib.bash"
# shellcheck disable=SC1091
[[ -e "$(poly-dir)/task-util.bash" ]] && source "$(poly-dir)/task-util.bash"

tdot "asdf" "Exporting"
asdf plugin list --urls | sed -E 'N; s/\n//; s/\t//' > "$POLYGLOT_ROOT/.asdf.plugins"
