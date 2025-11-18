#!/usr/bin/env bash
set -euo pipefail


if [[ ! -e "$POLYGLOT_ROOT/dokka.json" ]]; then
    echo "NOT FOUND: $POLYGLOT_ROOT/dokka.json"
    return
fi
subhead "[kotlin] Running Dokka"
# https://kotlinlang.org/docs/dokka-cli.html
echo "TODO"
# java -jar dokka-cli-2.0.0.jar "$@" "$POLYGLOT_ROOT/dokka.json"
