#!/usr/bin/env bash
set -euo pipefail

SRC=shift
soar -s "$SRC" "${@:-}"
