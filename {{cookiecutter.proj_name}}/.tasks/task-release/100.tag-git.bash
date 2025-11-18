#!/usr/bin/env bash
set -euo pipefail

git add --all
git commit -m "[Release]: ${NEW_VERSION}"
git tag "${NEW_VERSION}"
