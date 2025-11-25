#!/usr/bin/env bash
set -euo pipefail

subhead "Calculating Version Number"
CURR_VERSION=$(version version)
version "$LEVEL" "set" "+"
version file update-all
NEW_VERSION=$(version version)
echo "Project Version $CURR_VERSION -> $NEW_VERSION"
