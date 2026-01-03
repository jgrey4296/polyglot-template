#!/usr/bin/env bash
# place in $root/.tasks/task-{name}/0.help.bash
# and chmod +x it.
set -o nounset
set -o pipefail

# shellcheck disable=SC1091
source "$POLY_SRC/lib/lib-util.bash"
if [[ -e "$POLYGLOT_ROOT/.tasks/task-util.bash" ]]; then
    source "$POLYGLOT_ROOT/.tasks/task-util.bash"
fi

function print-help () {
    # test args, if the last one is -h or --help
    # print help and exit
    case "${@: -1}" in
        -h|--help) ;;
        *) return ;;
    esac
    echo -e "
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
    exit "${PRINTED_HELP:-2}"
}

function check-environment () {
    tdot "check" "Checking Environment"
    has_failed=0

    # if [[ -z "${BIBLIO_LIB:-}" ]]; then
    #     has_failed=1
    #     echo -e "!-- No BIBLIO_LIB has been defined"
    # fi

    [[ "$has_failed" = 0 ]] || fail "Missing EnvVars"
}

print-help "$@"
check-environment
