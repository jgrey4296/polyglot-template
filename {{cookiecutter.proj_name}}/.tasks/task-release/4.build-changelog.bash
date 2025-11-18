#!/usr/bin/env bash
set -euo pipefail


subhead "Generating Changelog"
towncrier build --yes
