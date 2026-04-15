#!/usr/bin/env bash
# 3.environment.bash -*- mode: sh -*-
#set -o errexit
set -o nounset
set -o pipefail

# shellcheck disable=SC1091
source "$POLY_SRC/lib/lib.bash"
# shellcheck disable=SC1091
[[ -e "$(poly-dir)/task-util.bash" ]] && source "$(poly-dir)/task-util.bash"

POLY_CTX=$(pushctx "env")

# for each lang/tool, if it has and 'add_env' subcmd, call it
