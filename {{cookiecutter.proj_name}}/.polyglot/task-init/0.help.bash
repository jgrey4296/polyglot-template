#!/usr/bin/env bash
# place in $root/.polyglot/tasks/{name}/0.help.bash
# and chmod +x it.
set -o nounset
set -o pipefail

# shellcheck disable=SC1091
source "$POLY_SRC/lib/lib.bash"
# shellcheck disable=SC1091
[[ -e "$(poly-dir)/task-util.bash" ]] && source "$(poly-dir)/task-util.bash"

HELP_TEXT="
usage: polyglot task init [args ...] [-h]

Initialises the polyglot workspace.
Including:
- reading the .temp directory
- asdf plugins
- python/uv
- rust toolchain
- dotnet solution
- jvm
- elixir
- documentation generators


positional arguments:
args          :

options:
-h, --help    : show this help message and exit


"

maybe-print-help "leaf" 0 "$HELP_TEXT" 0 "$@"
