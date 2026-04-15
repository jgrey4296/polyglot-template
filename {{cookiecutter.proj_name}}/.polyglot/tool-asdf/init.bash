#!/usr/bin/env bash
# init.bash -*- mode: sh -*-
#set -o errexit
set -o nounset
set -o pipefail

# shellcheck disable=SC1091
source "$POLY_SRC/lib/lib.bash"
# shellcheck disable=SC1091
[[ -e "$(poly-dir)/task-util.bash" ]] && source "$(poly-dir)/task-util.bash"

ASDF_PLUGIN_LIST="$POLYGLOT_ROOT/.asdf.plugins"

# asdf plugin add
if [[ -e "${ASDF_PLUGIN_LIST:-}" ]]; then
    tdot "plugins" "Initialising plugins..."
    while read -r pname url; do
        if [[ -n "$pname" ]]; then
            asdf plugin add "${pname}" "${url}" 2>/dev/null
        fi
    done < "$ASDF_PLUGIN_LIST"
fi

tdot "tools" "Installing tools..."
asdf install 2>/dev/null
