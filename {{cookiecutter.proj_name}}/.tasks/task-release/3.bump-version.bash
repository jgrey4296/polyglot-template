#!/usr/bin/env bash
set -euo pipefail

subhead "Calculating Version Number"
CURR_VERSION=$(version version)
version "$LEVEL" "set" "+"
NEW_VERSION=$(version version)
echo "Project Version $CURR_VERSION -> $NEW_VERSION"
