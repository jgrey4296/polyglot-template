#!/usr/bin/env bash
set -euo pipefail


# asdf plugin add
if [[ -e "$ASDF_PLUGIN_LIST" ]]; then
    tdot "Initialising extra asdf plugins"
    while read -r pname url; do
        if [[ -n "$pname" ]]; then
            asdf plugin add "${pname}" "${url}" 2> /dev/null
        fi
    done < "$ASDF_PLUGIN_LIST"
fi
asdf install 2> /dev/null
