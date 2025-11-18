#!/usr/bin/env bash
set -euo pipefail

tdot "Exporting ASDF plugins"
asdf plugin list --urls > "$ASDF_PLUGIN_LIST"
